<#if el.cssText?has_content>
	<style>${el.cssText}</style>
</#if>
<#list childs as pageFragments>
	${pageFragments.htmlFragment}
</#list>
