<div id="themeSelecter" class="yui3-g">
	<#if templates??>
		<#list templates as t>
		<div class="yui3-u-1-4">
			<div title="${t.templateName}" class="theme">
				<div class="preview">
					<img src="${t.previewImage!"${req.staticBase}/img/template-preview.png"}"/>
				</div>
				<div class="title"><span style="font-weight: bold;">${t.templateName}</span> <br/>in ${t.industry}</div>
			</div>
		</div>	
		</#list>
	</#if>
</div>