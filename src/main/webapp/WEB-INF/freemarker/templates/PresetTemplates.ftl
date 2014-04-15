<#if type="Background" && filters="Gradient">.linear-gradient-with-fallback(${color1}, ${color2}); </#if>
<#if type="Background" && filters="Image">background-image: url('${img_url}'); background-repeat: no-repeat; background-position: center top;</#if>
<#if type="Background" && filters="Texture">background-image: url('${img_url}'); background-repeat: repeat;</#if>
<#if type="BackgroundColor">background-color: ${color}; </#if>
<#if type="FontColor">color: ${color}; </#if>
<#if type="BorderColor">border-color: ${color}; </#if>