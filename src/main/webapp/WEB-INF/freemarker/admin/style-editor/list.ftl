<#include "header.ftl"/>
  <@w.renderPagination page=page targetId="imageBrowseList" targetUrl="${req.servicesBase}/admin/styles/list?type=${req.params.type}&filter=${req.params.filters}" 
  filters=["General","Button", "Forms","Table","Navigation"]/>
  <div class="quickstyles-list yui3-g">
    <#list page.results as q>
      <div class="yui3-u-1-2">
        <style>
          ${q.cssText?replace("CLASS-NAME", q.name)}
        </style>
        <div class="container">
          <div class="box-preview ${q.name}"></div>
        </div>
        <a href="edit?name=${q.name}" class="edit-quickstyles">${q.name} Edit</a>
      </div>
    </#list>
  </div>
<#include "footer.ftl"/>