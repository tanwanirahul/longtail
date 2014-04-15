<#if req.params.type == "Effects" || req.params.type == "content-image">
  <#include "presetForms/${req.params.type}.ftl"/>
<#else>
  <#include "presetForms/${req.params.type}${req.params.filters!}.ftl"/>
</#if>
