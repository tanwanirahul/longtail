<html>
<head>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
    <style>
      body {background: transparent;}
      html {min-width: 0;background: transparent;color: #fff;}
      a, a:visited {color: #E4E4E4; font-size: 11px;}
      label {font-weight: bold;}
      select, input {display: block; max-width: 90%; margin: 0;}
      input[type=checkbox] {margin: 0 auto;}
      .form-editor {width: 90%; font: 12px Arial; margin: 0 auto;}
      .form-field {margin: 10px 0;}
      .heading-3 {display: inline-block; font-size: 14px; font-weight: bold; line-height: 2.0; width: 80%;}
      .more-block {background-color: #111; border: 1px solid #222; display: none; margin: 2px 2px 2px 8.29%; padding: 5px 15px;}
      .action-buttons-container {position: fixed; bottom: 0; left: 0; right:0; background: #000; border-top: 1px solid #ccc; padding: 10px 0;}
      .submit-button {font-size: 14px; font-weight: bold; padding: 5px; float: right; margin-right: 15px;}
    </style>
    <script type="text/javascript" src="${req.staticBase}/js/yui/3.3.0/build/yui/yui-min.js"></script>
    <script type="text/javascript">
        function toggleDisplay(fieldNum)
        {
            YUI().use("node", function(Y){
                var moreLink = Y.one("#moreLink" + fieldNum);
                var moreNode = Y.one("#moreBlock" + fieldNum);
                if (moreNode.getStyle("display") == "block")
                {
                    moreNode.setStyle("display", "none");
                    moreLink.set("innerHTML", "More");
                } else
                {
                    moreNode.setStyle("display", "block");
                    moreLink.set("innerHTML", "Less");
                }
            });
        }

        function moveUp(fieldNum)
        {
            YUI().use("node", function(Y){
                var node = Y.one("#field" + fieldNum);
                var prev = node.previous();
                var parent = node.get("parentNode");
                var elementsOrder = Y.one("#elementsOrder").get("value").split(" ");

                if(!prev.hasClass("boundary")){
                    prev.insert(node, "before");
                    var nodeUuid = elementsOrder.splice(fieldNum, 1);
                    elementsOrder.splice(fieldNum - 1, 0, nodeUuid[0]);
                    Y.one("#elementsOrder").set("value", elementsOrder.join(" "));

                    /*
                    var nList = node.all("input,select,textarea");
                    prev.all("input,select,textarea").each(function(e, i){
                        var name = e.get("name");
                        var otherName = nList.item(i).get("name");
                        e.set("name", otherName);
                        nList.item(i).set("name", name);
                    });
                    */
                }
            });
        }

        function moveDown(fieldNum)
        {
            YUI().use("node", function(Y){
                var node = Y.one("#field" + fieldNum);
                var next = node.next();
                var parent = node.get("parentNode");
                var elementsOrder = Y.one("#elementsOrder").get("value").split(" ");

                if(!next.hasClass("boundary")){
                    next.insert(node, "after");
                    var nodeUuid = elementsOrder.splice(fieldNum, 1);
                    elementsOrder.splice(fieldNum + 1, 0, nodeUuid[0]);
                    Y.one("#elementsOrder").set("value", elementsOrder.join(" "));

                    /*
                    var nList = node.all("input,select,textarea");
                    next.all("input,select,textarea").each(function(e, i){
                        var name = e.get("name");
                        var otherName = nList.item(i).get("name");
                        e.set("name", otherName);
                        nList.item(i).set("name", name);
                    });
                    */
                }
            });
        }
    </script>
</head>
<body>

<#assign form=JspTaglibs["/WEB-INF/spring-form.tld"]>

<div class="form-editor">
<@form.form modelAttribute="formObj" action="save?formUuid=${formObj.uuid}">
    <fieldset>
        <div class="form-field yui3-g">
            <label for="action" class="yui3-u-1-4">Submit URL</label>
            <@form.hidden path="uuid"/>
            <@form.input path="action" class="yui3-u-3-4"/>
        </div>

        <div class="form-field yui3-g">
            <label for="thankYou" class="yui3-u-1-4">Thank You Message</label>
            <@form.textarea path="thankYou" class="yui3-u-3-4"/>
        </div>

        <div class="form-field yui3-g">
            <label for="emailSubject" class="yui3-u-1-4">Email Subject</label>
            <@form.input path="emailSubject" class="yui3-u-3-4"/>
        </div>

        <div class="form-field yui3-g">
            <label for="emailTemplate" class="yui3-u-1-4">Email Text</label>
            <@form.textarea path="emailTemplate" class="yui3-u-3-4"/>
        </div>
    </fieldset>

    <fieldset style="padding-bottom: 50px;">
        <h3 class="heading-3">Field Settings</h3>
        <a href="${req.servicesBase}/admin/forms/viewField?formUuid=${formObj.uuid}&mode=add">Add Field</a>
        <div class="form-field yui3-g" style="font-weight: bold;font-size: 14px;">
            <div class="yui3-u-1-12"></div>
            <div class="yui3-u-1-4" style="font-size: 12px;">Label</div>
            <div class="yui3-u-1-4" style="font-size: 12px;">Type</div>
            <div class="yui3-u-1-8" style="font-size: 12px;">Mandatory</div>
        </div>
        <#assign elementsOrder = "" />
        <#list formObj.elements as f>
            <#assign elementsOrder = elementsOrder + " " + f.uuid />
            <div id="field${f_index}" class="form-field yui3-g">
                <div class="yui3-u-1-12">${f_index + 1}</div>
                <@form.hidden path="elements[" + f_index + "]" />
                <div class="yui3-u-1-4"><@form.input path="elements[" + f_index + "].label"/></div>
                <div class="yui3-u-1-4"><@form.select path="elements[" + f_index + "].fieldType" items=fieldTypes/></div>
                <div class="yui3-u-1-8"><@form.checkbox path="elements[" + f_index + "].required"/></div>
                <div class="yui3-u-7-24" style="text-align: right;">
                    <a id="moreLink${f_index}" href="${req.servicesBase}/admin/forms/viewField?formUuid=${formObj.uuid}&uuid=${f.uuid}&mode=edit" style="margin-right: 10px;">More</a>
                    <a style="margin-left: 10px;" href="${req.servicesBase}/admin/forms/removeField?formUuid=${formObj.uuid}&uuid=${f.uuid}">Remove</a>
                </div>
            </div>
        </#list>
    </fieldset>

    <div class="action-buttons-container">
        <input type="submit" class="submit-button" value="Save / Update"/>
    </div>

</@form.form>
</div>

</body>
</html>
