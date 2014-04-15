<div class="preset-selection-div" class="yui3-g">
  <div class="presets-list yui3-u-1">
    <@w.renderPagination page=page targetId="imageBrowseList"
        targetUrl="${req.servicesBase}/styles/browse/${req.params.type}?" filters=req.filters![]/>
    
    <div class="preset-swatches yui3-g">
      <#list page.results as p>
        <@w.renderSwatch p=p type=req.params.type pageSize=page.pageSize filters=req.params.filters/>
      </#list>
    </div>
  </div>
  <div class="action-buttons yui3-u">
  	<#if req.params.type == "quickstyles">
  		<button class="create-new" onclick="Y.longtail.StyleSelector.createQuickStyle()">+ Create New</button>
  		<button class="clear-styles" onclick="Y.longtail.StyleSelector.clearStyles(this, 'quickstyles')">x Clear Styles</button>
  	<#else>
    	<button class="create-new" onclick="Y.longtail.Designer.createPreset('${req.params.type}','${req.params.filters!}')">+ Create New</button>
    	<button class="clear-styles" onclick="Y.longtail.StyleSelector.clearStyles(this, '${req.params.type}')">x Clear</button>
    </#if>
    
    <button class="done">Save &amp; Close</button>
  </div>
</div>
