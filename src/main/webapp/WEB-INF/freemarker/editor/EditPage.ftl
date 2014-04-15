<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Cloud Editor @ DesignOnCloud</title>

    <META NAME="description" CONTENT="Editing Page"/>
    <META NAME="keywords" CONTENT="HTML, CSS Editing"/>
    <!-- N5-k36XmhCjNUYJFdWP_ImfoFvI For Alexa-->

    <link rel="shortcut icon" href="${req.staticBase}/img/favicon.ico"/>

    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/tabview/assets/skins/sam/tabview.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/widget-base/assets/skins/sam/widget-base.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/widget-stack/assets/skins/sam/widget-stack.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/overlay/assets/skins/sam/overlay.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/resize-base/assets/skins/sam/resize-base.css"/>
    <link id="editCssLink" rel="stylesheet" type="text/css" href="${req.staticBase}/css/edit.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/edit-interface.css"/>
    <#if req.domain == req.siteDomain>
        <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/hashedin.css"/>
    </#if>

    <script type="text/javascript">
        var EDIT_MODE = ${req.editMode!"true"};
        var FIRST_LOGIN = ${req.firstLogin!"false"};
        var SITE_CLAIMED = ${req.site.claimed?string};
        var EDIT_PERMISSION = true;
        var userName = '${req.loggedInUserName}';
    </script>

    <@w.renderHeaderFragment header=t.themeCSS() cssId="themeStylesCss"/>
    <@w.renderHeaderFragment header=t.quickstylesCSS() cssId="quickStyles"/>
    <@w.renderHeaderFragment header=t.presetsCSS() cssId="presetStyles"/>
    <@w.renderHeaderFragment header=t.customCSS() cssId="customStyles"/>
</head>

<body class="yui-skin-sam in-canvas">

<#include "/admin/editbar-new.ftl"/>
<#include "/editor/EditTemplates.ftl"/>
<#-- this div is used to load facebook javascript files. See facebook-libs.ftl -->
<div id="fb-root"></div>

<#if req.isUserLoggedIn && t.owns(req.domain) && req.editMode??>
    <a href="javascript: Y.LUI.bookmark({'mode':'edit'});" id="startEditingLink" class="preview-link">Continue Editing</a>
</#if>

<div id="c_canvas" class="c_canvas">
    <#if req.page??>${req.page.htmlFragment!}</#if>
</div> <!-- Canvas Container Close -->

<div style="clear:both"></div>
<div class="site-footer">
    <div class="footer-widget">
        <div id="copyrightAndLinks">
            <p>${siteName!} All rights reserved.</p>
            <p class="footer-links">
                <a href="${req.siteUrl}/contact/">Feedback</a> |
                <a href="${req.siteUrl}/blog/">Blog</a> |
                <a href="${req.siteUrl}/privacy/">Privacy Policy</a> |
                <a href="${req.siteUrl}/tos/">Terms of Service</a>
            </p>
        </div>
        <div id="poweredBy">
            <a href="${req.adminUrl!}">Admin</a> |&nbsp;
            Powered by <a href="http://${req.siteDomain}">HashedIn Technologies Pvt. Ltd.</a>&reg;
        </div>
        <div id="followUs" class="follow-us-on">
            <div style="padding-right: 5px;">Follow Us</div>
            <ul class="links-list">
                <li class="yui3-u facebook link"><a rel="nofollow" target="_new" href="http://www.facebook.com/hashedin"><div class="facebook"></div></a></li>
                <li class="yui3-u twitter link"><a rel="nofollow" target="_new" href="http://twitter.com/HashedIn"><div class="twitter"></div></a></li>
                <li class="yui3-u linkedin link"><a rel="nofollow" target="_new" href="http://www.linkedin.com/company/hashedin/"><div class="linkedin"></div></a></li>
            </ul>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

</body>

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
    // Select widgets tab by default
    PageData.setEditbarTab(1);

    var Y = YUI(PageData.env == "dev" ? YUI_DEV_CONF : YUI_PROD_CONF);
    initSiteAndEdit();
</script>
<#-- Google Analytics Integration -->
<script type="text/javascript">
    if (PageData.env == "prod" && userName.indexOf("@hashedin.com") == -1 )
    {
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-17846832-2']);
        _gaq.push(['_setDomainName', '.designoncloud.com']);
        _gaq.push(['_setAllowLinker', true]);
        _gaq.push(['_trackPageview']);
        _gaq.push(['_trackPageLoadTime']);

        // For Edit mode
        _gaq.push(['_setCustomVar', 1, 'mode', 'edit', 3]);
        if (FIRST_LOGIN)
        {
            _gaq.push(['_trackEvent', 'Lead', 'autosignup', '${(req.user.id)!}']);
        }

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    }

    (function() {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/plusone.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
    })();
</script>

</html>
