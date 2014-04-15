<link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/css/components/editbar-new.css"/>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.4.1/build/tabview/assets/skins/sam/tabview.css"/>

<div id="topBar" class="admin-skin">
	<div class="border-bar">
		<div style="float: left;overflow: hidden;"><img alt="" src="${req.contentBase}/img/logo_engraved.png" style="height: 12px;margin: 6px 10px;"/></div>
		
		<div style="float: right;">
			<ul class="menu-nav">
				<li><a href="">Help</a></li>
				<li><a href="">Launch</a></li>
				<li><a href="javascript:void(0)" class="settings-icon" 
				       style="height: 12px; display: block; padding: 9px 10px 9px 25px;background-position: -1px -516px"> &#x25bc;</a>
					<ul>
						<li><a href="javascript:void(0)">${(req.user.userName)!}</a></li>
						<li><a href="${req.siteUrl}/lt_admin/dashboard">Dashboard</a></li>
						<li><a href="${req.siteUrl}/lt_admin/profile">Profile</a></li>
						<#if !(req.site.published)>
          					<li><a href="${req.siteUrl}/lt_admin/publish?site=${req.site.domain}" title="Publish Site">Publish</a></li>
        				</#if>
						<li><a href="/j_spring_security_logout" title="Logout">Sign Out</a></li>
						<li><a href="javascript:void(0)"></a></li>
						<li><a href="${req.siteUrl}/overlays/help" title="Help" class="">Help</a></li>
						<li><a title="Preview Website" href="javascript: Y.LUI.bookmark({'mode':'preview'});">Preview</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="tab-panel editbar-tabs">
		<ul class="yui3-tabview-list">
	      <li class="yui3-tab" title="Change Theme"><a class="yui3-tab-label" href="#themes">Themes</a></li>
	      <li class="yui3-tab" title="Add Widgets"><a class="yui3-tab-label" href="#widgets">Widgets</a></li>
	      <li class="yui3-tab yui3-tab-selected" title="Add Widgets"><a class="yui3-tab-label" href="#widgets">Design</a></li>
      	  <li class="close-button yui3-tab" title="Collapse Tab Panel"><a class="yui3-tab-label" href="#close">Close</a></li>
    	</ul>
    	
    	<div class="yui3-tabview-panel">
   			<div id="themeGallery" class="yui3-tab-panel">
       			<div class="theme-selection-overlay">
         				<div class="yui3-widget-bd">
           				<#include "themes.ftl"/>
          			</div>
        		</div>
      		</div>

    		<div id="widgetGallery" class="yui3-tab-panel" <#if req.widgets?size &gt; 14>style="overflow-y: scroll;"</#if>>
	          <div class="yui3-u-1 small-text">Drag and Drop the widgets on the canvas</div>
	          <#list req.widgets as w>
	            <div class="yui3-u sample-widget widget-sprite-${w.name}" type="${w.name}" title="${w.description!}">
	              <span>${w.title!}</span>
	            </div>
	          </#list>
	        </div>
    		
    		<#include "tabs/design.ftl"/>
    		<div class="yui3-tab-panel"></div>
    	</div>
    	
	</div>

	

</div>