<#assign pages=themes!req.themes />
<@w.renderPagination page=pages targetId="imageBrowseList" targetUrl="${req.servicesBase}/styles/browse/themes?"
    filters=["Color", "Typography", "Navigation", "Button", "Forms" ] />
<#assign filters = req.params.filters!"Color" />
<div class="gallery-container yui3-g">
  <#list pages.results as theme>
    <#assign displayName = theme.name?replace("theme_", "")?replace("-", " ")?capitalize />
    <div class="swatch-container yui3-u yui3-u-1-${pages.pageSize!10}">
      <div class="Theme-swatch ${filters}-swatch" onclick="EditInterface.changeTheme('${theme.name}', this); return false;">
        <img title="Click to apply ${displayName} theme" src="${req.staticBase}/css/themes/previews/${filters?lower_case}-${theme.name?replace('theme_', '')}.jpg" /> <br/>
        <span>${displayName}</span>
      </div>
    </div>
  </#list>
</div>
