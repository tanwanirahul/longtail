var L = {};

var GlobalIOStartHandler = function(method)
{
    L.MESSAGE_DIV = Y.one("#user-msg");
    if(L.MESSAGE_DIV)
    {
    	L.MESSAGE_DIV.set("innerHTML", "<div class=\"waiting-bg\">" + (method === "POST" ? "Saving" : "Loading")
                + "&hellip;</div>");
    	L.MESSAGE_DIV.setStyle("opacity", 1);
    	L.MESSAGE_DIV.setStyle("display", "block");
    }
}

var GlobalIOCompleteHandler = function(method)
{
    var msgDiv = L.MESSAGE_DIV;

    if(msgDiv)
    {
        if (method === "POST")
        {
            msgDiv.set("innerHTML", "<div>Saved</div>");
        }else
        {
        	msgDiv.setStyle("display", "none");
        }

        if(msgDiv.transition)
        {
            msgDiv.transition(
                {opacity: 0, duration: 2, delay: 2}, function(){
                    msgDiv.setStyle("display", "none");
                }
            )
        }else{
            Y.later(2000, function(){msgDiv.setStyle("display", "none")});
        }
    }
}

var GlobalFailureHandler = function(id, o, args)
{
    if(o.status == 403) {
        //In future, we may want to open the login form in a Flip/Overlay
        window.location = PageData.loginUrl;
    }
    else {
        Y.log(o + ": Global Event Failure.  The status text is: " + o.status + ".", "error");
    }
}

var InitializeTabs = function(e)
{
    var tabs = e.all(".tabs");
    if(tabs.size() == 0)
    {
        return;
    }

    Y.use("tabview", function(Y){
        e.all(".tabs").each(function(el){
            var tabview = new Y.TabView({srcNode: el});
            tabview.render();
            Y.on("tab:select",function(e)
            {
            	var node = e.node;
            	var panel = node.ancestor(".yui3-tab-panel");
            	if(panel && el.contains(panel))
            	{
            		var index = el.all(".yui3-tab-panel").indexOf(panel);
            		el.all(".yui3-tab").item(index).simulate("click");
            	}
            });
        });
    });
}

var FormValidationInit = function(e)
{
    e.all("form").each(function(e){
        var domNode = Y.Node.getDOMNode(e);
        H5F.setup(domNode);
    });
}

var GoogleMapsInit = function(e)
{
    e.all(".google-map-container").each(function(e) {
        var gmap = new Y.longtail.googlemaps({ widgetElement: e });
        gmap.render(e.one(".google-map"));
    });
}

var FacebookInit = function(e)
{
    // If a facebook widget was dropped
    var isFBWidgetPresent = false;
    if (e.one(".facebook-widget"))
    {
        isFBWidgetPresent = true;
    }

    if (isFBWidgetPresent)
    {
        // Create the function only if it hasn't been previously defined
        if (!window.fbAsyncInit)
        {
            window.fbAsyncInit = function() {
                    FB.init({appId: 'a71b13607fa58d788acee92f337572f5', status: true, cookie: true, xfbml: true});
                };

            // Load the SDK Asynchronously
            (function(d) {
                 var js, id = 'facebook-jssdk';
                 if (d.getElementById(id)) { return; }
                 js = d.createElement('script');
                 js.id = id;
                 js.async = true;
                 js.src = "//connect.facebook.net/en_US/all.js";
                 d.getElementsByTagName('head')[0].appendChild(js);
                 window.isFacebookLoaded = true;
            }(document));
        }
    }
}

var SlideShowInit = function(e)
{
    var testNode = Y.one(".slideshow-gallery") || e.hasClass("slideshow-gallery");

    if(testNode == null)
    {
        return;
    }
    
    var initSlideShow = function(e){e.plug(Y.Plugin.Doc.SlideShow);}

    Y.use("gallery-slideshow-animated",function(Y){
        e.all(".slideshow-gallery").each(initSlideShow);
        if(e.hasClass("slideshow-gallery")){ initSlideShow(e);}
    });
}

var SiteInterfaceController = {}

var toggle = function(selector,clazz)
{
    Y.all(selector).each(function(e,k) {
        if(e.hasClass(clazz))
        {
            e.removeClass(clazz);
        } else
        {
            e.addClass(clazz);
        }
    })
}

