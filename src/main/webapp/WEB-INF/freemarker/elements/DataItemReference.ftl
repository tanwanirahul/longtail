<h1>${widgetId}</h1>
<#list childs as pageFragments>
	<div style="margin-left: 5px;">
	  ${pageFragments.htmlFragment}
	</div>
</#list>
