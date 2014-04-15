<#if el.uuid == "siteLogoImg">
  <#assign defaultImg = "/static/img/sample_logo.png" />
<#else>
  <#assign defaultImg = "/static/img/no_img.jpg" />
</#if>
<div id="${el.uuid}" class="editable image-div <#list labels as label>${label!} </#list>"><#if el.link?has_content><a href="${el.link}"></#if><img src="${(el.path)!defaultImg}" alt="${el.altText!}" /><#if el.link?has_content></a></#if></div>
