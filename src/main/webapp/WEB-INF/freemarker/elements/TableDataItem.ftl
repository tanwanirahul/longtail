<table id="${widgetId}" class="el-editable-marker <#list labels as label>${label!} </#list>">
<#if childs?has_content>
    <#list childs as pageFragments>
      ${pageFragments.htmlFragment}
    </#list>
  </#if>
</table>