<#list rules as r>
	
	<#list r.selectors as s>${s.name}<#if s_has_next>, </#if></#list>
	{
		<#assign styles = r.rulesList/>
		<#list styles as k>
			${k[0].name} : ${k[1].value};
		</#list>
	}
</#list>