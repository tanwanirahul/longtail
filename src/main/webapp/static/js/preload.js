var PageData = {
	path: "",
	navBase: "",
	servicesBase: "",
	contentBase: "",	
	staticBase: "",
	ajaxBase: "/list/",
	theme: "",
	env: "dev",
	loginUrl: "",
	loggedIn: false,
	editbarTab: null,

	setLoginUrl: function(loginUrl) {
		this.loginUrl = loginUrl;
	},
	
	setLoginState: function(loggedIn) {
		this.loggedIn = loggedIn;
	},
	
	setPage: function(pagePath) {
		this.path = pagePath;
	},

	setEnv: function(env) {
		this.env = env;
	},
	
	setNavBase: function(pagePath) {
		this.navBase = pagePath;
	},

	setStaticBase: function(pagePath) {
		this.staticBase = pagePath;
	},

	setContentBase: function(pagePath) {
		this.contentBase = pagePath;
	},

	setServicesBase: function(pagePath) {
		this.servicesBase = pagePath;
	},

	setTheme: function(theme) {
		this.theme = theme;
	},

    setEditbarTab: function(tab) {
	    this.editbarTab = tab;
    },

	getServiceUrl: function(service) {
		return this.servicesBase + service;
	}
};


function Stringify(queryObj) {
    var qString = "";
    for ( var i in queryObj) {
    	
    	if(Y.Lang.isArray(queryObj[i]))
    	{
    		for(var j in queryObj[i])
    		{
    			if(queryObj[i].hasOwnProperty(j)){
    			qString += encodeURIComponent(i) + "=" + encodeURIComponent(queryObj[i][j]) + "&";
    			}
    		}
    	}else
    	{
    		qString += encodeURIComponent(i) + "=" + encodeURIComponent(queryObj[i]) + "&";
    	}
    }

    return qString;
}

String.prototype.trim = function() {
    return this.replace(/^\s*/, "").replace(/\s*$/, "");
}

var YUI_DEV_CONF = {
	debug: true,
	fetchCSS: false,
        base: "/static/js/yui/3.4.1/build/",
        root: "/static/js/yui/3.4.1/build/",
        filter: "raw",
        groups: {
            yui2: {
                base: '/static/js/yui/2in3.3/build/',
                patterns:  {
                    'yui2-': {
                        configFn: function(me) {
                            if(/-skin|reset|fonts|grids|base/.test(me.name)) {
                                me.type = 'css';
                                me.path = me.path.replace(/\.js/, '.css');
                                me.path = me.path.replace(/\/yui2-skin/, '/assets/skins/sam/yui2-skin');
                            }
                        }
                    }
                }    		
			}
}};

var YUI_PROD_CONF = {
        combine: true,
        fetchCSS : false,
		groups: {}
};

if(!Array.indexOf){
    Array.prototype.indexOf = function(obj){
        for(var i=0; i<this.length; i++){
            if(this[i]==obj){
                return i;
            }
        }
        return -1;
    }
}

function AjaxRequest(uri, params, reloadOnSuccess, methodToUse)
{
    if(methodToUse !== 'GET' && methodToUse !== 'POST') {
        methodToUse = 'POST';
    }
    GlobalIOStartHandler(methodToUse);

    var cfg = {
            method: methodToUse,
            data: Stringify(params),
            on: {
                success: function(id, o, args) {
                    if(typeof(reloadOnSuccess) == "function")
                    {
                        reloadOnSuccess(o.responseText);
                    }else
                    {
                        var response = Y.JSON.parse(o.responseText);
                        if (response.status == 'success') {

                            if(typeof(reloadOnSuccess) == "function")
                            {
                                reloadOnSuccess(response)
                            }else if(reloadOnSuccess)
                            {
                                location.reload(true);
                            }
                        } else {
                            alert("Save Failed");
                        }
                    }
                }
                }
            };
    Y.io(uri, cfg);

    GlobalIOCompleteHandler(methodToUse);
}

/** BASE folder is assumed to be /static/js**/  
var MAIN_SITE_URLS = ["main.js", "overlay-panel.js", "h5-form-validations.js", "google-map-widget.js", 
                      "slideshow/gs-animated.js", "slideshow/gs-base.js",'plugin/plugin-support.js'];

var EDIT_INTERFACE_URLS = ["content-editable-editor.js",
                    "edit.js",
                    "WidgetDDM.js",
                    "PageStructure.js",
                    "MultiColumnSlider.js",
                    "longtail-form.js",
                    "spinner.js",
                    "designer.js",
                    "style-frame.js",
                    "item-browser.js",
                    "ui-manager.js",
                    "style-selection.js",
                    "jscolor/jscolor.js"];


var MAIN_SITE_YUI_CONFIG = ["tabview",'event','event-custom', 'io', 'json-parse', 'node', 
                            'longtail-overlay-panel','event-synthetic','gallery-slideshow-animated',
                            'longtail-google-maps','selector-css3','doc-plugin-slideshow'];