var initSiteElements = function()
{
    if(Y.LUI){
	Y.LUI.register("helpoverlay",Y.longtail.OverlayPanel, {
        href: '/overlays/help',
        headerContent: 'Quick Overview <div class="close"></div>',
        srcElement: null,
        type: 'help',
        centered : true,
        showMask: true,
        closeOnClickOutside: false
    },function(){this.render();});
    }

    if(typeof(_css3_styles) != "undefined" && Y.UA.ie && Y.UA.ie < 9)
    {
    	Y.Get.script(PageData.staticBase + "/js/selectivizr.js");
    }
    
    Y.augment(SiteInterfaceController, Y.EventTarget);
    L.HTML = Y.one("html");
    L.HEAD = Y.one("head");
    L.BODY = Y.one("body");
    L.LAYOUT = Y.one("#layoutArea");
    L.CANVAS = Y.one("#canvas");

    // event fired when a new node comes into existence
    // passes the node root as first argument
    SiteInterfaceController.publish("hashed:newnode");
    SiteInterfaceController.publish("hashed:editinit");

    // Initialization Controllers
    SiteInterfaceController.on("hashed:newnode", SlideShowInit);
    SiteInterfaceController.on("hashed:newnode", InitializeTabs);
    SiteInterfaceController.on("hashed:newnode", FormValidationInit);
    SiteInterfaceController.on("hashed:newnode", GoogleMapsInit);
    SiteInterfaceController.on("hashed:newnode", FacebookInit);

    // User Action Controllers
    Y.on('io:failure', GlobalFailureHandler, Y, 'Global Failure control');
    Y.delegate("submit", AjaxFormSubmit, L.BODY, "form.ajax-form");
    Y.on("formSubmit", ThankYouHandler);

    Y.delegate("click", function(e){
        var node = e.currentTarget;
        if(node.hasClass("selected"))
        {
            node.removeClass("selected");
        }else
        {
            node.addClass("selected");

            var handler = Y.on("clickoutside", function(e){
                node.removeClass("selected");
                handler.detach();
            }, node);

        }
    }, L.HTML, ".toggle-select");

	// Y.delegate("mouseenter", function(e){e.currentTarget.addClass("focussed");}, L.BODY, ".widget-container");
	// Y.delegate("mouseleave", function(e){e.currentTarget.removeClass("focussed");}, L.BODY, ".widget-container");
    Y.delegate("click", function(e){
        var urlOverlay = OpenOverlay({
            href: e.currentTarget.getAttribute("href"),
            headerContent: e.currentTarget.getAttribute("title"),
            srcElement: e.currentTarget,
            type: "url",
            closeOnSubmit : false
        });
        e.halt();
        return false;
    }, L.BODY, "a.overlay");
    // Initialize body on page-load
    
    if(EDIT_MODE && !EDIT_PERMISSION)
	{
		OpenOverlay({
            href: "",
            headerContent: "Error",
            bodyContent: 'You do not have permission to Edit this site.',
            footerContent: '<button class="close">Ok</button>',
            type: "alert",
            closeOnSubmit : false,
            closeOnClickOutside : true,
            align: "center"
        });
	}
}

var OpenOverlay = function(cfg)
{
    var urlOverlay = new Y.longtail.OverlayPanel(cfg);
    urlOverlay.render(L.BODY);
    return urlOverlay;
}

var AjaxFormSubmit = function(e, delegateForm)
{
    if (e) { e.halt(); }

    var self = this;
    var form = delegateForm || e.currentTarget;
    var uri = form.getAttribute("action");
    var cfg = {
            method: 'POST',
            form: {
                id: form
            },

            on : {
                complete : function(id, o, args)
                {
                    Y.fire("formSubmit", {form: form, response: o});
                }
            }};
     Y.io(uri, cfg);
}

var ThankYouHandler = function(e)
{
	var form = e.form, response = e.response.responseText;
	Y.log(response);
	try{
		var json = Y.JSON.parse(response);
		if(json.thankYou)
		{
			var node = Y.Node.create('<div class="thank-you"></div>');
			node.set("textContent", json.thankYou);
			form.replace(node);
		}
		
	}catch(ex)
	{
		Y.log("Error parsing json " + ex);
	}
	
}

var initEditInterface = function()
{
    if(!Y.UA.gecko && !Y.UA.webkit && !Y.UA.chrome)
    {
        if(!confirm("DesignOnCloud experience isn't yet optimized for your browser. We currently support Chrome, " +
        		"Firefox and Safari browsers. Are you sure you still want to continue ?"))
        {
            return;
        }
    }

    EditInterface.init();
}

var WidgetHTMLInsert = function(node, fn, opts)
{
    return function(responseText)
    {
        var yNode = Y.one(node);
        if(opts && opts.replace)
        {
            var newNode = Y.Node.create(responseText);
            yNode.replace(newNode);
            yNode = newNode;
        }else
        {
            if(opts && opts.animate)
            {
            	yNode.setStyle("opacity",0);
            	yNode.set("innerHTML", responseText);
            	yNode.transition({opacity:1});
            }else{
            	yNode.set("innerHTML", responseText);
            }
        }
        
        if(yNode.one("link") != null)
        {
            // has a style tag
        	Y.log("moved style nodes to top of the head");
        	var styleTags = yNode.all("link");
            L.HEAD.prepend(styleTags);
        }
        
        if(yNode.one("style") != null)
        {
            // has a style tag
        	extractAndMoveStyles(yNode.all("style"));
        }

        if(typeof(FB) != "undefined")
        {
            FB.XFBML.parse();
        }

        SiteInterfaceController.fire("hashed:newnode", yNode);
        SiteInterfaceController.fire("hashed:editinit", yNode);

        if(fn)
        {
            fn.call(this);
        }

    }
};

function extractAndMoveStyles(styleTags)
{
	var temp_styles = "";
	styleTags.each(function(e){temp_styles += e.get("textContent");})
	
	var temp_tag = Y.one("#temp_preset_styles");
	if(temp_tag == null)
	{
		temp_tag = Y.Node.create('<style id="temp_preset_styles"></style>');
		L.HEAD.insert(temp_tag, Y.one('#presetStyles'));
	}
	temp_tag.set("textContent", temp_styles);
	Y.log("moved style nodes to top of the head");	
}

function getImagePath(path)
{
	return path.match(/http:\/\//) ? path : PageData.staticBase + '/' + path;
}
