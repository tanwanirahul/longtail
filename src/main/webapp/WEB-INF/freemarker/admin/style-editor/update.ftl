<html>
<head>
  <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
  <script type="text/javascript" src="${req.staticBase}/js/yui/3.3.0/build/yui/yui-min.js"></script>
  <style>
    html {background: #000000; color: #e4e4e4; min-width: 700px;}
    h3 {font-size: 1.2em; font-weight: bold; margin-bottom: 5px;}
    label {display: block; font-weight: bold;}
    textarea {font-size: 0.9em; padding: 5px; width: 100%;}
    .container {background: #fff; border: 2px inset #777; color: #000; height: 348px; margin: 0 20px; padding: 10px; width: 90%;}
  </style>
</head>
<body>
<#assign form=JspTaglibs["/WEB-INF/spring-form.tld"]>
<div class="form-editor">
	<@form.form modelAttribute="quickstyle" action="save" style="padding: 10px 30px;">
		<div class="yui3-g">
			<div class="form-field yui3-u-1" style="margin: 15px 0;">
				<label for="name" style="display: inline-block; *display: inline; zoom: 1;">Name</label>
				<@form.input path="name" style="width: 40%;" />
			</div>
			
			<div class="form-field yui3-u-1-2">
				<label for="cssText">CSS</label>
				<@form.textarea path="cssText" rows="24" cols="60" id="cssText" />
			</div>
			
			<div class="yui3-u-1-2" >
        <label for="" style="margin: 0 20px;">Preview</label>
				<div class="container">
					<div class="box-preview CLASS-NAME">
						<h3>Text Heading</h3>
						<p>lorum ipsum dolor imut istsm alms ajsha anhoa.</p>
					</div>
				</div>
			</div>
		</div>

		<div class="yui3-u-1" style="padding: 10px 0 0;">
			<button onclick="Y.syncStyles();return false">Apply</button>
			<input type="submit" class="submit-button" value="Save / Update"/>
		</div>
	</@form.form>
</div>
</body>
</html>
<script>
  var Y = YUI().use("selector", "node", "stylesheet", function(Y){
    Y.syncStyles = function()
    {
      Y.StyleSheet(Y.one("#cssText").get("value"));
    }

    Y.syncStyles();
    Y.one("#cssText").on("change", Y.syncStyles); 
  }); 
</script>
