<ul id="${widgetId}" class="editable <#list labels as label>${label!} </#list>">
<#if childs?has_content>
    <#list childs as pageFragments>
      <li>${pageFragments.htmlFragment}</li>
    </#list>
  </#if>
</ul>
