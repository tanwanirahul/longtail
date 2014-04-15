<div id="${widgetId}" class="json-data-template <#list labels as label>${label!} </#list>">
	<#assign data = t.url(el.url)/>	
	<#include "${el.template}"/>
</div>