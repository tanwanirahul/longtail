<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link rel="shortcut icon" href="${req.staticBase}/img/favicon.ico" />
    <!-- N5-k36XmhCjNUYJFdWP_ImfoFvI For Alexa-->

    <META NAME="description" CONTENT="Editing Page" />
    <META NAME="keywords" CONTENT="HTML, CSS Editing" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/tabview/assets/skins/sam/tabview.css" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/widget-base/assets/skins/sam/widget-base.css" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/widget-stack/assets/skins/sam/widget-stack.css" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/overlay/assets/skins/sam/overlay.css" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/resize-base/assets/skins/sam/resize-base.css" />
    <link id="editCssLink" rel="stylesheet" type="text/css" href="${req.staticBase}/css/edit.css" />
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/edit-interface.css"/>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/admin/wizard.css" />

    <link href='http://fonts.googleapis.com/css?family=Niconne|Rammetto+One|Unlock|Merienda+One|Spirax|Ribeye+Marrow|Butcherman+Caps|Nosifer+Caps' rel='stylesheet' type='text/css'>

    <title>Website Creation Wizard @ DesignOnCloud</title>

    <script type="text/javascript">
        var EDIT_MODE = ${req.editMode!"false"};
        var WIZARD_MODE = true;
        var FIRST_LOGIN = ${req.firstLogin!"false"};
        var SITE_CLAIMED = ${req.site.claimed?string};
        var EDIT_PERMISSION = true;
        var userName = '${req.loggedInUserName}';
    </script>

    <@w.renderHeaderFragment header=t.themeCSS() cssId="themeStylesCss" />
    <@w.renderHeaderFragment header=t.quickstylesCSS() cssId="quickStyles" />
    <@w.renderHeaderFragment header=t.presetsCSS() cssId="presetStyles" />
    <@w.renderHeaderFragment header=t.customCSS() cssId="customStyles" />
</head>

<body class="yui-skin-sam">

