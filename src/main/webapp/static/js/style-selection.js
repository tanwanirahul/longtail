YUI.add("longtail-style-selection", function(Y){
	
    function StyleSelector(config) {
    	StyleSelector.superclass.constructor.apply(this, arguments);
    };

    StyleSelector.NAME = "style-selection";

    StyleSelector.ATTRS = {
            
    };

    var _p_type = {Background:["pr-bg"],
    			BackgroundColor:["pr-bc"],
    			Border:["pr-br"],
    			Effects:["pr-ef"], 
    			Font:["pr-ft"],
    			FontColor:["pr-fc"],
    			LayoutWidth:["pr-lw"],
    			quickstyles: ["qk", "pr"]};

    Y.extend(StyleSelector, Y.Base, {

    	onSelect : function(cfg){
    		var node = this._getNode(cfg.node), css = cfg.css, id = cfg.id, type = cfg.type;  
    		
    		if(node)
    		{
    			var removed = this._removePresets(node, type);
    			node.addClass(id);
    			saveQueue.save("quickstyle-select", {node: node.get("id"), name: id});
    			// FIXME: This is potentially problematic as the number of style-sheets can
    			// increase and be very high
    			var theme = Y.one(id.substring(0,2) == 'qk' ? '#quickStyles' : '#presetStyles');
    			theme.set("textContent", theme.get("textContent") + cfg.css);
    			// theme.set("disabled", true);
    			// theme.set("disabled", false);
    		}
    	},
    	
    	onAction : function(e) {
    		
    		var action = e.target.getAttribute("name"),
    			node = this._getNode(e.target),widgetId = node.get("id"),
    			value = e.target.get("value"),
    			parentId = node.get("parentNode").get("id");
    		
    		if(action == "delete")
    		{
    			var uri = PageData.getServiceUrl("/page/delete");
    		    AjaxRequest(uri, {'widgetId' : widgetId,'parent' : parentId,'path' : PageData.path}, false);
    			node.remove();
    		}else if(action == "addSibling")
    		{
        		AjaxRequest(PageData.servicesBase + "/page/addSibling", {w: widgetId, type: value, path: PageData.path}, function(text){
            			 var json = Y.JSON.parse(text);
            			 if(json.action == "refresh"){
            				var node = Y.one("#" + json.id);
            				new WidgetHTMLInsert(node, function(){
            					EditInterface.selectWidget('#' + json.newid);
            				}, {replace: true})(json.html);
            			}
            	}, 'POST');
    		}else if(action == "form-settings")
    		{
    			OpenOverlay({href: PageData.servicesBase + '/admin/forms/edit?formUuid=' + widgetId,
    				headerContent: 'Form Settings <span class="close"></span>',
    				srcElement: null,
    				type: 'form', 
    				centered : true,
    				iframe: true,
    				closeOnSubmit: false});
    		}else if(action == "slideshow")
    		{
    			var currentSlide = node.one(".current .image-div");
    			var slideId = currentSlide.get("id");
    			
    			if(value == "add")
    			{
            		AjaxRequest(PageData.servicesBase + "/page/addSibling", {w: slideId, type: 'image'}, function(text){
            			var json = Y.JSON.parse(text);
            			if(json.action == "refresh"){
            				var newNode = Y.Node.create(json.html).one("#" + slideId).get("parentNode").next();
            				node.ss.addSlide(newNode);
            		}}, 'POST');
    			}else if(value == "delete")
    			{
        		    var uri = PageData.getServiceUrl("/page/delete");
        		    AjaxRequest(uri, {'widgetId' : slideId}, false);
        		    node.ss.removeCurrent();
    			}else if(value == "next")
    			{
    				node.ss.advance();
    			}else if(value == "previous")
    			{
    				node.ss.previous();
    			}
    		}
    	},
    	
    	onCssFormChange : function(e){
    		var changeNode = e.target, form = e.currentTarget, node = this._getNode(changeNode);
    		var value = Y.longtail.forms.getValue(Y.Node.getDOMNode(changeNode)), name = changeNode.get("name");
    		
    		if(name == "selector")
    		{
    			// Initialize the Form and return
    			this.initializeForm(Y.Node.getDOMNode(form), node);
    			return;
    		}
    		
    		var css = Y.longtail.CSSUtils.getCSS(name, value, node);       
    		this._applyCSSChange(form, node, css);
    	},
    	
    	onCustomCss : function(e){
    	    var node = this._getNode(e.node), css = e.css, changeNode = Y.one(e.node), form = changeNode.ancestor("form");
    	    var updatedCss = {};
    	    for (var i in css)
            {
                if (css.hasOwnProperty(i))
                {
                    updatedCss = Y.merge(updatedCss, Y.longtail.CSSUtils.getCSS(i, css[i], node));
                }
            }
    		
    	    this._applyCSSChange(form, node, updatedCss);
    	},
    	
    	_applyCSSChange : function(form, node, css) {
    	    var nodeId = node.get("id");
            this.apply(css, node);
            Y.longtail.SaveQueue.save("custom-styles", {node: nodeId, styles : css});
    	    this.updateForm(node, form, css);	
    	},
    	
        initializeForm : function(form, node)
        {
            Y.longtail.forms.setValues(form, function(name)
            {
                if (name != "selector")
                {
                    return Y.longtail.CSSUtils.getTextValue(name, node);
                }
            }, true);
        },
    	
        updateForm : function(node, form, css)
        {
	    var form = Y.Node.getDOMNode(form);
            for(var i in css)
            {
                if(css.hasOwnProperty(i))
                {
	                var name = i, el = form[name];
	                if(el){
                        var value = Y.longtail.CSSUtils.getTextValue(name, node);
                        Y.longtail.forms.setFormValue(el, el.type, value, true);
	                }
                }
            }
        },
    	
    	apply : function(css, node)
        {
            var css = this.normalizeCSS(css);

            if(css.fontFamily)
            {
                Y.Get.css('http://fonts.googleapis.com/css?family=' + css.fontFamily);
            }

            node.setStyles(css);
            Y.log("Applied CSS " + Y.JSON.stringify(css), "info");
        },
        
        normalizeCSS : function(css)
        {
        	var processed = {};
        	
        	for(var i in css)
        	{
        		if(css.hasOwnProperty(i))
        		{
        			var newName = BROWSER_COMPAT.getEq(i);
        			processed[newName] = css[i];
        		}
        	}
        	
        	return processed;
        },
    	
    	_getNode : function(el)
    	{
    		var form = Y.one(el).ancestor("form");
    		var selector = form.one("input[name='selector']").get("value");
    		return Y.one(selector);
    	},

    	_removePresets : function(node, type)
    	{
    		var classes = node.get("className").split(" ");
    		var type_ids = _p_type[type];
			var removedClasses = [];
			
			if(type_ids){
				for(var i = 0; i < classes.length; i++)
				{
					for(var j = 0; j < type_ids.length; j++)
					{
						if(classes[i].indexOf(type_ids[j]) == 0)
						{
							node.removeClass(classes[i]);
							removedClasses.push(classes[i]);
						}
					}
				}
			}
			
			return removedClasses;
    	},

    	clearStyles : function(el, type)
    	{
    		var node = this._getNode(el);
    		this._removePresets(node, type);
    		saveQueue.save("quickstyle-remove", {node: node.get("id"), type: type});
    	},
    	
    	createQuickStyle : function()
        {
            OpenOverlay({
                href : PageData.servicesBase + '/admin/styles/edit',
                headerContent : 'Create QuickStyles <span class="close"></span>',
                srcElement : null,
                type : 'quickstyle', 
                centered : true,
                iframe : true,
                closeOnSubmit : false,
                showMask : true,
                modal : true
            });
        }
    });

    
    function SaveQueue(config) {
    	SaveQueue.superclass.constructor.apply(this, arguments);
    };

    SaveQueue.NAME = "save-queue";

    SaveQueue.ATTRS = {
        queue : {value : []}    
    };

    Y.extend(SaveQueue, Y.Base, {
    	
    	initializer : function()
    	{
    		Y.later(5000, this, this.flush, null, true);
    	},
    	
    	save : function(action, cfg)
    	{
    		this.get("queue").push({action:action, cfg: cfg});
    	},
    	
    	flush : function()
    	{
    		var q = this.get("queue");
    		this.set("queue", []);

    		if(q.length > 0)
    		{
    			var command = Y.JSON.stringify(q);
    			AjaxRequest(PageData.getServiceUrl("/styles/save"), {commands: command}, null, "POST");
    			Y.log("Saved all " + command,"debug");
    		}
    	}
    	
    });
    
    var saveQueue = new SaveQueue();
    
    Y.namespace("longtail").StyleSelector = new StyleSelector();
    Y.namespace("longtail").SaveQueue = saveQueue;

    Y.on('quickstyle:selected', Y.longtail.StyleSelector.onSelect, Y.longtail.StyleSelector);
    Y.on('custom:css', Y.longtail.StyleSelector.onCustomCss, Y.longtail.StyleSelector);
	
},"3.1.0",{requires: ["io", "base","node","event-delegate","longtail-form", "stylesheet","json"]});