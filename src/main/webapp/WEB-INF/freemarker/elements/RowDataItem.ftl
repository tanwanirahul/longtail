<tr id="${widgetId}" class="el-editable-marker">
<#if childs?has_content>
    <#list childs as pageFragments>
      <td id="${widgetId}_${pageFragments_index}" class="editable">${pageFragments.htmlFragment}</td>
    </#list>
  </#if>
</tr>