<div id="topBar" class="admin-skin">
    <div class="wizard-header">
        <a href="http://designoncloud.com" target="_blank">
            <img alt="DesignOnCloud" src="${req.contentBase}/img/logo_engraved.png" style="height: 14px; position: absolute; top: 8px;" />
        </a>
        <div class="wizard-heading" style="font-size: 14px; text-align: center;">
            Welcome to Website Design Wizard : Step <span class="wizard-current-step">1</span> of 4
        </div>
    </div>
    <div class="tabs outer-tabs" style="display: block; padding-top: 6px;">
        <ul>
            <li class="yui3-tab yui3-tab-selected"><a href="#step1">1 Site Name</a></li>
            <li class="yui3-tab"><a href="#step2">2 Logo</a></li>
            <li class="yui3-tab"><a href="#step3">3 Colors</a></li>
            <li class="yui3-tab"><a href="#step4">4 Finish</a></li>
        </ul>
        <div>
            <div id="step1" class="yui3-tab-panel yui3-tab-panel-selected">
                <form>
                    <input type="hidden" name="selector" value="#siteNameText"/>
                    <div>
                        <label for="siteNameInput" style="margin-right: 3px;">Your Site Name</label>
                        <input type="text" id="siteNameInput" name="siteNameInput" style="width: 180px; padding-left: 5px;"
                                placeholder="Enter your business name" />
                        <span class="tooltip top-callout" style="left: 111px; top: 80px;">Website name, usually your business name (e.g., Acme Retailers, etc.)</span>
                        <div class="step-desc" style="display: inline-block; padding-left: 5px;">Select your style from below</div>
                    </div>
                    <div class="swatch-gallery yui3-g">
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Niconne'">Font 1</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Rammetto One'">Font 2</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Unlock'">Font 3</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Merienda One'">Font 4</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Spirax'">Font 5</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Ribeye Marrow'">Font 6</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Butcherman Caps'">Font 7</div></div>
                        <div class="yui3-u-1-8"><div class="swatch font-swatch" style="font-family: 'Nosifer Caps'">Font 8</div></div>
                    </div>
                </form>
                <div class="step-info">Once website design wizard is complete, you can style your site name using more options in advanced editor.</div>
            </div>
            <div id="step2" class="yui3-tab-panel">
                <div class="step-desc">Select a logo for your site or upload from your machine</div>
                <form class="css-style-form">
                    <input type="hidden" name="selector" value="#siteLogoImg"/>
                    <div class="swatch-gallery yui3-g" style="margin-top: 10px;">
                        <div class="yui3-u-1-10">
                            <button onclick="Y.longtail.Designer.createPreset('content-image', 'Logos', true, this)"
                                class="nav-button" style="height: 70px; margin: 0 10%;">Upload New</button>
                        </div>
                        <#list req.logos.results as logo>
                            <div class="yui3-u yui3-u-1-10">
                                <div class="swatch logo-swatch" onclick="Y.fire('custom:css', {node: this, css: {src: '${w.getPath(logo.path)}'}})">
                                    <img title="Click to select as logo" src="${w.getPath(logo.path)}" />
                                </div>
                            </div>
                        </#list>
                  </div>
                </form>
                <div class="step-info">Once website design wizard is complete, you can select a logo from many more in advanced editor.</div>
            </div>
            <div id="step3" class="yui3-tab-panel">
                <div class="step-desc">Select a color scheme for your site</div>
                <div class="swatch-gallery yui3-g" style="margin-top: 10px;">
                    <#list req.themes.results as theme>
                        <div class="yui3-u yui3-u-1-10">
                            <div class="swatch color-theme-swatch" onclick="EditInterface.changeTheme('${theme.name}', this); return false;">
                                <img title="Click to apply ${displayName!} theme" src="${req.staticBase}/css/themes/previews/color-${theme.name?replace('theme_', '')}.jpg" />
                            </div>
                        </div>
                    </#list>
                </div>
                <div class="step-info">You can get more color schemes, background images and various styling options in advanced editor.</div>
            </div>
            <div id="step4" class="yui3-tab-panel yui3-g">
                <div class="yui3-u-1-2" style="height: 127px;">
                    <div class="step-desc">Submit the form on right to own this website</div>
                    <div style="margin: 15px 0 10px;">After you click on "Finish" button, you will can access advanced editor, where you can</div>
                    <ul style="margin: 10px 0;">
                        <li class="wizard-instr-list">add/edit contents (slideshow, Facebook Like, etc.)</li>
                        <li class="wizard-instr-list">customize your website with various design options available</li>
                    </ul>
                </div>
                <div class="yui3-u-1-2">
                    <div class="wizard-signup-block yui3-g">
                        <#assign returnUrl = (req.currentUrl!"")?replace("/\\d+$", "/3", "r") />
                        <form id="wizardSignupForm" name="wizardSignupForm" class="yui3-u-2-3" style="width: 100%;"
                                action="${req.servicesBase}/site/claim" method="POST" onsubmit="return H5F.checkValidity(this);">
                            <input type="hidden" name="widgetId" value="wizardSignupForm" />
                            <input type="hidden" name="returnUrl" value="${returnUrl}" />
                            <input type="hidden" name="formName" value="wizardSignup" />
                            <input type="hidden" name="InviteCode" value="diySite" />
                            <fieldset>
                                <div class="field">
                                    <label for="Name">Name<span class="mandatory">*</span></label>
                                    <input type="text" name="Name" ftype="name" required="" placeholder="Your name">
                                    <#--<span class="tooltip top-callout" style="top: 80px;">Enter your full name</span>-->
                                </div>
                                <div class="field">
                                    <label for="Email">Email<span class="mandatory">*</span></label>
                                    <input type="email" name="Email" required="" placeholder="Your email id" value="${req.loggedInUserName!}">
                                    <#--<span class="tooltip top-callout" style="top: 110px;">We hate spam too. Your email is safe with us.</span>-->
                                    <p class="validation01"><span class="message">Please provide a valid email e.g. john@example.com</span></p>
                                </div>
                                <div class="field">
                                    <label for="New Password">Password<span class="mandatory">*</span></label>
                                    <input type="password" name="j_password" pattern=".{5,20}" placeholder="******">
                                    <span class="tooltip top-callout" style="left: 27%; position: relative; width: 65%;">Use at least 5 character password.</span>
                                    <p class="validation01"><span class="message">Please enter Password. Should be at least 5 chars long</span></p>
                                </div>
                                <div class="field" style="display: none;">
                                    <input type="submit" name="submit_action" value="Submit" class="nav-button">
                                </div>
                            </fieldset>
                        </form>
                        <div class="yui3-u-1-3 fb-login" style="display: none;">
                            <div style="font-weight: bold; margin: 20px 0 10px;">- OR -</div>
                            <div class="facebook-widget">
                                <fb:login-button>Login with FB</fb:login-button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="step-info yui3-u">You can get more color schemes, background images and various styling options in advanced editor.</div>
            </div>
        </div>
    </div>

    <div class="wizard-actions-container">
        <a id="wizardBack" href="javascript:void(0)" onclick="EditInterface.editTabs.previous()" class="wizard-back">Back</a>
        <button id="wizardContinue" onclick="EditInterface.editTabs.next()" class="nav-button wizard-continue">Continue</button>
        <#--
        <a id="wizardSkip" href="javascript:void(0)" onclick="EditInterface.editTabs.next()"
                style="float: right; margin: 5px 20px 5px 10px;">Skip to Next Step</a>
        -->
    </div>
