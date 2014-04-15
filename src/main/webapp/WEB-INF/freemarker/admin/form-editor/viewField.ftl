<html>
<head>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
    <style>
      html {background: transparent; color: #fff; min-width: 0;}
      body {background: transparent;}
      a, a:visited {color: #E4E4E4; font-size: 11px;}
      label {font-weight: bold; height: 20px; margin-bottom: 5px;}
      select, input {display: block; max-width: 90%; margin: 0 0 5px;}
      input[type=checkbox] {margin: 3px 0 8px;}
      .form-editor {width: 90%; font: 12px Arial; margin: 0 auto;}
      .form-field {margin: 10px 0;}
      .heading-3 {display: inline-block; font-size: 14px; font-weight: bold; line-height: 2.0; width: 80%;}
      .action-buttons-container {position: fixed; bottom: 0; left: 0; right:0; background: #000; border-top: 1px solid #ccc; padding: 10px 0;}
      .submit-button {font-size: 14px; font-weight: bold; padding: 5px; float: right; margin-right: 15px;}
      .cancel-button {padding: 5px; float: right; margin-right: 15px;}
    </style>
</head>
<body>

<#assign form=JspTaglibs["/WEB-INF/spring-form.tld"]>

<div class="form-editor">
<#assign formAction = "editField" submitLabel = "Update Field" />
<#if (req.params.mode)?? && req.params.mode == "add"><#assign formAction = "addField" submitLabel = "Add Field" /></#if>
<@form.form modelAttribute="fieldObj" action="${formAction}">
    <input type="hidden" name="formUuid" value="${formObj.uuid}" />
    <#if !(req.params.mode)?? || req.params.mode != "add"><@form.hidden path="uuid" /></#if>
    <fieldset style="padding-bottom: 50px;">
        <h3 class="heading-3">New Field</h3>
        <div class="yui3-g">
            <label class="yui3-u-1-4">Field Name</label>
            <div class="yui3-u-3-4" style="margin-bottom: 3px;"><@form.input path="fieldName" /></div>
            <label class="yui3-u-1-4" style="font-size: 12px;">Display Name</label>
            <div class="yui3-u-3-4"><@form.input path="label"/></div>
            <label class="yui3-u-1-4" style="font-size: 12px;">Type</label>
            <div class="yui3-u-3-4"><@form.select path="fieldType" items=fieldTypes/></div>
            <label class="yui3-u-1-4" style="font-size: 12px;">Mandatory</label>
            <div class="yui3-u-3-4"><@form.checkbox path="required"/></div>
            <label class="yui3-u-1-4">Help Text</label>
            <div class="yui3-u-3-4"><@form.input path="helpText" /></div>
            <label class="yui3-u-1-4">Placeholder</label>
            <div class="yui3-u-3-4" style="margin-bottom: 3px;"><@form.input path="placeHolder" /></div>
        </div>
    </fieldset>

    <div class="action-buttons-container">
        <a class="cancel-button" href="${req.servicesBase}/admin/forms/edit?formUuid=${formObj.uuid}">Cancel</a>
        <input type="submit" class="submit-button" value="${submitLabel}" />
    </div>

</@form.form>
</div>

</body>
</html>
