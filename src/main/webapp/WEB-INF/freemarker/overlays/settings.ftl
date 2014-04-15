<#if req.widgetSettings?has_content>
    <#assign w=req.widgetSettings>
         
        <h3 class="title">${w.widget.name?capitalize} Settings</h3>
             
        <#if (w.widget.modes)?has_content>
        <div class="field">
            <form id="mode${req.params.w}" action="${req.servicesBase}/page/mode" method="POST" class="ajax-form">
                <input type="hidden" name="widgetId" value="${req.params.w}">
                <label for="value">Mode</label>
                <select name="mode" onchange="Y.longtail.MultiOverlay.onSubmit({currentTarget: Y.one('#mode${req.params.w}'), halt : function(){}})">
                    <option>Select Mode</option>
                    <#list w.widget.modes as m>
                        <#assign selOption = "" />
                        <#if (w.mode)?? && w.mode == m.name || (w.mode)?? && m_index == 0>
                            <#assign selOption = "selected" />
                        </#if>
                        <option ${selOption}>${m.name}</option>
                    </#list>
                </select>
            </form>
        </div>
        </#if>
            
        <form action="${req.servicesBase}/data/bulkupdate" method="POST" class="ajax-form widget-settings-form">    
            <table style="width:100%">
            <#list w.settings?keys as key>
                <#if key?has_content>
                    <tr class="field">
                        <td style="padding: 3px"><label for="value">${key?capitalize}</label></td>
                        <td style="padding: 3px">
                        <#assign fieldValue>${w.settings[key]!t.text("widgets."+key,{"text":true})}</#assign>
                        <#if fieldValue == "Click to Edit">
                            <#assign placeHolder>Click to Edit</#assign>
                            <#assign fieldValue = ""/>
                        </#if>
                        
                        <textarea name="data.widgets.${req.params.w}.${key}" rows="1" cols="15">${fieldValue!}</textarea>
                        </td>
                    </tr>
                </#if>
            </#list>
                <tr><td colspan="2" style="text-align: right">
                    <#if req.loggedInUserName == "admin@hashedin.com">
                        <a href="${req.navBase}/overlays/cssForm" class="next-step" onclick="return false" target="_blank">CSS Settings</a>
                    </#if>
                    <input type="submit" value="Apply">
                </td></tr>
            </table>
         </form>
<#else>
    <#include "../admin/settings.ftl"/>
</#if>