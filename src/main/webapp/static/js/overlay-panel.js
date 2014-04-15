YUI.add('longtail-overlay-panel', function(Y) {

    var Events = {CANCEL : 'cancel', SELECTED : 'selected', CLOSE : 'close'};

    function OverlayPanel(config) {
        OverlayPanel.superclass.constructor.apply(this, arguments);
    };

    OverlayPanel.NAME = "longtail-overlay";

    OverlayPanel.ATTRS = {
        headerContent: {value: 'Image Settings'},
        bodyContent: {value: '<div>Loading...</div>'},
        zIndex: {value: 110},
        href: {value: null},
        content: {value: null},
    	srcElement: {value: null},
        type: {value: null},
        showMask: {value: false},
        closeOnClickOutside: {value: true},
        closeOnSubmit: {value: true},
        modal : {value: false},
        iframe : {value: false}
    };

    Y.extend(OverlayPanel, Y.Overlay, {

        initializer : function()
        {
            this.set("zIndex", 110); // HACK: As zIndex is not getting set through ATTRS
            if(this.get("type"))
            {
                this.get("boundingBox").addClass("yui3-overlay-"+ this.get("type"));
            }
        },
        
        renderUI : function()
        {
        	OverlayPanel.superclass.renderUI.apply(this, arguments);
        	if (this.get("showMask")) {
        		this.get("boundingBox").prepend('<div class="yui3-overlay-mask"></div>');
        	}
        },
        
        syncUI : function()
        {
            var node = this.get("boundingBox").one(".yui3-widget-bd");
            var href = this.get("href");
            var content = this.get("content");
            if(content)
            {
                this.set("bodyContent", content);
                this.fire("loaded",{node:node});
            }else if(href)
            {
                var self = this;
                
                if(this.get("iframe")){
                	
                	var iframe = Y.Node.create('<iframe class="yui-overlay-panel-frame" border="0" scroll="0"></iframe>');
                	node.set("innerHTML","");
                	node.append(iframe);
                    
                	iframe.on("load", function(){
                    	var win = Y.Node.getDOMNode(iframe.get('contentWindow')),doc = win.document;
                    	
                    	if(win.refresh_widget)
                    	{
                    		new Widget(win.refresh_widget).refresh();
                    	}
                    	
                    	if(win.close_frame){
                    		self.close();
                    	}else{	
	                    	YUI({ win: win, doc: doc }).use('node','event', function(innerY) {
		                		self.fire("loaded", {node: node});
			                    self._registerCloseHandler();
		                	
			                    innerY.delegate("click", function(){
		                	        self.close();
		                	    }, "body", ".done,.close,.exit");
			                    Y.innerY = innerY;
		                        Y.log("Bound IFrame Events for Closing " + innerY.one('body'));
			                	Y.log("Settings Iframe SRC");
			                });
                    	}
                    });
                    iframe.set("src", href);
                } else {
	                AjaxRequest(href, {}, new WidgetHTMLInsert(node, function(){
	                    self.fire("loaded", {node: node});
	                    self._registerCloseHandler();
	                }), "GET");
                }
            }
        },

        _registerCloseHandler : function()
        {
            if (this.get("closeOnClickOutside")) {
                var contentBox = this.get("contentBox");

                this._handler = Y.on("clickoutside", function(e)
                {
                    var target = e.target;
                    var srcEl = this.get("srcElement");
                    if(target.ancestor(".yui3-overlay") == null
                            && (srcEl == null || srcEl != target && !srcEl.contains(target))
                            && target.ancestor("#color-picker") == null) // FIXME: HACK for color-picker
                    {
                        Y.log("Clicked Outside. Closing Image Overlay","info","longtail");
                        this.close(e);
                    }
                }, contentBox, this);
            }
        },

        bindUI : function()
        {
            var node = this.get("boundingBox");
            node.delegate("click", Y.bind(this.onSubmit, this), ".form-submit-button");
            node.delegate("click", Y.bind(this.close, this), ".done,.close,.exit");
            
            if(this.get("modal")){
            	node.on("click", function(e){e.stopPropagation();});
            }
        },

        destroy : function()
        {
            if(this._handler)
            {
                this._handler.detach();
            }

            OverlayPanel.superclass.destroy.apply(this, arguments);
        },

        onSubmit : function(e)
        {
            if(this.get("closeOnSubmit"))
            {
                if(e){e.halt();}
                Y.log("Form Submitted. Closing Image Overlay","info","longtail");
                this.close();
            }
        },

        close : function(e)
        {
            this.fire("close");
            this.destroy();
            if(e) e.halt();
        }
    });

    Y.namespace("longtail").OverlayPanel = OverlayPanel;

}, '3.2.0' ,{requires:['node-base','node-event-simulate','overlay']});
