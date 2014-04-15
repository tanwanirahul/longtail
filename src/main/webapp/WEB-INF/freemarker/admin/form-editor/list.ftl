<html>
<head></head>
<body>
<ul>
<#list forms as form>
	<li><a href="edit?name=${form.name}">${form.name}</a></li>
</#list>
	<li><form action="edit"><input name="name" value=""/> <input type="submit" value="+ Add Form"/></form></li>
</ul>
</body>
</html>
