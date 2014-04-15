<div id="topBar">
  <div class="logo">
    <a href="http://designoncloud.com" target="_blank">
        <img alt="DesignOnCloud" src="${req.contentBase}/img/logo_engraved.png" style="height: 12px;"/>
    </a>    
  </div>

  <div id="userProfileRight" class="yui3-g">
    <div id="accountActions" class="toggle-select yui3-u">
      <div id="accountActionsTab">
        <span class="icon">&#x25bc;</span>
      </div>
      <div id="accountOptions">
        <div><span class="user-name"> ${(req.user.userName)!}</span></div>
        <div><a href="${req.siteUrl}/lt_admin/dashboard">Dashboard</a></div>
        <div><a href="${req.siteUrl}/lt_admin/profile">Profile</a></div>
        <#if !(req.site.published)>
          <div><a href="${req.siteUrl}/lt_admin/publish?site=${req.site.domain}" class="launch-now-button" title="Publish Site">Publish</a></div>
        </#if>
        <#if req.user?? && req.user.membership == "SuperAdmin">
          <div><a href="/admin/translations">Translations</a></div>
        </#if>
        <div style="border-bottom: none;"><a href="/j_spring_security_logout" title="Logout">Sign Out</a></div>
      </div>
    </div>

    <div class="help-button yui3-u" onclick="Y.LUI.open('helpoverlay'); return false;">
      <a href="${req.siteUrl}/overlays/help" title="Help" class="">Help</a>
    </div>
    <div class="preview-action yui3-u">
      <a title="Preview Website" href="javascript: Y.LUI.bookmark({'mode':'preview'});">Preview</a>
    </div>
    <#if !(req.site.published)>
      <div class="publish-action yui3-u">
        <a title="Publish Website" href="${req.siteUrl}/lt_admin/publish?site=${req.site.domain}">Publish</a>
      </div>
    </#if>

    <#if req.user?? && req.user.membership == "SuperAdmin">
        <div class="help-button yui3-u" onclick="Y.LUI.open('guidedinterface'); return false;">
          <a href="${req.siteUrl}/overlays/help" title="Help" class="">Guide</a>
        </div>
        <div class="yui3-u last-updated-date" ><b>Last Updated at:</b><br/>
            <div style="color:#CDCDCD;" id="modified-date">${req.site.lastModifiedDate?string("d MMM, yyyy, HH:mm:ss")}</div>
        </div>
    </#if>

  </div>

  <div id="user-msg" class="notice-area"></div>

  <#if !(req.site.claimed)>
    <div id="user-publish-msg" class="notice-area">
      You haven't claimed this site yet.
      <a href="${req.navBase!}/overlays/publishForm" class="launch-now-button"
         onclick="OpenOverlay({href: '${req.navBase!}/overlays/claimForm',headerContent: 'Claim your Site',srcElement: null,type: 'launch',centered : true,closeOnSubmit: false}); return false;"
         title="Publish Site" style="color: blue;font-weight: bold;">Claim Now</a>
    </div>
  <#elseif !(req.site.published)>
    <#--
    <div id="user-publish-msg" class="notice-area">
        You haven't launched this site yet.
        <a href="${req.navBase!}/overlays/publishForm" class="launch-now-button"
           onclick="OpenOverlay({href: '${req.navBase!}/overlays/publishForm',headerContent: 'Launch your Site',srcElement: null,type: 'launch',centered : true,closeOnSubmit: false}); return false;"
           title="Publish Site" style="color: blue;font-weight: bold;">Launch Now</a>
    </div>
    -->
  <#elseif (req.params.fp)??>
    <div id="user-publish-msg" class="notice-area" style="left: auto; right: 220px; width: auto; background-color: #FFFBBB; border-color: #FFFBBB;">
      Congratulations! Your site is now available at
      <a href="${req.siteBase}" style="text-decoration: underline; color:blue;">${req.siteBase}</a>
      <span onclick="EditInterface.closeSitePublishMsg()" style="margin-left: 10px; cursor: pointer; font-weight: bold;">x</span>
    </div>
  </#if>

  <div id="editActionBar" class="outer-tabs tabs">
    <ul class="yui3-tabview-list menu-item-buttons">
      <li class="site-layout-button yui3-tab" title="Change Theme"><a href="#layout">Layouts</a></li>
      <li class="theme-button yui3-tab" title="Change Theme"><a href="#themes">Themes</a></li>
      <li class="manage-page-button yui3-tab" title="Edit Page Styles"><a href="#pages">Pages</a></li>
      <li class="widget-button yui3-tab yui3-tab-selected" title="Add Widgets"><a href="#widgets">Widgets</a></li>
      <li class="yui3-tab design-mode design-settings-button" title="Styling" style="background:none; border:none;margin-bottom: 0px;">
        <a class="design-button yui3-tab-label yui3-tab-content" href="#design" onclick="EditInterface.toggleTabMode('design')">Styles</a>
        <#if req.user?? && req.user.membership == "SuperAdmin">
          <a class="settings-button yui3-tab-label yui3-tab-content" href="#design" onclick="EditInterface.toggleTabMode('settings')">Settings</a>
        </#if>
      </li>
      <li class="close-button yui3-tab" title="Collapse Tab Panel"><a href="#close">Close</a></li>
    </ul>
    <#-- Tabs Panel -->
    <div>
      <div id="siteLayoutGallery" class="selection-pane yui3-tab-panel">
        <div class="arrow-top" style="left: 242px;"></div>
        <div class="gallery-container yui3-g">
          <div class="yui3-u-3-4 yui3-g">
            <ul>
            <li class="yui3-u"><div class="site-layout-option yui3-u" onclick="EditInterface.changeSiteLayout('default-layout')" style="background-position: -2px -8px;">Default Layout</div></li>
            <li class="yui3-u"><div class="site-layout-option yui3-u" onclick="EditInterface.changeSiteLayout('left-side-bar-layout')" style="background-position: -165px -8px;">Left Sidebar Layout</div></li>
            <li class="yui3-u"><div class="site-layout-option yui3-u" onclick="EditInterface.changeSiteLayout('right-side-bar-layout')" style="background-position: -85px -8px;">Right Sidebar Layout</div></li>
            <li class="yui3-u"><div class="site-layout-option yui3-u" onclick="EditInterface.changeSiteLayout('three-column-layout')" style="background-position: -250px -8px;">Three Column Layout</div></li>
            <li class="yui3-u"><div class="site-layout-option yui3-u" onclick="EditInterface.changeSiteLayout('custom-layout')" style="background-position: -329px -8px;">Custom Layout</div></li>
            </ul>
          </div>

          <div class="yui3-u-1-4 yui3-u">
            <form id="layoutStylesForm">
              <div class="canvas-style-section">
                <label class="canvas-style-section-title" style="display: inline-block; zoom: 1; *display: inline; font-size: 100%; font-weight: bold;">Layout Style</label>
                <select onchange="Y.fire('custom:css', {node: this, css: {margin: this.value}})" style="margin: 4px;">
                  <option value="0 auto">Centered</option>
                  <option value="0">Left</option>
                </select>
                <div class="width-choices yui3-g">
                  <fieldset class="yui3-g preset-selections">
                    <#include "/components/layoutWidth"/>
                  </fieldset>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

      <div id="themeGallery" class="selection-pane yui3-tab-panel">
        <div class="theme-selection-overlay">
          <div class="yui3-widget-bd">
            <#include "themes.ftl"/>
          </div>
        </div>
      </div>

      <div id="sitePagesGallery" class="selection-pane yui3-tab-panel">
        <div class="arrow-top" style="left: 304px;"></div>
        <div class="gallery-container" <#if req.pages?size &gt; 10>style="overflow-y: scroll;height: 100%;"</#if>>
          <div class="yui3-g">
            <div class="yui3-u-1 gallery-container-help-msg">Click on Page icon to navigate to it</div>
            <ul class="site-pages-list yui3-u-7-8">
              <#list req.pages as page>
                <li class="yui3-u site-page <#if (req.params.path)?? && page.path == req.params.path>selected</#if>">
                  <a href="${page.path}" class="admin-nav-link site-nav-link site-layout-option">${page.name!}</a>
                </li>
              </#list>
              <li class="yui3-u" onclick="Y.LUI.open('updatepageoverlay',{headerContent: 'Adding New Page' + CLOSE_BUTTON_TEMPLATE})" style="padding-top: 5px;">
                <a href="#" class="site-nav-link site-layout-option">+ Add Page</a>
              </li>
            </ul>
            <div class="action-buttons yui3-u-1-8">
              <button style="margin:20px 0 10px 0;width:100px;" onclick="Y.LUI.open('updatepageoverlay',{href: PageData.servicesBase + '/page/edit?path=' + PageData.path})">Page Settings</button>
              <button style="margin-bottom:10px;width:100px;" onclick="Y.LUI.open('updatepageoverlay',{headerContent: 'Adding New Page ' + CLOSE_BUTTON_TEMPLATE})">Add New Page</button>
              <#if req.user.membership == "SuperAdmin">
                <br/>
                <a style="margin:10px 0;" href="javascript:EditInterface.deletePage()">Delete Page</a>
              </#if>
            </div>
          </div>
        </div>
      </div>

      <div id="selectionOverlay" class="selection-pane yui3-tab-panel" >
        <div class="arrow-top" style="left: 118px;"></div>
        <div id="widgetGallery" class="gallery-container inner-tabs" <#if req.widgets?size &gt; 14>style="overflow-y: scroll;"</#if>>
          <div class="yui3-u-1 gallery-container-help-msg">Drag and Drop the widgets on the canvas</div>
          <#list req.widgets as w>
            <div class="yui3-u sample-widget widget-sprite-${w.name}" type="${w.name}" title="${w.description!}">
              <span>${w.title!}</span>
            </div>
          </#list>
        </div>
      </div>

      <div class="selection-pane yui3-tab-panel">
        <form name="cssStyleForm" class="css-style-form design-mode yui3-g" action="" onsubmit="return false">
          <div class="yui3-u current-selector">
            <div class="legend">Selection</div>
            <div class="browse-layout" onclick="EditInterface.siteSelectionOverlay();">
            </div>
            <div class="selected-widget" title="Click and select element to edit its style"
                onclick="EditInterface.highlightSelection();">Click to Select</div>
            <div id="selectionOverlayContainer"></div>
            <input type="hidden" class="selector-value" name="selector" value=""/>
            <#if req.user?? && (req.user.membership == "Premium" || req.user.membership == "SuperAdmin")>
              <div style="float: right;margin-right: 3px;"><a href="${req.servicesBase}/styles/saveAndShareQuickStyle"
                  onclick="EditInterface.saveAndShare(document.forms['cssStyleForm'].selector.value); return false">Save &amp; Share</a></div>
            </#if>
          </div>

          <div class="css-styles yui3-u">
            <#include "/overlays/cssForm.ftl"/>
          </div>
          <div class="element-attributes yui3-u">
            <#include "itemsettings.ftl"/>
          </div>

          <fieldset class="field-extension"></fieldset>
        </form>
      </div>

      <#-- The empty DIV element below is for dummy tab for "Close" button -->
      <div></div>

    </div>
  </div>
</div>

