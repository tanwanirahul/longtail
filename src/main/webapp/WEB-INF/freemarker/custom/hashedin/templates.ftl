<script>
	onDomReady(function()
			{
				Y.delegate("click", function(e){
						var templateName = e.currentTarget.get("title");
						Y.one("#template").set("value", templateName);
						document.forms['siteCreation'].submit();
				}, "#themeSelecterWidget", ".theme");
			}
		);	
</script>
<form id="siteCreation" name="siteCreation" action="${req.servicesBase}/site/create" method="POST">
	<input id="template" name="template" type="hidden"/>
</form>
<div class="t-section">
	<div class="title"><span style="color: #333; display: inline-block; zoom: 1; *display: inline; margin-bottom: 20px;">Select a Template : </span></div>
	
	<div class="widget" id="themeSelecterWidget">
		<div id="themeSelecterContainer">
			<#assign templates=t.fetch("templates", "")/>
			<#include "/list/templates.ftl"/>
		</div>
	</div>
</div>
