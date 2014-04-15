<!DOCTYPE html>
<head>
    <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/reset-min.css"/>
	<style>
	   html {
	     background: url("${req.staticBase}/img/underconstruction.jpg") #000 no-repeat center top;
	   }
	   
	   p { padding: 5px 0;}
	   
	   .message-area {
	     font-family: "Calibri"; 
	     font-size: 16px; 
	     color: #77a; 
	     top: 120px; 
	     margin: 0 auto;
	     width: 495px;
	     position: relative;
	     display: block;
	   }
	</style>

</head>
<body>

	<div class="message-area" >
		<p>This site is actively being developed.</p>
		
		<p style="margin-top: 30px;color: #fff;font-size: 18pt;">This site is being designed at <a style="color: #fff; text-decoration: none;" href="http://${req.siteDomain}">DesignOnCloud</a></p>
		<p>You can design your own site right from the browser at <a href="http://${req.siteDomain}" >DesignOnCloud.com/a></p>
		
		<div style="margin-top: 131px;float: right;">
			<span style="position: relative;top: -5px;left: -10px;color: #aaa;">Powered By</span><a href="http://${req.siteDomain}" style="text-decoration: none;border: none;"><img style="border: none;height: 30px;" src="${req.staticBase}/img/logo_engraved.png"/></a>
		</div>
		
		<div style="margin-top: 140px;float: left;">
			<a style="color: #ccc;text-decoration: none;" href="${req.siteUrl}/lt_admin/dashboard">Login as Admin</a> | 
			<a style="color: #ccc;text-decoration: none;" href="?view_alpha=1">Preview</a>
		</div>
	</div>

</body>
</html>