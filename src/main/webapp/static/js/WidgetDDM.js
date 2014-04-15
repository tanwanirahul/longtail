YUI.add("widget-ddm", function(Y){

    function WidgetDropper(config) {
    	WidgetDropper.superclass.constructor.apply(this, arguments);
    };

    WidgetDropper.NAME = "styleframe";

    WidgetDropper.ATTRS = {
       node : {value : null},
       parent : {value : null}
    };

    function WidgetDropper()
    {
    	WidgetDropper.superclass.constructor.apply(this, arguments);
    };

    Y.extend(WidgetDropper, Y.Base, {
    	
    	initializer : function()
    	{
	        // Prepare a region map for columns
	        var regions = [];
	        Y.all(".column").each(function(e){
	            var region = e.get("region");
	            region.bottom = region.top + parseInt(e.ancestor(".section").getComputedStyle("height"), 10);
	            regions.push({column: e, region: region});
	        });
	        this.set("regions", regions.reverse());
            this.set("grabNode", Y.Node.create('<div class="yui3-styleframe-shim">Drop Here</div>'));
    	},
    	
    	onDrop : function()
    	{
            var grabNode = this.get("grabNode");
            var node = this.get("node");

            if (grabNode && grabNode.get("parentNode") != null)
            {
                node.setStyles({maxHeight: "10px", overflow:"hidden"});
                grabNode.replace(node);
                node.transition({maxHeight: '200px', duration: 1}, function(){this.setStyles({maxHeight: "", overflow:""});});
            }
            
            this._saveMovedWidget(node);
            this.set("grabNode", null);
    	},
    	
        _saveMovedWidget : function(node)
        {
    		var isSampleWidget = node.hasClass("sample-widget");
    		var parent = node.ancestor(".column"), parentWidgetId = parent.get("id");
    		var index = parent.all("> .el-widget-instance, > .sample-widget").indexOf(node);
    		var uri = null, params = {'parent' : parentWidgetId,
    							'currentparent' : this.get("parent"),
    							'position' : index,
    							'path' : PageData.path};
    		
    		if(isSampleWidget)
    		{
    			uri = PageData.getServiceUrl("/page/add");
    			params['widget'] = node.getAttribute("type");
    			Y.log("Added widget " + params['widget'] + " to postion " + index + " in " + parentWidgetId, "info");
    			AjaxRequest(uri, params, new WidgetHTMLInsert(node, null, {replace: true}));
    		}else{
    			uri = PageData.getServiceUrl("/page/move");
                params['widgetId'] = node.get("id");
                Y.log("Moved widget " + params['widgetId'] + " to postion " + index + " in " + parentWidgetId, "info");
                AjaxRequest(uri, params, false);
    		}
    		
    		parent.removeClass("empty");
        },
    	
        inRegion : function(p, r)
        {
            return p && r && r.left < p[0] && r.right > p[0] && r.top < p[1] && r.bottom > p[1];
        },
    	
    	updatePosition : function(p)
    	{
    		var grabNode = this.get("grabNode");
            var column = this.get("currentColumn"), regions = this.get("regions");
            var currentRegion = this.get("currentRegion");
            
            if (!this.inRegion(p, currentRegion))
            {
                // Y.log("Drag exited the column. Find new Column.");
                for(var i in regions)
                {
                	if(regions.hasOwnProperty(i))
                	{
                    var r = regions[i].region;
                    if (this.inRegion(p, r))
                    {
                        column = regions[i].column;
                        this.set("currentRegion", r);
                        this.set("currentColumn", column);
                        // Y.log("Drag entered another Column.");
                        break;
                    }
                	}
                }
            }

            if (column)
            {
                var index = 0, position = p[1], nodePos = null;
                column.all(".el-widget-instance").some(function(e, k){
                    if (position < e.getY() + Utils.totalHeight(e)/2)
                    {
                        nodePos = e;
                        index++;
                        return true;
                    }
                });

                if (!column.contains(grabNode) || grabNode.next() != nodePos )
                {
                    // Y.log("Adjusting position " + index);
                    grabNode.setStyle("maxHeight", "5px");
                    nodePos ? column.insertBefore(grabNode, nodePos) : column.append(grabNode);
                    grabNode.transition({maxHeight: '100px', duration: 1});
                }
            }
    	}
    });
    
    Y.namespace("longtail").WidgetDropper = WidgetDropper;
	
},"3.1.0",{requires: ["base","node","event",'anim']});