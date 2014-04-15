<div class="preset-selection-div" class="yui3-g">
  <#if req.params.type="Font">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=${families}&text=AaBb"/>
  </#if>

  <#if req.params.type="padding">
    <div class="yui3-u-1" style="text-align: center;padding: 4px 0;">
      <label>Top&nbsp;</label>
      <input class="yui3-spinner" name="paddingTop" type="text">
    </div>
    <div class="yui3-u-1-2"  style="text-align: center;padding: 4px 0;">
      <label>Left&nbsp;</label>
      <input class="yui3-spinner" name="paddingLeft" type="text">
    </div>
    <div class="yui3-u-1-2"  style="text-align: center;padding: 4px 0;">
      <label>Right&nbsp;</label>
      <input class=" yui3-spinner" name="paddingRight" type="text">
    </div>
    <div class="yui3-u-1"  style="text-align: center;padding: 4px 0;">
      <label>Bottom&nbsp;</label>
      <input class="yui3-spinner" name="paddingBottom" type="text">
    </div>
    <button style="position: absolute;bottom: 0; right:0;" class="done" >Close</button>
  <#elseif req.params.type="margin">
    <div class="yui3-u-1" style="text-align: center;padding: 4px 0;">
      <label>Top&nbsp;</label>
      <input class="yui3-spinner" name="marginTop" type="text">
    </div>
    <div class="yui3-u-1-2"  style="text-align: center;padding: 4px 0;">
      <label>Left&nbsp;</label>
      <input class="yui3-spinner" name="marginLeft" type="text">
    </div>
    <div class="yui3-u-1-2"  style="text-align: center;padding: 4px 0;">
      <label>Right&nbsp;</label>
      <input class=" yui3-spinner" name="marginRight" type="text">
    </div>
    <div class="yui3-u-1"  style="text-align: center;padding: 4px 0;">
      <label>Bottom&nbsp;</label>
      <input class="yui3-spinner" name="marginBottom" type="text">
    </div>
    <button style="position: absolute;bottom: 0; right:0;" class="done" >Close</button>
  <#else>
    <div class="presets-list yui3-u-1">
      <#if req.params.type == "Background">
        <@w.renderPagination page=page targetId="imageBrowseList"
            targetUrl="${req.servicesBase}/styles/browse?type=${req.params.type}"
            filters=["Gradient", "Texture", "Image"] context=["All", "Recently Added"]/>
      <#elseif req.params.type == "Effects">
        <@w.renderPagination page=page targetId="imageBrowseList"
            targetUrl="${req.servicesBase}/styles/browse?type=${req.params.type}"
            filters=["BoxShadow", "TextShadow", "Opacity"] context=["All", "Recently Added"]/>
      <#elseif req.params.type == "BackgroundColor">
        <@w.renderPagination page=page targetId="imageBrowseList"
            targetUrl="${req.servicesBase}/styles/browse?type=${req.params.type}"
            filters=[] context=["All", "Recently Added"]/>
      <#elseif req.params.type == "FontColor">
        <@w.renderPagination page=page targetId="imageBrowseList"
            targetUrl="${req.servicesBase}/styles/browse?type=${req.params.type}"
            filters=[] context=["All", "Recently Added"]/>
      <#elseif req.params.type == "content-image">
        <@w.renderPagination page=page targetId="imageBrowseList"
            targetUrl="${req.servicesBase}/styles/browse?type=${req.params.type}"
            filters=["Icons","Logos","General"] context=["All", "Recently Added"]/>      
      <#else>
        <@w.renderPagination page=page targetId="imageBrowseList"
            targetUrl="${req.servicesBase}/styles/browse?type=${req.params.type}"/>
      </#if>
      <div class="preset-swatches yui3-g">
        <#list page.results as p>
          <div class="swatch-container yui3-u yui3-u-1-${page.pageSize!10}">
            <#if req.params.type="content-image">
              <div class="yui3-dropdown-item ${req.params.type}-Swatch" data-csstext="src:${w.getPath(p.path)}"
                  title="Click to select this Image" onclick="Y.fire('custom:css', {node: this, css: {src : '${w.getPath(p.path)}'}})"/>
                <img src="${w.getPath(p.path, "w100-h70", true)}" />
              </div>
            <#elseif req.params.type="Font">
              <div data-uuid="custom" data-csstext="font-family:${p.family}"
                  class="yui3-dropdown-item Font-Swatch">
                <span class="text-sample" style="font-family:${p.family}">AaBb</span><br/>
                <span>${p.family}</span>
              </div>
            <#elseif p.type == "Effects" && (!(req.params.filters)?? || req.params.filters == "Box-Shadow" || req.params.filters == "Opacity")>
              <#assign clazz = "" />
              <#if !(req.params.filters)??><#assign clazz = "Box-Shadow" /><#else><#assign clazz = req.params.filters /></#if>
              <div class="${p.type}-swatch-container">
                <div data-uuid="${p.uuid}" data-csstext="${p.cssStyles}" style="${p.cssStyles}"
                    class="yui3-dropdown-item ${p.type}-Swatch ${clazz}"></div>
              </div>
            <#elseif p.type=="Background" && req.params.filters?? && req.params.filters == "Image">
              <div data-uuid="${p.uuid}" data-csstext="${p.cssStyles}" style="${p.cssStyles};background-image:none;"
                    class="yui3-dropdown-item ${p.type}-Swatch">
                	<img src="${w.extractImage(p.cssStyles, "w100-h70", true)}" style="width: 100px; height: 70px;"/>
              </div>
            <#else>
              <div data-uuid="${p.uuid}" data-csstext="${p.cssStyles}" style="${p.cssStyles}"
                    class="yui3-dropdown-item ${p.type}-Swatch">
                	<#if p.type == "FontColor" || p.type == "TextShadow">AaBb</#if>
              </div>
            </#if>
          </div>
        </#list>
      </div>
    </div>

    <div class="action-buttons yui3-u">
      <button style="width:95px;margin:10px 0;" onclick="Y.longtail.Designer.createPreset('${req.params.type}','${req.params.filters!}')">+ Create New</button>
      <button style="width:95px;margin-bottom:10px;" <#if (!["Background","Border","Font"]?seq_contains(req.params.type) || ["Color","Gradient"]?seq_contains(req.params.filters))>disabled</#if>
          onclick="Y.one('.preset-customize').addClass('selected')">Customize</button>
      
      <#if req.params.type="Background">
      	<button style="width:95px;margin-bottom:10px;" onclick="Y.fire('css-preset:selected', {node: this, cssId: 'zzzzbg', cssText: 'background-image: none; background-color:transparent;', type: 'Background'});">Clear Background</button>
      <#elseif req.params.type="BackgroundColor">
      	<button style="width:95px;margin-bottom:10px;" onclick="Y.fire('css-preset:selected', {node: this, cssId: 'zzzzbgcol', cssText: 'background-color:transparent;', type: 'BackgroundColor'});">Clear Background</button>
      <#elseif req.params.type="Border">
      	<button style="width:95px;margin-bottom:10px;" onclick="Y.fire('css-preset:selected', {node: this, cssId: 'zzzzbrsty', cssText: 'border-style: none; border: none;', type: 'Border'});">Clear Border</button>
      <#else>
      	<#-- Nothing to do -->
      </#if>
      <button style="padding: 1px 16px;margin-bottom:10px;width:95px" class="done">Close</button>
          
      <#if req.params.type="Background" && (req.params.filters == "Texture" || req.params.filters == "Image")>
        <div class="preset-customize yui3-g" style="text-align: center; padding: 7px;">
          <div class="yui3-u-1-3">
            Attachment &nbsp;&nbsp;<br/>
            Fixed <input name="backgroundAttachment" type="radio" value="fixed"><br/>
            Scroll <input name="backgroundAttachment" type="radio" value="scroll">
          </div>
          <div class="yui3-u-1-3">
            <table style="margin: 0 auto;">
              <tr><td colspan="3">Position</td></tr>
              <tr><td><input type="radio" name="backgroundPosition" value="left top"></td><td><input type="radio" name="backgroundPosition" value="center top"></td><td><input type="radio" name="backgroundPosition" value="right top"></td></tr>
              <tr><td><input type="radio" name="backgroundPosition" value="left center"></td><td><input type="radio" name="backgroundPosition" value="center center"></td><td><input type="radio" name="backgroundPosition" value="right center"></td></tr>
              <tr><td><input type="radio" name="backgroundPosition" value="left bottom"></td><td><input type="radio" name="backgroundPosition" value="center bottom"></td><td><input type="radio" name="backgroundPosition" value="right bottom"></td></tr>
             </table>
           </div>
           <div class="yui3-u-1-3">
             <table style="margin: 0 auto;">
               <tr><td colspan="2">Repeat</td></tr>
               <tr><td><input type="radio" name="backgroundRepeat" value="no-repeat"></td><td><input type="radio" name="backgroundRepeat" value="repeat-x"></td></tr>
               <tr><td><input type="radio" name="backgroundRepeat" value="repeat-y" ></td><td><input type="radio" name="backgroundRepeat" value="repeat"></td></tr>
            </table>
          </div>
          <button class="yui3-u-1" style="float: right;" onclick="Y.one('.preset-customize').removeClass('selected')">Done</button>
        </div>
       <#elseif req.params.type="Font">
            <div class="preset-customize font-customize" style="text-align: right; padding: 7px;">
             <label class="yui3-u-1-2">Line Height</label>
               <input type="text" name="lineHeight" class="yui3-spinner" min="0" max="5" minorStep="0.1" majorStep="0.5">
               <br/>
               <label class="yui3-u-1-2">Letter Spacing</label>
               <input type="text" name="letterSpacing" class="yui3-spinner" min="-20" max="50" minorStep="1" majorStep="2" value="0">
               <br/>
               <button style="float: right;" onclick="Y.one('.preset-customize').removeClass('selected')">Done</button>
             </div>
        <#elseif req.params.type="Border">
          <div class="preset-customize" style="width:500px;text-align: right; padding: 7px;margin-left:10px">
              <div class="yui3-g border-customize" style="position:relative;z-index:0;">
                    <div class="yui3-u-3-5 border-grid" style="margin:4px 0;">
                        <div class="yui3-u-1-4" style="text-align:left;">
                            <input class="yui3-spinner border-radius-element" name="borderTopLeftRadius" type="text">
                        </div><div class="yui3-u-1-2" style="text-align:center;">
                            <input class="yui3-spinner" name="borderTopWidth" type="text">
                        </div><div class="yui3-u-1-4" style="text-align:right;">
                            <input class="yui3-spinner border-radius-element" name="borderTopRightRadius" type="text">
                        </div>

                        <div class="yui3-u-1-4" style="margin:6px 0;text-align:left;">
                            <input class="yui3-spinner" name="borderLeftWidth" type="text">
                        </div><div class="yui3-u-1-2" style="text-align:center;">
                        </div><div class="yui3-u-1-4" style="text-align:right;margin:6px 0;">
                            <input class="yui3-spinner" name="borderRightWidth" type="text">
                        </div>

                        <div class="yui3-u-1-4" style="text-align:left;">
                            <input class="yui3-spinner border-radius-element" name="borderBottomLeftRadius" type="text">
                        </div><div class="yui3-u-1-2" style="text-align:center;">
                            <input class="yui3-spinner" name="borderBottomWidth" type="text">
                        </div><div class="yui3-u-1-4" style="text-align:right;">
                            <input class="yui3-spinner border-radius-element" name="borderBottomRightRadius" type="text">
                        </div>
                    </div><div class="yui3-u-2-5" style="text-align:center;">
                        <div class="yui3-u-4-5">
                            <div class="yui3-u-1" style="margin:5px 0;">
                                <label>Width&nbsp;</label>
                                <input name="borderWidth" class="yui3-spinner" value="0" title="Change Border Width">
                            </div><div class="yui3-u-1" style="margin-bottom:5px;">
                                <label>Radius&nbsp;</label>
                                <input name="borderRadius" class="yui3-spinner" value="0" title="Change Border Radius">
                            </div><div>
                                <label>Color&nbsp;</label>
                                <input type="color" name="borderColor" type="text" style="width:50px;" title="Change Border Color"/>
                            </div>
                        </div><div class="yui3-u-1-5" style="vertical-align:bottom;">
                            <button style="right:20px;bottom:20px;float:right;" onclick="Y.one('.preset-customize').removeClass('selected')">Done</button>
                        </div>
                    </div>
                </div>
          </div>
        </#if>
      </div>
  </#if>
</div>
<div class="close"></div>