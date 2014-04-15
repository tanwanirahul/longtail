<div id="pageForm" class="yui3-g" style="padding: 20px 10px;">
  <#assign addPage = true />
  <#if req.page?? && req.page?has_content><#assign addPage = false /></#if>
  <#if addPage>
    <form action="${req.servicesBase}/page/create">
  <#else>
    <form action="${req.servicesBase}/site/updatePage">
      <input type="hidden" name="oldPath" id="oldPath" value="${req.page.path!}" />
  </#if>
      <label class="yui3-u-1-3">Page Name: </label>
      <input type="text" name="name" id="pageName" value="${addPage?string('New Page', (req.page.name)!)}"
          class="page-form-textbox yui3-u-2-3" onchange="EditInterface.populatePagePath(this.form)" />
      <label class="yui3-u-1-3">Path: </label>
      <input type="text" name="path" id="pagePath" value="${addPage?string('/new-page/', (req.page.path)!)}"
          class="page-form-textbox yui3-u-2-3" />
      <label class="yui3-u-1-3">Page Title: </label>
      <input type="text" name="title" id="pageTitle" value="${addPage?string('New Page Title', (req.page.title)!)}"
          class="page-form-textbox yui3-u-2-3" />
      <label class="yui3-u-1-3">Show In Menu: </label>
      <input type="checkbox" name="showOnNav" id="pageShownOnNav" <#if addPage || (req.page.showOnNav)??>checked="checked"</#if>
          class="yui3-u-2-3" style="margin: 3px 0 4px;" />
      <label class="yui3-u-1-3">Description: </label>
      <input type="text" name="description" id="pageDescription" value="${addPage?string('', (req.page.description)!)}"
          class="page-form-textbox yui3-u-2-3" />
      <label class="yui3-u-1-3">Keywords: </label>
      <input type="text" name="keywords" id="pageKeywords" value="${addPage?string('', (req.page.keywords)!)}"
          class="page-form-textbox yui3-u-2-3" />
      <input type="submit" class="page-action-btn" value="${addPage?string('Add Page', 'Update')}" />
    </form>
</div>