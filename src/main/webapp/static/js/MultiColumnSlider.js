YUI.add("multi-col-slider", function(Y) {

    function MultiColumnSlider(config) {
        MultiColumnSlider.superclass.constructor.apply(this, arguments);
    };

    MultiColumnSlider.NAME = "colslider";

    MultiColumnSlider.ATTRS = {
        resizedNode : { value : null }, // Resized Node
        cloneNode : { value : null }
    };
    
    function HeightDragger(config) {
    	HeightDragger.superclass.constructor.apply(this, arguments);
    }
    
    HeightDragger.ATTRS = {
            resizer : { value : null }
    };
    
    Y.extend(HeightDragger, Y.Base, {
    	
    	_dragStart : function(e){
    		var resizer = this.get("resizer");
    		var currentNode = resizer.ancestor(".section-container");
    		var prevNode = currentNode.previous() ? currentNode.previous().one(".layout-widget") : null;
	        var region = {left: resizer.getX(), right: resizer.getX() + Utils.totalWidth(resizer), bottom: 99999};
	        
	        this.set("prevNode", prevNode);
	        this.set("currentNode", currentNode);
	        if (prevNode)
	        {
	        	var maxHeight = 0, maxHeightNode = null;
	        	prevNode.all(".column").each(function(e) {
		            var h = Utils.totalHeight(e);
		            if (h > maxHeight) {maxHeight = h; maxHeightNode = e;}
		        });
	        	
	            region.top = prevNode.getY() +  maxHeight - 5
					            + parseInt(prevNode.getComputedStyle("paddingTop"))
				                + parseInt(prevNode.getComputedStyle("paddingBottom"))
				                + parseInt(prevNode.getComputedStyle("marginBottom"));
	        }else
	        {
	        	region.top = currentNode.getY() - parseInt(currentNode.getComputedStyle("marginTop"));
	        }
	
	        resizer.dd.plug(Y.Plugin.DDConstrained,{stickY : true, constrain : region});
    	},
    	
    	_dragEnd : function(){
    		var prevNode = this.get("prevNode");
    		var resizer = this.get("resizer");
            var css = null, sel = null;
            var currentNode = this.get("currentNode");

    	    if (prevNode)
            {
    			sel = prevNode.get("id");
    			css = {minHeight: prevNode.getComputedStyle("minHeight")};
            }else {
            	var widget = currentNode;
    			var topDiff = resizer.getY() - widget.getY() + parseInt(widget.getComputedStyle("marginTop"),10);
    			Y.log("Setting Margin to " + topDiff + " on " + widget,"info");
    			widget.setStyle("marginTop", topDiff);
    			sel = widget.get("id");
    			css = {marginTop: widget.getComputedStyle("marginTop")};
            }
    	    
    	    Y.longtail.CSSUtils.applyCSS("#" + sel, css);
    	    Y.longtail.SaveQueue.save('custom-styles', {node: sel.replace(/^c_/,''), selector:'::CONTAINER', styles: css});
            resizer.setStyles({left: 0, top: 0});
    	},
    	
    	_dragging : function(){
    		var prevNode = this.get("prevNode");
    		var resizer = this.get("resizer");
    		var currentNode = this.get("currentNode");
    		
    		if(!prevNode)
    		{
    			var widget = currentNode;
    			var topDiff = resizer.getY() - widget.getY() + parseInt(widget.getComputedStyle("marginTop"),10);
    			widget.setStyle("marginTop", topDiff);
    			return;
    		}
            
    		var minHeight = resizer.getY() - prevNode.getY()
                    - parseInt(prevNode.getComputedStyle("marginBottom"))
                    - parseInt(prevNode.getComputedStyle("paddingTop"))
                    - parseInt(prevNode.getComputedStyle("paddingBottom"));
            prevNode.setStyle("minHeight", minHeight);
    	},
    	
    	initializer : function(){
    		var resizer = this.get("resizer");
    		resizer.plug(Y.Plugin.Drag);
    		resizer.dd.on("drag:start", this._dragStart, this);
    		resizer.dd.on("drag:end", this._dragEnd, this);
    		resizer.dd.on("drag:drag", this._dragging, this);
    	},
    	
    	destructor : function(){
    		
    	}
    });

    Y.extend(MultiColumnSlider, Y.Widget, {

        renderUI : function() {
            var self = this;
            var resizedNode = Y.one(this.get("resizedNode"));

            var children = resizedNode.all("> .column");
            // Y.log("Resizing " + children.size());
            var childList = [];
            var totalWidth = parseInt(resizedNode.getComputedStyle("width"));
            var sectionWidths = [];
            var last = 0;

            children.each(function(e, i) {
                var current = parseInt(e.getComputedStyle("width"), 10);
                sectionWidths.push(current + last);
                last = current + last;
                childList.push(e);
            });

            // Set initial positions for the resizers
            var cloneNode = Y.one(this.get("cloneNode"));
            cloneNode = cloneNode.cloneNode(true);
            cloneNode.set("id", "");

            var dragger = new HeightDragger({resizer: cloneNode});
            
            cloneNode.delegate("change", function(e) {
                var value = e.target.get("value");
                self.fire("col-change", {value: value});
            }, "select");

            cloneNode.delegate("click", function(e) {
                var value = self.get("resizedNode");
                self.fire("col-delete", {resizedNode: value});
            }, ".delete");

            cloneNode.delegate("click", function(e) {
                var node = self.get("resizedNode");
                self.fire("move-up", {resizedNode: node});
            }, ".move-up");

            cloneNode.delegate("click", function(e) {
                var node = self.get("resizedNode");
                self.fire("move-down", {resizedNode: node});
            }, ".move-down");

            var selectNode = cloneNode.one("select");
            if (selectNode)
            {
                selectNode.set("selectedIndex", sectionWidths.length - 1);
            }

            var leftX = parseInt(resizedNode.getComputedStyle("paddingLeft"), 10) +
                  parseInt(resizedNode.getComputedStyle("marginLeft"), 10) +
                  parseInt(resizedNode.getComputedStyle("borderLeftWidth"), 10);

            var rightX = parseInt(resizedNode.getComputedStyle("paddingRight"), 10) +
                  parseInt(resizedNode.getComputedStyle("marginRight"), 10) +
                  parseInt(resizedNode.getComputedStyle("borderRightWidth"), 10);

            cloneNode.all(".thumb").each(function(e, i) {
                if (i >= sectionWidths.length - 1)
                {
                    e.setStyle("display", "none");
                }else
                {
                    e.setStyle("display", "block");
                    e.setStyle("left", sectionWidths[i] + "px");
                    e.plug(Y.Plugin.Drag);
                    e.dd.plug(Y.Plugin.DDConstrained, {stickX: true});

                    e.dd.on("drag:drag", function(e, index) {
                         // Y.log(e.pageX);
                         var left = index == 0 ? 0 : sectionWidths[index - 1];
                         var right = index == sectionWidths.length - 1 ? sectionWidths[index] : sectionWidths[index + 1];
                         var cloneNodeX = parseInt(cloneNode.getX(), 10) + leftX;

                         var minValue = cloneNodeX + left + 20;
                         var maxValue = cloneNodeX + right - 20;

                         if (e.pageX < minValue)
                         {
                            e.pageX = minValue;
                         }

                         if (e.pageX > maxValue)
                         {
                             e.pageX = maxValue;
                         }

                        sectionWidths[index] = e.pageX - cloneNodeX;

                        childList[index].setStyle("width", (e.pageX - cloneNodeX - left) + "px");
                        childList[index + 1].setStyle("width", (cloneNodeX + right - e.pageX) + "px");
                    }, null, i);

                    e.dd.on("drag:end", function(e, index) {

                        // Save the changes
                        self.fire("resized", {widths: sectionWidths});
                    }, null, i);
                }
            });

            cloneNode.setStyles({
                paddingLeft : leftX,
                paddingRight : rightX
            });
            resizedNode.get("parentNode").prepend(cloneNode);
        }

    });

    Y.namespace("longtail").MultiColumnSlider = MultiColumnSlider;

}, "3.1.0", {requires: ["widget", "dd-plugin", "dd-constrain", "node"]});