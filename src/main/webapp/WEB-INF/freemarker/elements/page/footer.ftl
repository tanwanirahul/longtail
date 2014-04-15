  </div> <!-- Canvas Container Close -->
<div style="clear:both"></div>
<div class="site-footer">
    <div class="footer-widget">
        <div id="copyrightAndLinks">
            <p>&copy; <#if req.domain == req.siteDomain>HashedIn Technologies Private Limited<#else>${siteName}</#if> All rights reserved.</p>
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
              <li class="yui3-u"><g:plusone annotation="none"></g:plusone></li>
            </ul>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<#if (req.site.cloneable)?? && req.site.cloneable && !req.user??>
    <style>
        #cloneSiteOverlay {right: 0!important;top: 200!important; width: auto!important;height: auto!important;top: 200px !important;font: 16px/1.231 arial, helvetica, clean, sans-serif;}
        .open#cloneSiteOverlay {right: 200px!important;top: 100px !important;-webkit-transition: all 0.5s ease-out; -moz-transition: all 0.3s ease-out;}
        .open#cloneSiteOverlay .clone-message {display: none;}
        .closed#cloneSiteOverlay {background: transparent;border: none;-webkit-transition: all 0.5s ease-out;-moz-transition: all 0.3s ease-out;}
        .closed#cloneSiteOverlay:HOVER {border-right: 5px solid #000000;}
        .closed#cloneSiteOverlay .clone-form, .closed#cloneSiteOverlay .yui3-widget-hd,.closed#cloneSiteOverlay .mask {display: none;}
        #cloneSiteOverlay .help-text {font-size: 10px;margin: 2px 0 0 122px;}
        #cloneSiteOverlay label {*display: inline; zoom: 1;display: inline-block; width: 100px;text-align: right;font-size:13px;margin-right:15px;font-weight:bold;}
        #cloneSiteOverlay .field {margin: 15px 0;font-size:13px;}
        #cloneSiteOverlay .field-submit {text-align: right;}
        #cloneSiteOverlay .errors {color: #FF1111;font-size:14px;}
    </style>
    <div id="cloneSiteOverlay" class="<#if (req.params.clone)?? || (req.params.errors)??>open<#else>closed</#if> yui3-overlay-help yui3-widget yui3-overlay yui3-longtail-overlay yui3-widget-positioned yui3-widget-stacked" style="z-index: 110;">
        <div class="mask" style="position: fixed;z-index: -1;left:0;right:0;top:0;bottom:0;background: #000000; opacity: 0.3; filter:alpha(opacity=30);"></div>
        <div class="yui3-widget-hd">Make it your own<div class="close" style="cursor: pointer;" onclick="Y.one('#cloneSiteOverlay').replaceClass('open', 'closed');">X</div></div>
        <div class="yui3-widget-bd">
        <div class="side-overlay closed">
            <div class="clone-message">
                <a href="#clone" onclick="Y.one('#cloneSiteOverlay').replaceClass('closed','open');return false;"><img src="${req.staticBase}/img/make-own-button.png"/></a>
            </div>
    
            <div class="clone-form" style="width: 360px; padding: 20px;">
                <p style="font-size: 1.1em;font-weight: bold;">Sign Up to claim and start editing this site</p>
                <p style="font-size: 0.8em;margin-bottom: 10px;"><i>(You can change text, design, images and do lots more once you sign up)</i></p>
                <@w.form el={"formName":"autosignup", "action":"${req.servicesBase}/site/createAccountAndCloneSite"} method="post"/>
            </div>
        </div>
        </div>
    </div>
</#if>

</body>

<script type="text/javascript">
    if (PageData.env == "prod" && userName.indexOf("@hashedin.com") == -1 )
    {
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-17846832-2']);
        _gaq.push(['_setDomainName', '.designoncloud.com']);
        _gaq.push(['_setAllowLinker', true]);
        _gaq.push(['_trackPageview']);
        _gaq.push(['_trackPageLoadTime']);

        if (FIRST_LOGIN)
        {
            _gaq.push(['_trackEvent', 'Lead', 'autosignup', '${(req.user.id)!}']);
        }
        <#if (req.thankYouForm.values.formName)??>
            _gaq.push(['_trackEvent', 'Lead', '${req.thankYouForm.values.formName}', '${(req.thankYouForm.uuid)!}']);
        </#if>

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
