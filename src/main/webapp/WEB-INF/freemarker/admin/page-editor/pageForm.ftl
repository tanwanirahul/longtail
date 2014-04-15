<!DOCTYPE html>
<html>
<head>
  <title>Updating Page</title>
  <style>
     body {
       color: #fff;
       font: 13px "Lucida Sans Unicode",Arial,Helvetica,sans-serif;
     }

     .field {
        padding-left: 10px;
     }
    
     label {
       display: inline-block;
       *display: inline;
       zoom: 1;
       width: 100px;
       vertical-align: top;
       text-align: right;
       color: #ABABAB;
     }

     label, input, textarea {
       padding: 2px 5px;
     }

     input[type=checkbox] { margin: 7px 2px; }

     .submit-field {
       text-align: right;
       padding: 10px;
     }

     .errors {
       color: red;
     }
     
     .pageSectionHeading {
       padding: 8px 0;
       font-size: 125%;
       color: #EFEFEF;
     }
  </style>

</head>
<body id="iframeBody">
<#assign form=JspTaglibs["/WEB-INF/spring-form.tld"]>
<@form.form modelAttribute="pageObj" action="/lt_admin/services/page/edit" class="ajax-form" method="POST">

  <div class="errors">
    <@form.errors path="*"/>
  </div>

  <div class="pageSectionHeading"> 
    Page Data
  </div>
  
  <div class="field">
    <label for="name">Page Name</label>
    <@form.input path="name"/>
  </div>

  <div class="field">
    <label for="path">Page Path</label>
    <#if pageObj.path?? && pageObj.path == "/">
      <@form.input path="path" disabled="disabled"/>
    <#else>
      <@form.input path="path"/>
    </#if>
  </div>

  <div class="field">
    <label for="title">Page Title</label>
    <@form.input path="title"/>
  </div>

  <div class="field">
    <label for="showOnNav">Show In Menu</label>
    <@form.checkbox path="showOnNav" />
  </div>

  <div class="pageSectionHeading"> 
    Meta Data (for SEO)
  </div>
   
  <div class="field">
    <label for="title">Description</label>
    <@form.textarea path="description"/>
  </div>

  <div class="field">
    <label for="title">Keywords</label>
    <@form.textarea path="keywords"/>
  </div>

  <div class="field submit-field">
    <input type="submit" name="save" value="Save"/>
    <input type="submit" name="cancel" value="Cancel" class="done"/>
    <@form.hidden path="id"/>
  </div>
</@form.form>
</body>
</html>
