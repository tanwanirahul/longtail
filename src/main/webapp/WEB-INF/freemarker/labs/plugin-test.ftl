<html>
<head>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
<script type="text/javascript" src="${req.staticBase}/js/yui/3.4.1/build/yui/yui-min.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/preload.js"></script>
<script type="text/javascript">
    PageData.setPage('${(req.path)!}');
    PageData.setNavBase('${req.navBase}');
    PageData.setStaticBase('${req.staticBase}');
    PageData.setContentBase('${req.contentBase}');
    PageData.setServicesBase('${req.servicesBase}');
    PageData.setTheme('${themeName!"theme1"}');
    PageData.setEnv('${req.env}');
    PageData.setLoginUrl('${req.signInUrl!}');
    PageData.setLoginState(${req.isUserLoggedIn?string});
    var EDIT_MODE = ${req.editMode!"false"};
    var FIRST_LOGIN = ${req.firstLogin!"false"};
    var EDIT_PERMISSION = ${t.owns(req.domain)?string};
    var SITE_CLAIMED = ${req.site.claimed?string};
    var userName = '${req.loggedInUserName}';
    
    var Y = YUI(PageData.env == "dev" ? YUI_DEV_CONF : YUI_PROD_CONF);
    initSiteOnly();
</script>
</head>
<body>

<div id="c_canvas" class="c_canvas">
	<div id="canvas" class="canvas">
	    <div id="layoutArea" class="layoutArea">
			<ul id="ssTest" class="plugin-SlideShow">
				<li>Here is First Text</li>
				<li>And here is second</li>
				<li>Here is First Text</li>
			</ul>
		</div>
	</div>
</div>



</body>
</html>