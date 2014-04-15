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
		var close_frame = true;
	</script>
</head>
<body id="iframeBody">
	Page ${pageObj.path} was updated Successfully. <a href="edit?path=${pageObj.path}">Edit</a> 
	<button class="close">Done</button>
</body>
</html>