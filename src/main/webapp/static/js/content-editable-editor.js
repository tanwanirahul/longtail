YUI.add("longtail-editor", function(Y) {

    var EditorManager = function() {
        EditorManager.superclass.constructor.apply(this, arguments);
    };

    Y.extend(EditorManager, Y.Base, {
        _editor: null,

        initializer: function()
        {
            var canvas = Y.one("#canvas");
            canvas.on("click", this.onClick, this);
        },

        onClick: function(e)
        {
        	var currentEdit = Y.one(".editable.editing");
            if (currentEdit && currentEdit.contains(e.target))
            {
                return;
            }

            this.fire("closeAll", e);
        },

        editText: function(textNode)
        {
            this._editor = new ContentEditableEditor(textNode);
            this.once("closeAll", this._editor.close, this._editor);
            return this._editor;
        },

        editHTML: function(textNode)
        {
        	if(textNode.hasClass("editing"))
        	{
        		return;
        	}
        	
        	textNode.addClass("editing");
            var textArea = Y.Node.create("<textarea></textarea>");
            textArea.addClass("edit-html-text-area");
            textArea.set("value",textNode.get("innerHTML"));
            textArea.on("click", function(e){e.stopPropagation();});
            textNode.prepend(textArea);
            this.once("closeAll", function(){
            	textNode.set("innerHTML", textArea.get("value"));
            	textArea.remove();
            	InlineContentEditor.saveElement(textNode);
            	textNode.removeClass("editing");
            });
            this.editArea = textArea;
        },

        
        insertSampleImage: function()
        {
            if (arguments[0] == "insertimage")
            {
                Y.log("Inserting a new image in text area", "info");
                var self = this;
                var images = [];
                var element = this._editor.text.el;
                element.all("img").each(function(e) {images.push(e);});
                Y.config.doc.execCommand.apply(Y.config.doc, arguments);

                element.all("img").each(function(e) {
                    if (images.indexOf(e) == -1)
                    {
                        // Found the new image !!
                        e.simulate("dblclick");
                        e.focus();
                    }
                });
            } else
            {
                Y.log("Executing Doc Command " + arguments, "info");
                Y.config.doc.execCommand.apply(Y.config.doc, arguments);
            }

            return false;
        }
    });

    var editorManager = new EditorManager();
    
    var Editable = function(el)
    {
        this.el = el;
        el.set("contentEditable", "true");
        el.addClass("editing");
        el.focus();
        var containerWidget = el.ancestor(".widget-container");

        if (containerWidget)
        {
            containerWidget.addClass("editing-element");
        }
        
        var selectionDelegate = L.HTML.on("mouseup", Y.longtail.AdvEditor.onSelect);
        var keyDelegate = L.HTML.on("keyup", Y.longtail.AdvEditor.onSelect);

        this.destroy = function()
        {
            el.removeClass("editing");
            el.removeClass("empty-content");
            el.removeAttribute("contentEditable");
            if (containerWidget)
            {
                containerWidget.removeClass("editing-element");
            }
            selectionDelegate.detach();
            keyDelegate.detach();
            Y.one("#textButtonsForm").setStyle("display","none");
        }
        
        this.selectAll = function()
        {
            this.el.focus();
            document.execCommand("selectall", null, false);
        };

        this.saveAndClose = function()
        {
            if (el.hasClass("editable"))
            {
                InlineContentEditor.saveElement(el);
            } else
            {
                InlineContentEditor.saveElement(el.ancestor(".editable"));
            }
            this.destroy();
        }
    };

    function ContentEditableEditor(node)
    {
        this.text = new Editable(node);

        this.close = function() {
            this.text.saveAndClose();
        };
    }

    Y.augment(Editable, Y.EventTarget);
    Y.augment(ContentEditableEditor, Y.EventTarget);

    var InlineContentEditor = {

        saveValue: function(uuid, attr, value) {
            var uri = PageData.getServiceUrl("/data/update");
            var params = {
                    'uuid': uuid
                };
            params[attr] = value;
            AjaxRequest(uri, params, false, 'POST');
        },

        saveElementValue: function(el, attr, value)
        {
            var uuid = el.get("id");
            InlineContentEditor.saveValue(uuid, attr, value);
        },

        saveElement: function(el)
        {
            if (!el)
            {
                throw "Saving Null Element ";
            }

            var htmlValue = el.hasClass("image-div") ? el.one("img").getAttribute("src") : el.get("innerHTML");
            var attr = el.hasClass("image-div") ? 'path' : 'text';
            InlineContentEditor.saveElementValue(el, attr, htmlValue);
        }
    };

    var ToggleEditor = {

            onEdit: function(e)
            {
                var element = e.currentTarget.ancestor("li");
                var path = element.getAttribute("togglePath");

                if (element.hasClass("state-enabled")) {
                    element.removeClass("state-enabled");
                    element.addClass("state-disabled");
                    e.currentTarget.set("title", "Click to Enable");
                    InlineContentEditor.saveValue(path, "disabled");
                } else {
                    element.removeClass("state-disabled");
                    element.addClass("state-enabled");
                    e.currentTarget.set("title", "Click to Disable");
                    InlineContentEditor.saveValue(path, "enabled");
                }
            }
        };

    var LinkEditor = {

        onEdit: function(el)
        {
            var linkNode = Y.one(el);
            var href = linkNode.get("href");
            var link = prompt('Please provide the link', href);

            if (link == null)
            {
                return;
            }

            if (link == "")
            {
                linkNode.set("href", "#");
                var enabledParent = linkNode.ancestor('.state-enabled');
                if (enabledParent)
                {
                    enabledParent.addClass('state-disabled');
                    enabledParent.removeClass('state-enabled');
                }
            } else
            {
                linkNode.set("href", link);
                var disabledParent = linkNode.ancestor('.state-disabled');
                if (disabledParent)
                {
                    disabledParent.removeClass('state-disabled');
                    disabledParent.addClass('state-enabled');
                }
            }

            var editPath = linkNode.getAttribute("editpath");
            InlineContentEditor.saveValue(editPath, link);
        }
    };
    
    
    
	function YuiEditor(config) {
		YuiEditor.superclass.constructor.apply(this, arguments);
    };

    YuiEditor.NAME = "css-designer";
    
	var host = {
		    getInstance: function(){return Y;},
		    on : function(){Y.on.apply(Y,arguments)}
		}

    var execCommand = new Y.Plugin.ExecCommand({host:host});
	host.exec = execCommand; 
	
    Y.extend(YuiEditor, Y.Base, {
    	exec : function(cmd, value, el){
    		if(cmd == "clearstyles")
    		{
    			var el = Y.one(el);
    			var selection = new Y.Selection();
				var selectionText = selection.text;
				execCommand.command("insertandfocus",selectionText);
    		}else if(cmd == 'increasefontsize' || cmd == 'decreasefontsize'){
    			var selection = new Y.Selection();
				var selectionText = selection.text;
				var selectedNode = selection.getSelected();
				var fontSize = selectedNode.size() > 0 ? selectedNode.item(0).getStyle('fontSize') : 10; 
				
				if(!fontSize)
				{
					fontSize = '10';
				}
				
				fontSize = cmd == 'increasefontsize' ? (parseInt(fontSize) + 1) : (parseInt(fontSize) - 1);
				selectedNode.setStyle('fontSize',fontSize + 'px');
    		}else{
    			execCommand.command(cmd, value);
    			Y.log("Executing " + cmd + " " + value);
    		}
    	},
    	
    	onSelect : function(e)
    	{
    		var selected = new Y.Selection();
    		var selectionText = selected.text;
    		var node = Y.one("#textButtonsForm");
    		
    		if(selectionText)
    		{
    			Y.log("Selected " + selectionText);
    			node.setStyle("display","block");
    			var editable = Y.one(".rich-text.editing");
    			var pos = editable.getXY();
    			node.setXY([pos[0] + 20, pos[1] - 35]);
    		}else{
    			node.setStyle("display","none");
    		}
    	}
    });
    
    Y.namespace("longtail").Editor = ContentEditableEditor;
    Y.namespace("longtail").DataUpdater = InlineContentEditor;
    Y.namespace("longtail").ToggleEditor = ToggleEditor;
    Y.namespace("longtail").LinkEditor = LinkEditor;
    Y.namespace("longtail").EditorManager = editorManager;
    Y.namespace("longtail").AdvEditor = new YuiEditor();;

}, "3.3.0", {requires: ["node", "event", "longtail-overlay-panel","selection","exec-command","createlink-base"]});