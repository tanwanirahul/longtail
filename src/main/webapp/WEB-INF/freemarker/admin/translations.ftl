<#assign selectedLang>${(req.params.selectedLang)!"fr"}</#assign>
<style>
  .translation-edit-element {overflow: hidden;}
</style>
<#macro fields langs=[]>
	<div class="yui3-g">
		<#list langs as lang>
			<h2 class="yui3-u-1-${langs?size} translation-edit-element">Language (${lang})</h2>
		</#list>
	</div>
	<hr/>
	<#list req.settings.globalSettings?keys as key>
		<#if key?has_content>
			<div class="yui3-g">
			<#list langs as lang>
				<div class="yui3-u-1-${langs?size} translation-edit-element">${t.global(key,{"lang": lang})}</div>
			</#list>
			</div>
			<hr/>	
		</#if>
	</#list>
	<#list req.settings.pageSettings as pageSettings>
		<#list pageSettings.widgetSettings as widgetSettings>
			<#if widgetSettings.widget.name != "layout">
				<#assign widgetId = widgetSettings.widgetId/>
				<#list widgetSettings.settings?keys as key>
				<#if key?has_content>
					<div class="yui3-g">
						<#list langs as lang>
							<div class="yui3-u-1-${langs?size} translation-edit-element">${t.text(key,{"id": widgetId, "lang": lang})}</div>
						</#list>
					</div>
					<hr/>
				</#if>
				</#list>
			</#if>	
		</#list>
	</#list>
	</table>
</#macro>
<@w.widget name="translationsWidget"> 
<h2>Translations &amp; Site Languages 		
		<form id="changeLanguage">
			<span>Selected Alternative Language</span> 
			<select name="selectedLang">
				<option value="fr" <#if selectedLang == "fr">selected</#if>>French</option>
				<option value="es" <#if selectedLang == "es">selected</#if>>Spanish</option>
				<option value="pt" <#if selectedLang == "pt">selected</#if>>Portugese</option>
				<option value="sw" <#if selectedLang == "sw">selected</#if>>Swedish</option>
			</select>
			<input type="submit" class="admin" value="Change"/>
		</form></h2>
<hr/>
<div class="languages-pane">
	<@fields langs=["en",selectedLang]/>
</div>
</@w.widget>