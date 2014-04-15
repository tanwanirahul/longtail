YUI.add('doc-plugin-slideshow', function(Y) {
	
	Y.Slideshow.SLIDE_SELECTOR = ".plugin-slide";
	
    function SlideShow(config) {
    	SlideShow.superclass.constructor.apply(this, arguments);
    }
    
    SlideShow.NAME = "slideshow";
    SlideShow.NS = "ss";
    
    SlideShow.ATTRS = {
    	
    }
    
    Y.extend(SlideShow, Y.Plugin.Base, {
        initializer: function() {
    		var slideshow = this.get("host");
	    	slideshow.addClass("plugin-slideshow");
	    	slideshow.all("> *").addClass("plugin-slide");
	    	this._create(slideshow, 0);
    	},
    	
    	destructor : function() {
    		this.get("ssobject").destroy();
    		this.set("ssobject", null);
    	},
    	
    	stop : function() {
    		this.get("ssobject").stop();
    	},
    	
    	_create : function(slideshow, current_slide) {
    		var ss = new Y.SlideshowAnimated({contentBox: slideshow,  pause_time: 3 });
	    	ss.render();
	    	this.set("ssobject",ss);
    	},
    	
    	resync : function(slide_number){
    		var ss = this.get("ssobject"), 
    			h = this.get("host"),
    			slides = Y.Slideshow.HTML_PARSER.slides(h);
    		
    		ss.set("slides", slides);
    		ss.set("slide_count", slides.size());
    		ss.set('current_slide', slide_number);
    		h.all(".current").removeClass("current");
    		ss._display_slide(slide_number);
    		if(EDIT_MODE)
    		{
    			ss.stop();
    		}
    	},
    	
    	removeCurrent : function() {
    		var ss = this.get("ssobject"), c = ss.get("current_slide");
    		ss.get("slides").item(c).remove();
    		this.resync(c > 0 ? c - 1 : 0);
    	},
    	
    	addSlide : function(newNode) {
    		var ss = this.get("ssobject"), c = ss.get("current_slide");
    		ss.get("slides").item(c).insert(newNode, "after");
    		newNode.addClass("plugin-slide");
    		this.resync(c + 1);
    	},
    	
    	advance : function() {
    		this.get("ssobject").advance();
    	},
    	
    	previous : function() {
    		this.get("ssobject").previous();
    	}
    });
    
    Y.namespace("Plugin.Doc").SlideShow = SlideShow;
    
}, '3.2.0' ,{requires:['node', 'event','gallery-slideshow-animated']});