var EDIT_INTERFACE_YUI_CONFIG = ['io', 'dd', 'json', 'cookie', 'transition',
                                 'longtail-spinner','longtail-image-browse','longtail-site-interface',
                                 'widget-ddm','tabview','node-event-simulate','multi-col-slider','longtail-editor',
                                 'longtail-css-designer', 'longtail-styleframe',
                                 'longtail-ui-manager','longtail-item-browser','exec-command','selection','createlink-base',
                                 'doc-plugin-slideshow','longtail-style-selection'];

function getMergedJsUrl(relativeUrls) {
    var baseUrl = PageData.staticBase + "/merged/js/";
    for(var i=0; i<relativeUrls.length; i++) {
    	var x = relativeUrls[i].replace(/[.]js$/g,'');
		if(PageData.env != "dev")
		{
			x += "-min";
		}
        baseUrl += "~" + x;
    }
    return baseUrl + "~.js";
}

YUI.add('longtail-site-interface', function(Y) {}, '3.2.0' ,{requires:MAIN_SITE_YUI_CONFIG});
YUI.add('longtail-edit-interface', function(Y) {}, '3.2.0' ,{requires:EDIT_INTERFACE_YUI_CONFIG});

function initEditAfterSiteLoaded()
{
	Y.Get.script(getMergedJsUrl(EDIT_INTERFACE_URLS), {onSuccess: 
		function(){
			Y.use('longtail-edit-interface', function(Y){
				Y.on("domready", function(){
					initEditInterface();
					var body = Y.one("body");
				    var layoutArea = Y.one("#layoutArea");
				    if(layoutArea){
			        SiteInterfaceController.fire("hashed:editinit", layoutArea);
			        Y.LUI.bookmark({mode:'edit'});
				    }
				});
			});
		}
	});
}


function initSiteAndEdit(fn)
{
	var allURLS = MAIN_SITE_URLS.concat(EDIT_INTERFACE_URLS);
	Y.Get.script(getMergedJsUrl(allURLS), {onSuccess: 
		function(){
			Y.use('longtail-edit-interface', function(Y){
				Y.Event.POLL_RETRYS = 1;
				Y.Event.POLL_INTERVAL = 100;
				Y.on("domready", function(){
					initSiteElements();
					initEditInterface();
					var body = Y.one("body");
				    var layoutArea = Y.one("#layoutArea");
				    
				    if(layoutArea){
			        SiteInterfaceController.fire("hashed:newnode", layoutArea);
			        SiteInterfaceController.fire("hashed:editinit", layoutArea);
			        Y.fire("hashed:loaded", layoutArea);
				    }
			        
			        if(!SITE_CLAIMED)
			        {
			           	OpenOverlay({href: '/overlays/claimForm',
			               	headerContent: 'Claim your Site',
			               	srcElement: null,
			               	type: 'claim',
			               	centered : true,
			               	showMask: true,
			               	closeOnSubmit: false});
			        }
			        
			        if(fn)
			        {
			        	fn.call(this, Y);
			        }
				});
			});
		}
	});
}

function initSiteOnly()
{
	Y.Get.script(getMergedJsUrl(MAIN_SITE_URLS), {onSuccess: 
		function(){
			Y.use('longtail-site-interface', function(Y){
				Y.Event.POLL_RETRYS = 1;
				Y.Event.POLL_INTERVAL = 100;
				Y.on("domready", function(){
					initSiteElements();
					var body = Y.one("body");
				    var layoutArea = Y.one("#layoutArea");
				    if(layoutArea){
			        SiteInterfaceController.fire("hashed:newnode", layoutArea);
			        Y.fire("hashed:loaded", layoutArea);
				    }
			        if(!SITE_CLAIMED)
			        {
			           	OpenOverlay({href: '/overlays/claimForm',
			               	headerContent: 'Claim your Site',
			               	srcElement: null,
			               	type: 'claim',
			               	centered : true,
			               	showMask: true,
			               	closeOnSubmit: false});
			        }
				});
			});
		}
	});
}

YUI.add("gallery-preload",function(B){var A=[];B.preload=function(C){var F,E=B.UA.ie,D=B.config.doc;C=(B.Lang.isArray(C)?C:B.Array(arguments,0,true));B.Array.each(C,function(G){if(E){(new Image()).src=G;}else{F=D.createElement("object");F.data=G;F.width=F.height=0;D.body.appendChild(F);}});return B;};B.preloadOnIdle=function(D,C){A.push(D);B.use("gallery-idletimer",function(E){E.IdleTimer.subscribe("idle",function(){var F=D.shift();if(F){E.preload(F);}else{E.IdleTimer.stop();}});E.IdleTimer.start(C);});return B;};},"gallery-2010.05.05-19-39",{requires:["yui"]});