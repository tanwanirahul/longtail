Welcome to Ford Inventory Service
<#list data.available.models?keys as k>
	<h3 class="heading-3">${k}</h3><#assign m = data.available.models[k]/> 
	<h4 class="heading-4">${m.segment}</h4>
	<p><img src="http://assets.forddirect.fordvehicles.com/assets/${m.smallImage.url}" width="${m.smallImage.width}" height="${m.smallImage.height}"/></p>
</#list>
