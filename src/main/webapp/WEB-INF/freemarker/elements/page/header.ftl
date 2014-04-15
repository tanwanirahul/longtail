<#-- FIXME: This is temporary fix for showing up page title and meta tags -->
<#if req.pages?has_content><#list req.pages as p><#if p.path == req.path><#assign currentPage = p /></#if></#list></#if>
<#-- siteName reference is used in Footer.ftl also -->
<#if req.domain == req.siteDomain>
    <#assign siteName = ""/>
<#else>
    <#if (req.domain?length > 13)>
        <#assign siteName = req.domain?substring(0,req.domain?length-13)?capitalize />
    <#else>
        <#assign siteName = req.domain?capitalize />
    </#if>
</#if>
<#if (currentPage.title)?has_content>
    <#assign pageTitle = currentPage.title />
<#else>
   <#if (currentPage.name)?has_content>
       <#assign pageTitle = currentPage.name + " @ " + siteName />
   <#else>
       <#assign pageTitle = siteName />
    </#if>
</#if>
<#if req.domain == req.siteDomain>
    <#if req.path == "/dashboard">
        <#assign pageTitle = "DesignOnCloud - My Dashboard"/>
    <#elseif req.path == "/publish">
        <#assign pageTitle = "DesignOnCloud - Upgrade Plan"/>
    <#elseif req.path == "/profile">
        <#assign pageTitle = "DesignOnCloud - User Profile"/>
    </#if>
</#if>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>${pageTitle}</title>
    
    <META NAME="description" CONTENT="${(currentPage.description)!}"/>
    <META NAME="keywords" CONTENT="${(currentPage.keywords)!}"/>

    <!-- N5-k36XmhCjNUYJFdWP_ImfoFvI For Alexa-->

    <link rel="shortcut icon" href="${req.staticBase}/img/favicon.ico"/>
    <!--[if IE]>
       <link id="ieCSSStyles" rel="stylesheet" type="text/css" href=""/>
    <![endif]-->

    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
    <#if req.domain == req.siteDomain><link rel="stylesheet" type="text/css" href="${req.staticBase}/css/hashedin.css"/></#if>

    <@w.renderHeaderFragment header=t.themeCSS() cssId="themeStylesCss"/>
    <@w.renderHeaderFragment header=t.quickstylesCSS() cssId="quickStyles"/>
    <@w.renderHeaderFragment header=t.presetsCSS() cssId="presetStyles"/>
    <@w.renderHeaderFragment header=t.customCSS() cssId="customStyles"/>

    <script type="text/javascript" src="${req.staticBase}/js/yui/3.4.1/build/yui/yui-min.js"></script>
    <#if req.env != "dev"><script type="text/javascript" src="${req.staticBase}/js/preload-min.js"></script>
    <#else><script type="text/javascript" src="${req.staticBase}/js/preload.js"></script></#if>    
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
    
        if(FIRST_LOGIN)
        {
          window.location.hash = window.location.hash.replace(/\/first/g,"");
        }

        if(EDIT_MODE && !EDIT_PERMISSION)
        {
            window.location = PageData.loginUrl;
        }
    
        var Y = YUI(PageData.env == "dev" ? YUI_DEV_CONF : YUI_PROD_CONF);
    
        if(EDIT_MODE && EDIT_PERMISSION)
        {
            initSiteAndEdit();
        }else
        {
            initSiteOnly();
        }
    </script>
</head>

<body class="yui-skin-sam in-canvas">

${(req.editbar)!}
${(req.helpOverlay)!}

<#if !req.site.published && req.viewAlpha?? && req.viewAlpha>
   <div id="draftModeText" style="-webkit-transform: rotate(20deg);-moz-transform: rotate(20deg);-ms-transform: rotate(20deg);position: fixed;right:-100px; top:10px; width: 200px; color: #666; padding: 5px 10px; background-color: #333;background-color: rgba(51,51,51,0.8); z-index: 500;text-align: center;width: 500px;">
      <a style="color: #ccc;text-decoration: none;" href="${req.adminUrl!}">
         <span style="font-weight: bold; color: #666; font-size: 42px;text-shadow: 1px 2px 2px #999;">Draft</span><br/>
         <span>Login to Publish</span>
         <span style="color: #999; font-size: 12px;" onclick="document.getElementById('draftModeText').style.display='none';return false">( hide this )</span>
      </a>
   </div>
</#if>

<#-- this div is used to load facebook javascript files. See facebook-libs.ftl -->
<div id="fb-root"></div>
<#if req.isUserLoggedIn && t.owns(req.domain)>
   <#if req.editMode??>
   	<a href="javascript: Y.LUI.bookmark({'mode':'edit'});" id="startEditingLink">Start Editing</a>
   <#else>
   	<a href="${req.adminUrl!}" id="startEditingLink">Start Editing</a>
   </#if>
</#if>

<#if (req.domain == req.siteDomain)>
    <div id="topAccount" style="margin: 0 auto; width: 960px;">
        <#if !req.isUserLoggedIn>
            <div id="topActions">
                <a href="${req.siteUrl}/lt_admin/dashboard" alt="Login">Login</a>
                <span class="slash">|</span>
                <a href="${req.siteUrl}/register?category=header" alt="Register">Register</a>
            </div>
        <#else>
            <div id="topActions">
                <span>Welcome <span style="font-weight: bold;">${(req.user.fullName?capitalize)!req.user.userName}</span></span>
                <span class="slash">|</span>
                <a href="${req.siteUrl}/lt_admin/dashboard" alt="Dashboard">Dashboard</a>
                <span class="slash">|</span>
                <a href="/j_spring_security_logout" title="Sign Out" alt="Sign Out">Sign Out</a>
            </div>
        </#if>
    </div>
</#if>

<div id="c_canvas" class="c_canvas">