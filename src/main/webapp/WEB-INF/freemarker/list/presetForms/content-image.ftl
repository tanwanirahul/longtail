  <form id="imageUploadForm" action="${req.servicesBase}/image/upload" class="ajax-form"
      enctype="multipart/form-data" style="margin:20px;" method="POST">
    <label>Upload Image: </label>
    <input type="file" name="file"/>
    <input type="hidden" name="filters" value="${req.params.filters!}"/>
    <input type="submit" value="Upload" style="float: right;"
        onclick="Y.longtail.forms.fileUpload('#imageUploadForm', '${req.servicesBase}/image/upload'); return false;">
  </form>

  <div style="font-weight: bold; margin:15px 20px;display:none;">- OR -</div>
  
  <#if req.params.type == "content-image">
  	<#assign formAction="${req.servicesBase}/image/upload"/>
  <#else>
  	<#assign formAction="${req.servicesBase}/styles/create"/>
  </#if>
  <form action="${formAction}" class="preset-form-create ajax-form" method="POST" style="margin: 0 0 5px 40px;display:none;">
    <input name="type" value="${req.params.type!}" type="hidden">
    <input type="hidden" name="filters" value="${req.params.filters!}"/>
    <label>Image URL: </label>
    <input name="img_url" value="${req.params.img_url!}" type="text">
    <div style="float: right;">
      <input type="submit" name="Save" value="Save">
      <input type="submit" name="Cancel" class="exit" value="Cancel"> 
    </div>
  </form>
