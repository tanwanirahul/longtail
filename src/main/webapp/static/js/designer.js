YUI.add("longtail-css-designer", function(Y){

    function encodeSelector(selector)
    {
        return selector;
    }

    function CSSFormBinding(config) {
        CSSFormBinding.superclass.constructor.apply(this, arguments);
    };

    CSSFormBinding.NAME = "css-designer";

    CSSFormBinding.ATTRS = {
            selector : {value : null},
            node : {value : null},
            form : {value : null},
            handlers : {value : []},
            presets : {value : []}
    };

    Y.extend(CSSFormBinding, Y.Base, {

        initializer : function()
        {
            var node = this.getNode();
            var form = Y.one(this.get("form"));
            Y.log("Initialized CSS Form Editing " + node.get("id") + " in form " + form.get("id"), "info");
            this.initializeForm(form, node);
            this.get("handlers").push(form.on("change",  this.onChange, this));
            this.get("handlers").push(form.on("click",   this.onAction, this));
            this.get("handlers").push(Y.on("custom:css", this.customCss, this));
            this.get("handlers").push(Y.on("custom:cssInit", this.cssInit, this));
            this.get("handlers").push(Y.on("css-preset:selected", this.onPresetSelection, this));
            this.get("handlers").push(Y.on("css-preset:create", this.onPresetCreate, this));
        },
        
        onAction : function(e)
        {
        	if(e.target.get("tagName") == "BUTTON")
        	{
        		var action = e.target.getAttribute("name");
        		if(action == "delete")
        		{
        			var uri = PageData.getServiceUrl("/page/delete"),
        			    node = this.getNode(),
        			    parentId = node.get("parentNode").get("id"),
        			    widgetId = node.get("id");

        		    AjaxRequest(uri, {
        		        'widgetId' : widgetId,
        		        'parent' : parentId,
        		        'path' : PageData.path
        		    }, false);
        		    
        			node.remove();
        			this.destroy();
        		}else if(action == "addSibling")
        		{
        			this.addSibling(e.target.get("value"));
        		}else if(action == "form-settings")
        		{
        			var node = this.getNode();
        			var widgetId = node.get("id");
        			OpenOverlay({href: PageData.servicesBase + '/admin/forms/edit?formUuid=' + widgetId,
        				headerContent: 'Form Settings <span class="close"></span>',
        				srcElement: null,
        				type: 'form', 
        				centered : true,
        				iframe: true,
        				closeOnSubmit: false});
        		}else if(action == "slideshow")
        		{
        			var value = e.target.get("value");
        			var node = this.getNode();
        			var widgetId = node.get("id");
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
            		    AjaxRequest(uri, {
            		        'widgetId' : slideId
            		    }, false);
            		    node.ss.removeCurrent();
        			}else if(value == "next")
        			{
        				node.ss.advance();
        			}else if(value == "previous")
        			{
        				node.ss.previous();
        			}
        		}
        	}
        },
        
        _addSibling : function(node, type)
        {
        	if(node){
        		AjaxRequest(PageData.servicesBase + "/page/addSibling", 
        			{w: node.get('id'), type: type, path: PageData.path}, function(text){
        			 var json = Y.JSON.parse(text);
        			 if(json.action == "refresh"){
        				var node = Y.one("#" + json.id);
        				new WidgetHTMLInsert(node, function(){
        					EditInterface.selectWidget('#' + json.newid);
        				}, {replace: true})(json.html);
        			}
        	}, 'POST');
        	}
        },
        
        addSibling : function(type)
        {
        	var node = this.getNode();
        	this._addSibling(node, type);
        },

        cssInit : function(e)
        {
            var node = e.node;
            var form = Y.one(this.get("form"));
            var currentNode = this.getNode();

            if(form.contains(node))
            {
                Y.longtail.forms.setValues(form, function(name)
                {
                    if(name != "selector")
                    {
                        return CSSUtils.getTextValue(name, currentNode);
                    }
                }, true);
            }
        },

        onPresetCreate : function(e)
        {
            var node = Y.one(e.node), form = Y.one(this.get("form"));
            if(!form.contains(node)) return;

            var uri = PageData.getServiceUrl("/styles/create");
            var self = this;
            var selector = (this.get("selector") + " " + (e.selector || "")).trim();
            AjaxRequest(uri, e.params, function(txt){
                var json = Y.JSON.parse(txt);
                self.selectPreset(node, selector, json.uuid, json.cssText);
            });
        },

        selectPreset: function(node, cSelector, id, cssText, type)
        {
            Y.log("Selected Preset : " + id, "debug");

            var pStyles = Y.StyleSheet("presetStyles");
            var cssObj = this.parseCssText(cssText);
            cssObj = this.normalizeCSS(cssObj);
            pStyles.set(cSelector, cssObj);
            this.get("presets").push({cssId: id, selector: cSelector});

            var pSels = node.ancestor('.preset-selections');
            if(pSels)
            {
                pSels.all('.selected-uuid').removeClass('selected-uuid');
                pSels.all("div[data-uuid='" + id + "']").addClass('selected-uuid');
            }

            // Set the preset in the drop-down
            if(type && type != 'content-image')
            {
                var dds = node.ancestor("form").all(".yui3-dropdown[data-type=" + type + "]");
                var node = CSSUtils.swatch(type, {uuid: id, cssStyles: cssText});
                dds.set("innerHTML","");
                dds.append(node);
            }
        },

        onPresetSelection : function(e)
        {
            var node = Y.one(e.node), form = Y.one(this.get("form"));
            if(!form.contains(node)) return;
            var cSelector = (this.get("selector") + " " + (e.selector || "")).trim();
            this.selectPreset(node, cSelector, e.cssId, e.cssText, e.type);
        },

        parseCssText : function(cssText)
        {
            var rules = cssText.split(";")
            var css = {};
            for(var i in rules)
            {
                if(rules.hasOwnProperty(i) && rules[i].length > 1)
                {
                    var s = rules[i].split(":")[0].replace(/(-)([a-z])/g, function(m, p1, p2){return p2.toUpperCase()});
                    var v = rules[i].substring(rules[i].indexOf(":") + 1);
                    s = s.trim(), v = v.trim();
                    if(css[s] && ( (Y.UA.gecko && css[s].match(/-moz/)) || (Y.UA.webkit && css[s].match(/-webkit/)) ) )
                    {
                        continue;
                    }else{
                        css[s] = v;
                    }
                }
            }

            return css;
        },

        getNode : function()
        {
            var node = this.get("node");

            if(node != null)
            {
                node = Y.one(node);
            }

            if(node == null)
            {
                node = Y.one(this.get("selector"));
            }

            return node;
        },

        customCss : function(e)
        {
            var node = Y.one(e.node);
            var form = Y.one(this.get("form"));

            if(!form.contains(node))
            {
                // Not of Interest
                Y.log("Skipping editor as it isn't a sub-child","info");
                return;
            }else
            {
                var css = e.css ? e.css : this.parseCssText(e.cssText);
                var updatedCss = {};
                var currentNode = this.getNode();
                for (var i in css)
                {
                    if (css.hasOwnProperty(i))
                    {
                        updatedCss = Y.merge(updatedCss, CSSUtils.getCSS(i, css[i], currentNode));
                    }
                }

                this.apply(updatedCss, e.selector);
                this.save(updatedCss, e.selector);
            }
        },

        initializeForm : function(form, node)
        {
            Y.longtail.forms.setValues(form, function(name)
            {
                if (name != "selector")
                {
                    return CSSUtils.getTextValue(name, node);
                }
            });
            
            if(node.hasClass("rich-text"))
            {
            	var close = Y.one(".yui3-overlay-content-image .done");
            	if(close) close.simulate("click");
            }else if(node.hasClass("image-div"))
            {
            	var close = Y.one(".yui3-overlay-Font .done, .yui3-overlay-FontColor .done");
            	if(close) close.simulate("click");
            }
            
            if(node.hasClass("image-div") && Y.one(".yui3-overlay-content-image") == null)
            {
            	var src = CSSUtils.getTextValue("src", node);
            	if( src && (src.match(/.*sample_logo.png/) || src.match(/.*no_img.jpg/)))
            	{
            		var filter = src.match(/.*sample_logo.png/) ? "Logos" : "General";
            		EditInterface.openItemBrowse(form.one(".field-extension"), 'content-image', filter);
            	}
            }
        },

        onChange : function(e)
        {
            var changeNode = e.target;
            var name = changeNode.get("name");

            if(!name || name == "selector" || name == "")
            {
                return;
            }
            
            var node = this.getNode();
            var value = Y.longtail.forms.getValue(Y.Node.getDOMNode(changeNode));
            var css = CSSUtils.getCSS(name, value, node);

            // Updates UI in-place for a change in type ("h1"/"h2"/"p"/etc.) of text data-item
            // TODO: If node contains any block element(s), system MUST NOT allow user to change it to an inline element
            if (name == "attr_type")
            {
                var nodeStr = node.get("outerHTML");
                // FIXME: HACK for Firefox, which doesn't support outerHTML
                if (!nodeStr && XMLSerializer)
                {
                    nodeStr = new XMLSerializer().serializeToString(node.getDOMNode()).replace(/ xmlns="[^"]+"/, "");
                }
                value = !value || value == "" ? "div" : value;
                nodeStr = nodeStr.replace(/^<[^ ]+/, "<" + value)
                                 .replace(/\/[^>]+>/, "/" + value + ">")
                                 .replace(/attr_type="[^"]+"/, "attr_type=\"" + value + "\"");
                node.replace(Y.Node.create(nodeStr));
            }

            var selector = null;
            if(changeNode.ancestor("fieldset") && changeNode.ancestor("fieldset").getAttribute("data-selector"))
            {
                selector = changeNode.ancestor("fieldset").getAttribute("data-selector");
            }

            if (css)
            {
                this.apply(css, selector);
                this.save(css, selector);
                this.updateForm(css);
            }
        },

        updateForm : function(css)
        {
            var count = 0;

            for(var i in css)
            {
                if(css.hasOwnProperty(i))
                {
                count++;
                }
            }

            if(count > 1)
            {
                var node = this.getNode();
                var form = Y.Node.getDOMNode(Y.one(this.get("form")));
                for(var i in css)
                {
                    if(css.hasOwnProperty(i))
                    {
                    var name = i, cNode = node;
                    var el = form[name];
                    if(el){
                        if(Y.one(el).ancestor("fieldset") != null && Y.one(el).ancestor("fieldset").getAttribute("data-selector"))
                        {
                            var subSel = Y.one(el).ancestor("fieldset").getAttribute("data-selector");
                            cNode = node.one(subSel);
                        }

                        if(cNode)
                        {
                            var value = CSSUtils.getTextValue(name, cNode);
                            Y.longtail.forms.setFormValue(el,el.type, value, true);
                        }
                    }
                    }
                }
            }
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

        apply : function(css, subSelector)
        {
        	var css = this.normalizeCSS(css);
            var selector = this.get("selector");
            var node = this.get("node");

            if(css.fontFamily)
            {
                Y.Get.css('http://fonts.googleapis.com/css?family=' + css.fontFamily);
                this.get("form").all(".yui3-dropdown[data-type=Font]").set("innerHTML",'<span style="font-family: ' + css.fontFamily + '">' + css.fontFamily + "</span>");
            }

            if(selector != null)
            {
                CSSUtils.applyCSS(subSelector ? selector + " " + subSelector : selector, css);
            }else if(node != null)
            {
                subSelector ? node.all(subSelector).setStyles(css) : node.setStyles(css);
            }

            Y.log("Applying CSS sel : " + subSelector + ":" + Y.JSON.stringify(css),"info");
            this.fire("apply",css);
        },

        save : function(css, subSelector)
        {
            var nodeId = this.getNode().get("id");
            Y.longtail.SaveQueue.save("custom-styles", {node: nodeId, selector: subSelector, styles : css});
        },

        destructor : function(e)
        {
            var handlers = this.get("handlers");
            for(var i in handlers)
            {
                if(handlers.hasOwnProperty(i))
                {
                if(handlers[i].detach)
                {
                    handlers[i].detach();
                }

                if(handlers[i].cancel)
                {
                    handlers[i].cancel();
                }
                }
            }
        }
    });

    var InlineStyle = {
        get: function(name, node)
        {
            return node.getStyle(name);
        },

        set: function(name, value, node)
        {
            var css = {};

            css[name] = value;
            // Adding IE7 hack for inline-block
            if (name == "display" && value == "inline-block")
            {
                css["*display"] = "inline";
                css["zoom"] = "1";
            }

            return css;
        }
    };

    var Attr = {
        get: function(name, node)
        {
            return node.getAttribute(name);
        },

        set: function(name, value, node)
        {
            node.setAttribute(name, value);
        }
    };
    
    var AttrFetcher = {
    	get : function(name, node)
    	{
    		return node.getAttribute(name);
    	},
    	
    	set : function(name, value, node)
    	{
    		Y.longtail.DataUpdater.saveElementValue(node, name.replace(/attr_/,""), value);
    	}
    };

    var PxStyle = {
        get: function (name, node)
        {
            var val = parseInt(node.getComputedStyle(name, node));
            return Y.Lang.isNumber(val) ? val : 0;
        },

        set: function(name, value, node)
        {
            var css = {};

            if(value!=null && value.match(/^[+-]*[0-9]+[.]*[0-9]*$/))
            {
               value = parseInt(value) + "px";
            }

            css[name] = value;
            return css;
        }
    }
    
    var VendorPrefixed = function(delegate){
    	this.delegate = delegate;
    };
    
    VendorPrefixed.prototype.get = function(name, node){
		var name = BROWSER_COMPAT.getEq(name);
		return this.delegate.get(name, node);
	}
    
    VendorPrefixed.prototype.set = function(name, value, node){
		return this.delegate.set(name, value, node);
	}
    
    var PropNameGetSubstitute = function(delegate, name){
    	this.delegate = delegate;
    	this.name = name;
    }
    
    PropNameGetSubstitute.prototype.get = function(name, node){
		return this.delegate.get(this.name, node); // A fixed name is used for getting the property 
	}
    
    PropNameGetSubstitute.prototype.set = function(name, value, node){
		return this.delegate.set(name, value, node);
	}
    
    var PropNameCombine = function(name, fields)
    {
    	this.name = name;
    	this.fields = fields;
    }
    
    PropNameCombine.prototype.get = function(name, node){
		var value = null;    	
    	if(name == this.name)
    	{
    		for(var i in this.fields)
    		{
    			if(this.fields.hasOwnProperty(i))
    			{
	    			var m = PxStyle.get(this.fields[i], node);
	    			if(value && m != value)
	    			{
	    				value = "-";
	    				break;
	    			}else {
	    				value = m;
	    			}
    			}
    		}
    	}else{
    		value = PxStyle.get(name, node);
    	}
    	
		return value;
	}
    
    PropNameCombine.prototype.set = function(name, value, node){
		
		if(name != this.name)
		{
			return PxStyle.set(name, value, node);
		}
		
		var css = {};
		for(var i in this.fields)
		{
			if(this.fields.hasOwnProperty(i))
			{
				css = Y.merge(css, PxStyle.set(this.fields[i], value, node));
			}
		}
		
		return css;
	}
    
    var marginPropsSet = new PropNameCombine("margin", ["marginTop", "marginRight", "marginBottom", "marginLeft"]);
    var paddingPropsSet = new PropNameCombine("padding", ["paddingTop", "paddingRight", "paddingBottom", "paddingLeft"]);
    var borderWidthSet = new PropNameCombine("borderWidth", ["borderTopWidth", "borderRightWidth", "borderBottomWidth", "borderLeftWidth"]);
    
    var CSSUtils = {
        _fetchers : {
            "src":{
                get: function(name, node){
                    node = node.get("tagName") == "IMG" ? node : node.one("img");
                    if (node == null) return null;
                    return node.getAttribute("src");
                },
                set: function(name, value, node){
                	
                	if(node.hasClass("el-list-data-instance"))
                	{
                		node = node.one("li.current > DIV");
                	}
                	
                    var image = node.get("tagName") == "IMG" ? node : node.one("img");
                    if (image == null) return null;
                    image.setAttribute("src", value);
                    Y.longtail.DataUpdater.saveElement(node);
                    
                    Y.later(500, null, function(){
                    	var css = CSSUtils.getCSS('imageaspect', value, node);
                    	Y.longtail.StyleSelector.apply(css, node);
                    	Y.longtail.SaveQueue.save("custom-styles", {node: node.get("id"), styles : css});
                    });
                    
                    return {};
                }
            },
            "alt":Attr,
            "title":Attr,
            "href": {
                get: function(name, node){
                    var anchor = node.get("tagName") == "A" ? node : node.one("a");
                    if (anchor == null) return null;

                    return anchor.getAttribute("href");
                },
                set: function(name, value, node){
                    var anchor = node.get("tagName") == "A" ? node : node.one("a"), value = value.trim();
                    if(anchor == null && value)
                    {
                        anchor = Y.Node.create('<a href="#"></a>');
                        anchor.append(node.get("children"));
                        node.prepend(anchor);
                    }

                    if(value)
                    {
                        anchor.setAttribute("href",value);
                    }else{
                    	node.append(anchor.get("children"));
                    	anchor.remove();
                    }
                    
                    Y.longtail.DataUpdater.saveElementValue(node, "link", value);
                }
             },
            "imgalt": {
                get: function(name, node){
                    node = node.get("tagName") == "IMG" ? node : node.one("img");
                    if (node == null) return null;

                    return node.getAttribute("alt");
                },
                set: function(name, value, node){
                    var img = node.get("tagName") == "IMG" ? node : node.one("img"), value = value.trim();

                    if (img == null) return null;
                    if (value)
                    {
                        img.setAttribute("alt", value);
                    }

                    Y.longtail.DataUpdater.saveElementValue(node, "altText", value);
                }
             },
            "lineHeight" : {
                get: function(name, node) {
                   return parseFloat(node.getComputedStyle("lineHeight")) / parseFloat(node.getComputedStyle("fontSize"));
                },
                set: InlineStyle.set
            },
            "backgroundImage" : {
                get: function(name, node) {
                    var value = node.getComputedStyle("backgroundImage");return value.replace(/url\(["']{0,1}([^"']*)["']{0,1}\)/g,"$1");
                },
                set: function(name, value, node) {
                    return InlineStyle.set("backgroundImage", 'url(\'' + value + '\')', node);
                }
            },
            "width":PxStyle,
            "height":PxStyle,
            "minHeight":PxStyle,
            "left":PxStyle,
            "right":PxStyle,
            "top":PxStyle,
            "bottom":PxStyle,
            "margin":marginPropsSet,
            "marginLeft":PxStyle,
            "marginRight":PxStyle,
            "marginTop":PxStyle,
            "marginBottom":PxStyle,
            "padding":{
                get: function(name, node){
                    return  paddingPropsSet.get(name,node); //FIXME Top padding is used as an alias
                },
                set: function(name, value, node){
                    var cWidth = Utils.totalWidth(node, ["width","paddingLeft","paddingRight","borderRightWidth", "borderLeftWidth"]);
                    var css  = {};
                    node.setStyle("paddingLeft",value);
                    node.setStyle("paddingRight",value);
                    var nWidth = Utils.totalWidth(node, ["width","paddingLeft","paddingRight","borderRightWidth", "borderLeftWidth"]);
                    node.setStyle("paddingLeft","");
                    node.setStyle("paddingRight","");
                    if(cWidth != nWidth)
                    {
                        var diff = nWidth - cWidth;
                        var width = Utils.calc(node, ["width"]) - diff;
                        var wCss = PxStyle.set("width", width + "px", node);
                        css = Y.merge(css, wCss);
                    }
                    
                    css = Y.merge(css, paddingPropsSet.set(name, value, node), true);
                    return css;
                }
            },
            "paddingLeft":PxStyle,
            "paddingRight":PxStyle,
            "paddingTop":PxStyle,
            "paddingBottom":PxStyle,
            "borderWidth": borderWidthSet,
            "borderTopWidth":PxStyle,
            "borderLeftWidth":PxStyle,
            "borderBottomWidth":PxStyle,
            "borderRightWidth":PxStyle,
            "fontSize":PxStyle,
            "float":InlineStyle,
            "borderRadius": new PropNameGetSubstitute(new VendorPrefixed(PxStyle), "borderTopLeftRadius"),
            "borderTopRightRadius":new VendorPrefixed(PxStyle),
            "borderTopLeftRadius":new VendorPrefixed(PxStyle),
            "borderBottomRightRadius":new VendorPrefixed(PxStyle),
            "borderBottomLeftRadius":new VendorPrefixed(PxStyle),
            "zIndex": {
                get: function(name, node) {
                    return node.getComputedStyle("zIndex");
                },
                set: function(name, value, node) {
                    return InlineStyle.set("zIndex",parseInt(value) + "", node);
                }
            },
            "letterSpacing": {
                get: function(name, node){
                    return PxStyle.get(name, node);
                },
                set: function(name, value, node){
                    if(value == 0) value = "normal";
                    return PxStyle.set(name, value, node);
                }
            },
            "fontWeight": {
                get: function(name, node) {
                    return node.getComputedStyle("fontWeight")
                },
                set: function(name, value, node) {
                    return InlineStyle.set("fontWeight", (value == null || value == "null" ? "normal" : value), node);
                }
            },
            "fontStyle": {
                get: function(name, node) {
                    return node.getComputedStyle("fontStyle")
                },
                set: function(name, value, node) {
                    return InlineStyle.set("fontStyle", (value==null || value=="null" ? "normal" : value), node);
                }
            },
            "colorHex" : {
                get: function(name, node){
                    var value = InlineStyle.get("color",node);
                    return Utils.RGBToHex(value);
                },
                set: function(name, value, node){
                    var value = Utils.HexToRGB(value);
                    return InlineStyle.set("color", "rgb(" + value[0] + "," + value[1] + "," + value[2] + ")", node);
                }
            },

            "backgroundColorHex" : {
                get: function(name, node) {
                    var value = InlineStyle.get("backgroundColor",node);
                    return Utils.RGBToHex(value);
                },
                set: function(name, value, node){
                    var value = Utils.HexToRGB(value);
                    return CSSUtils._fetchers["backgroundColor"].set("backgroundColor",
                        "rgb(" + value[0] + "," + value[1] + "," + value[2] + ")", node);
                }
            },
            "backgroundColor" : {
                get: InlineStyle.get,
                set: function(name, value, node) {
                    var color = InlineStyle.get("backgroundColor", node);
                    var opacity = color.replace(/rgb[a]*\(.*,.*,.*,(.*)\)/g,"$1");

                    opacity = opacity == color ? 1.0 : parseFloat(opacity);

                    var withOpacity = value.replace(/rgb\(([0-9 ]+,[0-9 ]+,[0-9 ]+).*/g,"rgba($1," + opacity + ")");
                    return InlineStyle.set("backgroundColor", withOpacity, node);
                }
            },
            "backgroundColorOpacity": {
                 get: function(name, node){
                     var color = InlineStyle.get("backgroundColor", node);
                     var opacity = color.replace(/rgb[a]*\(.*,.*,.*,(.*)\)/g,"$1");

                     opacity = opacity == color ? 1.0 : parseFloat(opacity);

                     return opacity;
                 },
                 set: function(name, value, node){
                     var color = InlineStyle.get("backgroundColor", node);
                     var withOpacity = color.replace(/rgb[a]*\(([0-9 ]+,[0-9 ]+,[0-9 ]+).*/g,"rgba($1," + value + ")");
                     return InlineStyle.set("backgroundColor", withOpacity, node);
                 }
             },
            "MozTransform":InlineStyle,
            "MozBoxShadow":InlineStyle,
            "textAlign":{
                get: function(name, node){
                     var value = InlineStyle.get(name, node);
                     if (value == "start") value = "left";
                     return value;
                },
                set: InlineStyle.set
            },
            "fontFamily" : {
                get: function(name, node){
                     return InlineStyle.get(name, node).split(",")[0];
                },
                set: function(name, value, node){
                    Y.Get.css('http://fonts.googleapis.com/css?family=' + value);
                    return InlineStyle.set(name, value, node);
                }
            },
            "imagesize" : {
            	get : function(){},
            	set : function(name, value, node)
            	{
            		var css = {}, img = node.one("img");
            		if(img)
            		{
	            		img.setStyles({width:'auto',height:'auto'});
	            		node.setStyles({width:'auto',height:'auto'});
	            		
	            		css = Y.merge(css, PxStyle.set("width", PxStyle.get("width", img) + "px", node));
	            		css = Y.merge(css, PxStyle.set("height", PxStyle.get("height", img) + "px", node));
	            		
	            		node.setStyles({width:'',height:''});
	            		img.setStyles({width:'',height:''});
            		}
            		
            		// Y.log(css);
            		
            		return css;
            	}
            },
            
            "imageaspect" : {
            	get : function(){},
            	set : function(name, value, node)
            	{
            		var css = {}, img = node.get("tagName") == "IMG" ? node : node.one("img");
            		if(img)
            		{
	            		img.setStyles({height:'auto'});
	            		node.setStyles({height:'auto'});
	            		css = Y.merge(css, PxStyle.set("height", PxStyle.get("height", node) + "px", node));
	            		node.setStyles({height:''});
	            		img.setStyles({height:''});
            		}
            		
            		return css;
            	}
            	
            }
        },

        getTextValue : function(name, node)
        {
            var fetcher = this._fetchers[name]; ;
            if(fetcher == null)
            {
                fetcher = name.match(/attr_/) ? AttrFetcher : InlineStyle;
            }

            return fetcher.get(name, node);
        },

        getCSS : function(name, value, node)
        {
            var fetcher = this._fetchers[name];

            if(fetcher == null)
            {
                fetcher = name.match(/attr_/) ? AttrFetcher : InlineStyle;
            }

            var css = fetcher.set(name, value, node);

            return css;
        },

        applyCSS : function(sel, css)
        {
            var styleSheet = Y.StyleSheet('customStyles');
            styleSheet.set(sel, css);
        },

        gradient : function(className)
        {
            var tempDiv = Y.one("#_designer_test_div");

            if(!tempDiv)
            {
                tempDiv = Y.Node.create('<div id="_designer_test_div"></div>');
                L.BODY.append(tempDiv);
            }

            tempDiv.set("className","");
            tempDiv.addClass(className);
            var bgImage = tempDiv.getComputedStyle("backgroundImage");

            return bgImage;
        },

        swatch : function(type, p)
        {
            if (type == "content-image")
            {
                var path = getImagePath(p.path);
                var html = '<div class="yui3-dropdown-item content-image-Swatch" data-csstext="src:' + path
                        + 'title="Click to select this Image" onclick="Y.fire(\'custom:css\', {node: this, css: {src : \''
                        + path + '\'}})"/><img src="' + path + '"/></div>';
                return Y.Node.create(html);
            }

            var swatch = Y.Node.create("<div></div>");
            swatch.setAttribute("data-uuid",p.uuid);
            swatch.addClass(type + "-Swatch");
            swatch.addClass(p.uuid);
            swatch.addClass('yui3-dropdown-item');
            
            if(type == "FontColor")
            {
                swatch.set("innerHTML", "AaBb")
            }

            return swatch;
        }
    }

    function OverlayManager(config) {
        OverlayManager.superclass.constructor.apply(this, arguments);
    };

    OverlayManager.NAME = "lt-overlay-manager";

    OverlayManager.ATTRS = {
    };

    OverlayManager.Bindings = [];

    Y.extend(OverlayManager, Y.Base, {

        bindNode : function(form, node)
        {
            var formBinding = new CSSFormBinding({form:form,node:node});
        },

        bindSelector : function(form, selector)
        {
            var formBinding = new CSSFormBinding({form:form,selector:selector});
        },

        createPreset : function(type, filters, select, srcNode)
        {
            if (srcNode && Y.Node(srcNode).ancestor(".styles-section")
                    && Y.Node(srcNode).ancestor(".styles-section").hasClass("disabled")) { return; }

            var overlay = OpenOverlay({
                href: PageData.servicesBase + "/styles/create?type=" + type + '&filters=' + filters,
                headerContent: 'Creating ' + type + ' <span class="close"></span>',
                type: "preset-create",
                closeOnSubmit : false,
                closeOnClickOutside : false,
                showMask: true,
                modal : true
            });

            var delegate = Y.on("formSubmit", function(e){
                var response = Y.JSON.parse(e.response.responseText);
                
                if(response.type == 'image' && type != 'content-image')
                {
                	// Image was just uploaded. We not need to create a preset 
                	// as the image wasn't content image
                	var presetForm = overlay.get("boundingBox").one(".preset-form-create");
                	if(presetForm)
                	{
                		presetForm.one("input[name=img_url]").set("value", getImagePath(response.path));
                	}
                	
                	AjaxFormSubmit(null, presetForm);
                	return;
                }
                
                delegate.detach();
                overlay.close();
                
                var itemBrowser = Y.one(".yui3-overlay-" + type);
                if(itemBrowser)
                {
                    var swatchContainer = itemBrowser.one(".presets-list .preset-swatches");
                    var swatchList = swatchContainer.get("children");
                    var newSwatch = Y.Node.create('<div class="yui3-u yui3-u-1-10"><div class="swatch-container"></div></div>');

                    if(swatchList.size() >= 10 )
                    {
                        swatchList.item(9).remove();
                    }

                    var content = CSSUtils.swatch(type, type == 'content-image' ? response : {uuid: response.uuid, cssStyles: response.cssText});
                    newSwatch.one('.swatch-container').append(content);
                    newSwatch.one('.swatch-container').append(Y.Node.create('<style>' + response.cssText + '</style>'));
                    newSwatch.setStyle("opacity","0");
                    swatchContainer.prepend(newSwatch);
                    newSwatch.transition( {opacity: 1} );
                }
                
                if(select && srcNode)
                {
                	if(response.type == "image")
                	{
                		Y.fire('custom:css', {node: srcNode, css: {src : PageData.contentBase + '/' + response.path}});
                	}else{
                		Y.fire('css-preset:selected', {node: srcNode, cssId: response.uuid, cssText: response.cssText});
                	}
                }

            });

            overlay.on("destroy", function(){delegate.detach();})
        }
    });

    Y.namespace("longtail").Designer = new OverlayManager();
    Y.namespace("longtail").CSSUtils = CSSUtils;
    Y.namespace("longtail").CSSFormBinding = CSSFormBinding;

},"3.1.0",{requires: ["base","node","event-delegate","longtail-form", "stylesheet"]});