</div>

<#include "/editor/EditTemplates.ftl"/>

<#-- this div is used to load facebook javascript files. See facebook-libs.ftl -->
<div id="fb-root"></div>

<div id="c_canvas" class="c_canvas">

<#if req.page??>${req.page.htmlFragment!}</#if>

</div> <!-- Canvas Container Close -->

<div style="clear: both;"></div>
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
        <div style="clear: both;"></div>
    </div>
</div>
</body>

<script type="text/javascript" src="${req.staticBase}/js/yui/3.4.1/build/yui/yui-min.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/preload.js"></script>

<script>
    PageData.setPage('${(req.path)!}');
    PageData.setNavBase('${req.navBase}');
    PageData.setStaticBase('${req.staticBase}');
    PageData.setContentBase('${req.contentBase}');
    PageData.setServicesBase('${req.servicesBase}');
    PageData.setTheme('${themeName!"theme1"}');
    PageData.setEnv('${req.env}');
    PageData.setLoginUrl('${req.signInUrl!}');
    PageData.setLoginState(${req.isUserLoggedIn?string});
    PageData.setEditbarTab(${(req.params.step)!});

    var Y = YUI(PageData.env == "dev" ? YUI_DEV_CONF : YUI_PROD_CONF);
    initSiteAndEdit(function(Y){
        var onTabChange = function(selIdx) {
            var totalTabs = EditInterface.editTabs.size();
            Y.one('.wizard-current-step').set("innerHTML", selIdx + 1);
            if (selIdx + 1 == totalTabs)
            {
                // Y.one("#wizardSkip").setStyle("display", "none");
                var wizardContBtn = Y.one("#wizardContinue");
                wizardContBtn.set("innerHTML", "Finish");
                wizardContBtn.removeClass("wizard-continue");
                wizardContBtn.addClass("wizard-finish");
                wizardContBtn.set("onclick", function(){
                    var signupForm = Y.one("#wizardSignupForm");
                    H5F.setup(signupForm.getDOMNode());
                    signupForm.get("submit_action").simulate("click");
                });
            } else
            {
                // Y.one("#wizardSkip").setStyle("display", "block");
                var wizardContBtn = Y.one("#wizardContinue");
                wizardContBtn.set("innerHTML", "Continue");
                wizardContBtn.removeClass("wizard-finish");
                wizardContBtn.addClass("wizard-continue");
                wizardContBtn.set("onclick", EditInterface.editTabs.next);
            }
        }

        var tabview = EditInterface.editTabs;
        var selectedTab = tabview.get('selection');
        var selectedIdx = tabview.indexOf(selectedTab);
        onTabChange(selectedIdx);
        FacebookInit(Y.one("#step4"));

        Y.one("#siteNameInput").on("change", function(e) {
            var siteNameInput = e.currentTarget;
            var siteName = siteNameInput.get("value");
            Y.one("#siteNameText").set('innerHTML', siteName);
            Y.all(".font-gallery .swatch").set('innerHTML', siteName);
            Y.longtail.SaveQueue.save('custom-attribute', {node: 'siteNameText', name: 'text', value: siteName});
        });
        Y.all(".swatch").on("click", function(e){
            var node = Y.one(e.target);

            node.ancestor(".swatch-gallery").all(".selected").removeClass("selected");
            node.addClass("selected");

            if (node.hasClass("font-swatch"))
            {
                var fontFamily = node.getStyle("fontFamily");
                Y.fire('custom:css',{node: node, css: {'fontFamily': fontFamily}});
                Y.longtail.SaveQueue.save('custom-styles', {node: 'siteNameText', css: {'fontFamily': fontFamily}});
            }
        });
        EditInterface.editTabs.on('selectionChange', function(e){
            var newVal = e.target.indexOf(e.newVal);
            onTabChange(newVal);
        });
    });
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

        // For Wizard mode
        _gaq.push(['_setCustomVar', 1, 'mode', 'wizard', 3]);

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
