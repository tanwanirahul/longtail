    <fieldset class="yui3-u styles-section quick-styles">
      <div class="yui3-u-1 legend">Quick Styles</div>
      <div class="yui3-dropdown yui3-u-1-4" data-type="quickstyles" title="Set of Saved Styles" style="width: 35px; height: 35px;"></div>
    </fieldset>

    <fieldset class="yui3-u styles-section background-styles">
      <div class="yui3-u-1 legend">Background</div>
      <div class="yui3-dropdown" data-type="BackgroundColor" title="Change Background Color" style="vertical-align: top;"></div>
      <div class="yui3-dropdown" data-type="Background" title="Change Background Image/Gradient/Texture" style="width: 35px; height: 35px;"></div>
    </fieldset>

    <fieldset class="yui3-u styles-section border-styles">
      <div class="yui3-u-1 legend">Border</div>
      <div class="yui3-dropdown" data-type="Border" title="Change Border Style" style="width: 35px; height: 35px;"></div>
    </fieldset>

    <fieldset class="yui3-u styles-section advanced-effects">
      <div class="yui3-u-1 legend">Effect</div>
      <div class="yui3-dropdown" data-type="Effects" title="Advanced Effects" style="width: 35px;height: 35px;"></div>
    </fieldset>

    <fieldset class="yui3-u styles-section text-styles">
      <div class="legend">Text Style</div>
      <div class="yui3-dropdown" data-type="FontColor" title="Change Text Color" style="vertical-align: top;"></div>
      <div class="yui3-u-1-2 yui3-dropdown" data-type="Font" title="Select Text Styles Presets" style="width: 35px; height: 35px;"></div>
    </fieldset>

    <fieldset class="yui3-u styles-section image-properties">
      <div class="yui3-u-1 legend">Image Properties</div>
      <div class="yui3-u-1" style="text-align: center;">
        <div class="yui3-u-1-2 yui3-dropdown" data-type="content-image" title="Change the current Image" style="width: 35px;height: 35px;"></div>
        <a class="upload-image" style="vertical-align: bottom" onclick="Y.longtail.Designer.createPreset('content-image','General', true, this)">+ UPLOAD</a>
      </div>
    </fieldset>

    <fieldset class="yui3-u styles-section size-spacing-styles">
      <div class="yui3-u-1 legend" style="margin-bottom: 15px;">Spacing</div>
      <div class="yui3-u-11-24" style="margin-left: 10px;">
        <label class="css-style-form-label">Padding:</label>
        <div class="yui3-dropdown" data-type="padding" style="width: auto;">
          <input name="padding" class="yui3-spinner" value="0" title="Change Spacing of Content of selected element from its edges/border">
          <div class="yui3-dropdown-content yui3-g">
          	<div class="yui3-u-1" style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Top&nbsp;</label>
		      <input class="yui3-spinner" name="paddingTop" type="text">
		    </div>
		    <div class="yui3-u-1-2"  style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Left&nbsp;</label>
		      <input class="yui3-spinner" name="paddingLeft" type="text">
		    </div>
		    <div class="yui3-u-1-2"  style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Right&nbsp;</label>
		      <input class=" yui3-spinner" name="paddingRight" type="text">
		    </div>
		    <div class="yui3-u-1"  style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Bottom&nbsp;</label>
		      <input class="yui3-spinner" name="paddingBottom" type="text">
		    </div>
		    <button style="position: absolute;bottom: 0; right:0; letter-spacing:normal;" class="done" onclick="Y.LUI.closeAll('itembrowseroverlay');">Close</button>
          </div>
        </div>
      </div><div class="yui3-u-11-24" style="margin-left: 5px;">
        <label class="css-style-form-label">Margin:</label>
        <div class="yui3-dropdown" data-type="margin" style="width: auto;">
          <input name="margin" class="yui3-spinner" value="0" title="Change Margin of Content of selected element from its edges/border">
          <div class="yui3-dropdown-content yui3-g">
          	<div class="yui3-u-1" style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Top&nbsp;</label>
		      <input class="yui3-spinner" name="marginTop" type="text">
		    </div>
		    <div class="yui3-u-1-2"  style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Left&nbsp;</label>
		      <input class="yui3-spinner" name="marginLeft" type="text">
		    </div>
		    <div class="yui3-u-1-2"  style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Right&nbsp;</label>
		      <input class=" yui3-spinner" name="marginRight" type="text">
		    </div>
		    <div class="yui3-u-1"  style="text-align: center; padding: 4px 0;">
		      <label class="css-style-form-label">Bottom&nbsp;</label>
		      <input class="yui3-spinner" name="marginBottom" type="text">
		    </div>
		    <button style="position: absolute;bottom: 0; right:0; letter-spacing:normal;" class="done" >Close</button>
          </div>
        </div>
      </div>
      <div>
		<div class="yui3-dropdown" data-type="advanced" style="width: auto;float: right;">
			<a href="#tab=4">Advanced</a>
			<div class="yui3-dropdown-content" style="position: fixed;left:0;right:0;width:auto;padding:2px;">
				<#include "/list/presetLists/customStyles.ftl"/>
			</div>
		</div>      
      </div>
    </fieldset>
