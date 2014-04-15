<!DOCTYPE html>
<html>
<head>
    <title>Updating Page</title>
	<style>
	   body {
	     color: #fff;
	   }
	</style>
	<script>
		var refresh_widget = '#${formObj.uuid!}';
	</script>
</head>
<body id="iframeBody">
	The form was updated Successfully. <a href="edit?uuid=${formObj.uuid!}">Edit</a> 
	<button class="close">Done</button>
</body>
</html>