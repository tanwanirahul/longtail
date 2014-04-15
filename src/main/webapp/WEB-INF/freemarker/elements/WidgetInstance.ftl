<#if labels?seq_contains("section")><div id="c_${widgetId}" class="layout-widget-container section-container"></#if><#--
--><div id="${widgetId}" class="<#list labels as label>${label!} </#list> <#if labels?seq_contains("section")>childs-${childs?size}</#if> <#if labels?seq_contains("column") && !(childs?has_content)>empty</#if>"><#--
  --><#if childs?has_content><#--
    --><#list childs as pageFragments><#--
      -->${pageFragments.htmlFragment}<#--
    --></#list><#--
  --></#if><#--
--></div><#--
--><#if labels?seq_contains("section")></div></#if>