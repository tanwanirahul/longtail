<ul id="${widgetId}" class="<#list labels as label>${label!} </#list> editable yui3-g">
  <#list el.pages as p><#--
      --><#assign className>${(p.path == req.path)?string("selected", "")}</#assign><#--
      --><li class="link yui3-u ${className}"><a href="${req.navBase}${p.path}">${p.name!}</a></li><#--
  --></#list>
</ul>