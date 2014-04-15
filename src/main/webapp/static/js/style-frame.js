YUI.add("longtail-styleframe", function(Y){

	var CFG_REPO = {
			  // ".section.absolute .widget" : {enabled: true, width: true, height: true, minHeight: true, group: "widget-frames-outside"},
			  ".slideshow-gallery" : {enabled: true, width: true, height: true, minHeight: false, group: "widget-frames-outside"},
			  ".el-widget-instance .el-widget-instance" : {enabled: true, width: false, height: true, minHeight: true, group: "widget-frames"},
			  ".el-widget-instance .el-leaf-widget" : {enabled: true, width: false, height: true, minHeight: true, group: "widget-frames"},
			  ".el-leaf-widget" : {enabled: true, width: true, height: true, minHeight: true, group: "widget-frames-outside"},
			  ".image-div" : {enabled: true, width: true, height: true, minHeight: false, group: "element-frames"},
			  ".rich-text, .html-text" : {enabled: true, width: true, height: true, minHeight: true, group: "element-frames"},
			  ".el-navigation-data-item" : {enabled: true, width: true, height: true, minHeight: true, group: "element-frames"},
			  "form" : {enabled: true, width: true, height: true, minHeight: true, group: "form-frames"},
			  "#canvas" : {enabled: false, width: false, height: false, minHeight: true, group: "canvas-frames"},
			  // ".link": {enabled: true, width: true, height: true, minHeight: false, group: "link-element-frames"},
			  "*": {enabled: false, width: false, height: false, minHeight: true, group: "element-frames"}
			};

	function getResizeCfg(node){
	    var resizeCfg = null;
	    for(var i in CFG_REPO)
	    {
	      if(CFG_REPO.hasOwnProperty(i) && node.test(i))
	      {
	        resizeCfg = CFG_REPO[i];
	        break;
	      }
	    }
	    return resizeCfg;
	}

	
    function StyleFrame(config) {
        StyleFrame.superclass.constructor.apply(this, arguments);
    };

    StyleFrame.NAME = "styleframe";

    StyleFrame.ATTRS = {
       node : {value : null},
       group : {value : null},
       handlers : {value : []},
       resizeCfg : {value : {enabled: true, width: true, height: true, minHeight: false}}
    };

    function StyleFrameManager()
    {
        StyleFrameManager.superclass.constructor.apply(this, arguments);
    };

    StyleFrameManager.NAME = "styleframe-manager";

    StyleFrameManager.ATTRS = {};

    Y.extend(StyleFrameManager, Y.Base, {
        _fireHandler : function(e, event)
        {
            var handler = this.get("handler");
            if (handler) {
                handler.fire(event, e);
            }
        },

        getNode : function()
        {
            var frame = this.get("frame");
            return frame ? frame.get("node") : null;
        },
        
        highlight : function()
        {
        	var frame = this.get("frame");
        	
        	if(frame != null && !frame.get("hidden"))
        	{
        		var box = frame.get("styleFrameBox");
        		box.setStyles({visibility: 'visible', backgroundColor:'#008', opacity: '0.0', delay: .2});
        		box.scrollIntoView();
        		box.transition({opacity: '0.5'}, function(){
        			box.transition({opacity: '0.0'}, function(){
        				box.setStyles({visibility: 'hidden', opacity: '1.0'});
        			});
        		});
        	}
        },
        
        showNode : function(node)
        {
        	var resizeCfg = getResizeCfg(node);
        	return this.show({node: node, group: resizeCfg.group,
                resizeCfg : resizeCfg});
        },

        show : function(cfg)
        {
            var frame = this.get("frame"), handler = this.get("handler");

            if (!frame)
            {
                frame = new StyleFrame(cfg);
                this.set("frame", frame);
                frame.render();
                frame.on("edit-styles", this._fireHandler, this, "edit-styles");
                frame.on("delete", this._fireHandler, this, "delete");
                frame.on("delete", this.close, this);
                frame.on("moved", this._fireHandler, this, "moved");
                frame.on("resized", this._fireHandler, this, "resized");
                frame.on("destroy", this._fireHandler, this, "destroy");
            }

            if (handler)
            {
                handler.detachAll();
            }

            var cNode = frame.get("node");

            if (cNode != cfg.node)
            {
                frame.set("node", cfg.node);
                frame.set("group", cfg.group);
                frame.set("resizeCfg",cfg.resizeCfg);
                frame.display();
            }else if (frame.get("hidden"))
            {
                frame.display();
            }

            frame.syncUI();

            var handler = new Y.EventTarget();
            this.set("handler", handler);

            return handler;
        },

        sync : function(later)
        {
            var frame = this.get("frame");
            frame && frame.syncUI();
            
            if(frame && later)
            {
            	Y.later(1000, frame, frame.syncUI);
            }
        },

        close : function()
        {
            var frame = this.get("frame"), handler = this.get("handler");
            Y.LUI.enableState("widget-styles-enabled");
            if (frame) {
                frame.hide();
                frame.set("node",null);
            }
            if (handler){
                handler.fire("destroy");
                handler.detachAll();
            }
        }
    });

    var frameManager = new StyleFrameManager();

    Y.one("#canvas").on("mousedown", function(e){
        var node = frameManager.getNode();
        if (!node || !node.contains(e.target))
        {
            frameManager.close();
            Y.LUI.enableState("widget-styles-enabled");
        }
    });

    Y.extend(StyleFrame, Y.Widget, {

        initializer : function()
        {
            // Y.on("elements:adjust", this._updateUI, this);
    		this.on("nodeChange", function(){
    			var contentBox = this.get("contentBox");
    			contentBox.setStyle('opacity', 0);
            	contentBox.transition({opacity: 1, easing: 'ease-in', delay: 0, duration: 0.3});
    		});
        },

        hide : function()
        {
            this.set("hidden", true);
            this.get("boundingBox").addClass("yui3-styleframe-hidden");
        },

        display : function()
        {
        	var group = this.get("group");
        	if(group != "canvas-frames")
        	{
	            var bBox = this.get("boundingBox");
	            var styleBar = bBox.one(".style-bar")
	            
	            if (group != "element-frames" && group != "form-frames")
	            {
	            	styleBar.setStyle("height","2px");
	            	styleBar.transition({height: "20px", delay: 0, duration: 0.3});
	            }
	            
	            bBox.removeClass("yui3-styleframe-hidden");
	            this.set("hidden", false);
	        }
        },

        detachAll : function()
        {
            var handlers = this.get("handlers");

            for(var i in handlers)
            {
                if(handlers.hasOwnProperty(i))
                {
                    handlers[i].detach();
                }
            }
        },

        _updateUI : function()
        {
            var contentBox = this.get("contentBox"), 
            	styleFrameBox = this.get("styleFrameBox"),
            	node = this.get("node");
            
            if(node == null)
            {
            	return;
            }
            
            var xy = node.getXY(), width = Utils.totalWidth(node), 
            	height = Utils.totalHeight(node),
            	bodyXY = L.BODY.getXY();
            	
            	contentBox.setStyles({left: (xy[0] - bodyXY[0]) + "px", top: (xy[1] - bodyXY[1]) + "px"});
            	styleFrameBox.setStyles({width: width + "px", height: height + "px"});
	            
            // Y.log("Updated Frame position and dimensions " + xy + " - " + width + "x" + height, "debug");
        },

        syncUI : function()
        {
            var node = this.get("node");

            if(node == null)
            {
                return; // Nothing to do
            }

            this._updateUI();
            var column = node.ancestor(".el-widget-instance,#canvas");
            var contentBox = this.get("contentBox");

            var region = null;

            if (column)
            {
                region = column.get("region");
                region.left  = region.left + parseInt(column.getComputedStyle("paddingLeft"));
                region.right = region.right - parseInt(column.getComputedStyle("paddingRight"));
                region.top   = node.getY() - parseInt(node.getComputedStyle("marginTop"));
                // Y.log("Top Calculation " + node.getY() + " - " + node.getComputedStyle("marginTop"));
            }else
            {
                region = L.CANVAS.get("region");
            }
            region.bottom = 99999;

            // Y.log("Constraining Move to Region " + Y.JSON.stringify(region), "debug");
            contentBox.dd.plug(Y.Plugin.DDConstrained, {constrain : region});
            this.get("resizer").set("constrain", region);
        },

        renderUI : function()
        {
            var group = this.get("group");
            var boundingBox = this.get("boundingBox");
            boundingBox.addClass("yui3-frame-" + group);
            var contentBox = this.get("contentBox");
            this.get("handlers").push(Y.on("click", Y.bind(this.fire, this, "clicked"), boundingBox));

            var node = this.get("node");
            contentBox.append(Y.Node.create('<div class="style-bar"><div class="tc" title="Adjust Position"></div>\
                    <div class="delete" title="Delete"></div><div class="edit-styles" title="Styles"></div>\
                    <div class="grab" title="Move"></div></div>'));
            contentBox.append(Y.Node.create('<div class="style-frame-box"><div class="top" title="Move Top"></div>\
                    <div class="left" title="Move Left"></div><div class="right" title="Move Right"></div>\
                    <div class="bottom" title="Move Bottom"></div></div>'));
            contentBox.plug(Y.Plugin.Drag);

            boundingBox.plug(Y.Plugin.Drag);
            boundingBox.dd.addHandle(".grab");
            this.get("handlers").push(boundingBox.dd.on("drag:start", Y.bind(this._onGrabStart, this)));
            this.get("handlers").push(boundingBox.dd.on("drag:end", Y.bind(this._onGrabEnd, this)));
            this.get("handlers").push(boundingBox.dd.on("drag:drag", Y.bind(this._updatePosition, this)));

            contentBox.dd.addHandle(".tc");
            this.get("handlers").push(contentBox.dd.on("drag:start", Y.bind(this._onDragStart, this)));
            this.get("handlers").push(contentBox.dd.on("drag:end", Y.bind(this._onDragEnd, this)));
            this.get("handlers").push(contentBox.dd.on("drag:drag", Y.bind(this._setPosition, this)));

            var styleFrameBox = this.get("contentBox").one(".style-frame-box");
            this.set("styleFrameBox",styleFrameBox);

            var resizer = new Y.Resize({node : styleFrameBox, handles : "r, b, br"});
            this.set("resizer", resizer);
            this.get("handlers").push(resizer.on("resize:resize", Y.bind(this._setDimensions, this)));
            this.get("handlers").push(resizer.on("resize:end", Y.bind(this._onResizeEnd, this)));
        },

        _onDragEnd : function()
        {
            this._setDimensions();
            var node = this.get("node");
            var widget = node.ancestor(".el-widget-instance");
            if (widget)
            {
                widget.removeClass("yui3-styleframe-dragging");
            }
            this.fire("moved", {marginLeft: node.getComputedStyle("marginLeft"), marginTop: node.getComputedStyle('marginTop')});
            // Y.LUI.enableState('widget-styles-enabled');
        },

        _onDragStart: function()
        {
            var node = this.get("node");
            var widget = node.ancestor(".el-widget-instance");
            if (widget) { widget.addClass("yui3-style-frame-dragging"); }
            // Y.LUI.disableState('widget-styles-enabled');
        },

        _onGrabEnd : function()
        {
            Y.log("Ending Grab. Saving Changes.", "info");
            // Y.LUI.enableState('widget-styles-enabled');

            // To reset top and left margins (may have been set during a prior drag) of the node
            var node = this.get("node");
            node.setStyles({marginLeft: "0", marginTop : "0"});
            this.fire("moved", {marginLeft: "0", marginTop: "0"});

            this.fire("grab:end", {movedNode: this.get("node")});

            var dropper = this.get("dropper");
            dropper.onDrop();
            dropper.destroy();
            var contentBox = this.get("styleFrameBox");
            contentBox.setStyles({left: "", top: ""});
            
            this.get("boundingBox").setStyles({left: "", top: ""});
            this.set("dropper", null);
        },

        _onGrabStart: function(e)
        {
            // Y.LUI.disableState('widget-styles-enabled');
            Y.log("Grabbed Widget. Starting to Move & Drag.", "info");
            var node = this.get("node");
            var parent = node.ancestor(".column").get("id");
            var contentBox = this.get("styleFrameBox");
            contentBox.append(node);
            contentBox.setXY(e.target.mouseXY);
            var dropper = new Y.longtail.WidgetDropper({node: node, parent: parent});
            this.set("dropper",dropper);
        },

        _updatePosition : function(e)
        {
            var contentBox = this.get("styleFrameBox");
            if(contentBox == null)
            {
                Y.log("ContentBox is null", "error");
            }
            var p = contentBox.getXY();
            var dropper = this.get("dropper");
            dropper.updatePosition(p);
        },

        bindUI : function()
        {
            var boundingBox = this.get("boundingBox");
            this.get("handlers").push(boundingBox.on("click", Y.bind(this.fire, this, "edit-styles")));
            this.get("handlers").push(Y.delegate("click", Y.bind(this.fire, this, "delete"), boundingBox, ".delete"));
            this.on("groupChange", function(e){
                boundingBox.removeClass("yui3-frame-" + e.prevVal);
                boundingBox.addClass("yui3-frame-" + e.newVal);
            });
        },

        _setDimensions : function(e)
        {
            var contentBox = this.get("styleFrameBox");
            var node = this.get("node");
            var resizeCfg = this.get("resizeCfg");

            if (resizeCfg.width)
            {
                node.setStyle("width",  Utils.calc(contentBox,["width"])
                    - Utils.calc(node, ["paddingLeft", "paddingRight", "borderRightWidth", "borderLeftWidth"]));
            }
            if (resizeCfg.height)
            {
                var height = Utils.calc(contentBox,["height"])
                        - Utils.calc(node, ["paddingTop", "paddingBottom", "borderTopWidth", "borderBottomWidth"]);
                if (!resizeCfg.minHeight)
                {
                    node.setStyle("height", height);
                }else
                {
                    node.setStyle("minHeight", height);
                    contentBox.setStyle("height", node.getComputedStyle("height"));
                }
            }

            if (parseInt(node.getComputedStyle("height")) > parseInt(contentBox.getComputedStyle("height")))
            {
                contentBox.setStyle("height", node.getComputedStyle("height"));
            }
        },

        _onResizeEnd : function()
        {
            var node = this.get("node");
            var contentBox = this.get("styleFrameBox");
            var resizeCfg = this.get("resizeCfg");
            var cfg = {};

            if (resizeCfg.width)
            {
                cfg["width"] = node.getComputedStyle("width");
            }
            if (resizeCfg.height)
            {
                if (!resizeCfg.minHeight)
                {
                    cfg["height"] = node.getComputedStyle("height");
                }else
                {
                    cfg["minHeight"] = node.getComputedStyle("minHeight");
                }
            }
            this.fire("resized",cfg);
            // Clear off the styles set during resizing as it is supposed to be handled externally
            node.setStyles({"minHeight":"", "minWidth":"", "width":"", "height":""});
        },

        _setPosition : function(e)
        {
            var contentBox = this.get("styleFrameBox");
            var node = this.get("node");
            var nodeXY = node.getXY();
            var currentXY = contentBox.getXY();
            var leftDiff = currentXY[0] - nodeXY[0];
            var topDiff = currentXY[1] - nodeXY[1];
            var marginLeft = parseInt(node.getComputedStyle("marginLeft"), 10) + leftDiff;
            var marginTop = parseInt(node.getComputedStyle("marginTop"), 10) + topDiff;
            node.setStyles({marginLeft: marginLeft + "px", marginTop : marginTop + "px"});
        }
    });

    Y.namespace("longtail").FrameManager = frameManager;

}, "3.1.0", { requires: ["base", "node", "event-delegate", "resize","widget-ddm"] });
