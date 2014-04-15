<form class="nav-style-form css-accordian-form" action="" onsubmit="return false">
    <fieldset class="expanded">
        <div class="legend"><span class="right-icon">&#x25B6;</span><span class="down-icon">&#x25BC;</span><span>Navigation</span></div>
        <div class="field yui3-g">
            <label class="yui3-u-1 css-form-fieldset-label">Background</label>
            <div class="yui3-u-1">
                <label for="backgroundColor">Solid Color &nbsp;</label>
                <input name="backgroundColor" type="text" class="extended-field color-input"/>
                <div class="extension backgroundColorPane">
                    <div class="color-choices preset-selections yui3-g">
                        <#include "/components/backgroundColor"/>
                    </div>
                    <div>
                        <label for="backgroundColorOpacity">Opacity</label>
                        <input type="text" min="0.1" max="1.0" minorStep="0.1" majorStep="0.1" name="backgroundColorOpacity" class="yui3-spinner"/>
                    </div>
                    <div>
                        <label for="backgroundColor">Hex Code</label>
                        <input name="backgroundColorHex" type="text" class="extended-field color-input" style="font-family: monospace; width: 50px;"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>None</label>
                <div class="gradient-swatch yui3-u" style="background-image: none;border: 1px dotted #fff;" onclick="Y.fire('custom:css', {node: this, css: {backgroundImage : 'none'}})"></div>
            </div>

            <div class="yui3-u-1-4" style="text-align: center;">
                <label>Gradient</label>
                <input name="backgroundGradient" type="text" class="extended-field"/>
                <div class="extension backgroundGradientPane">
                    <div class="gradient-choices preset-selections yui3-g">
                        <#include "/components/gradients"/>
                    </div>
                </div>
            </div>
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>Texture</label>
                <input name="backgroundTexture" type="text" class="extended-field"/>
                <div id="_nav_form_texturePane" class="extension backgroundTexturePane">
                    <div class="yui3-g preset-selections texture-choices">
                        <#include "/components/textures"/>
                    </div>
                    <div style="text-align: right;"
                         onclick="Y.longtail.EditorManager.browseImages({zIndex: 100,href : PageData.servicesBase + '/image/browse?c=TEXTURE',onSelect: function(e){Y.fire('custom:css', {node: '#_nav_form_texturePane', css: {backgroundImage : 'url(\'' + e.src + '\')',backgroundRepeat: 'repeat'}});}});"><a href="more" onclick="return false">more...</a></div>
                </div>
            </div>
            <div id="_nav_form_bgimage" class="yui3-u-1-4" style="text-align: center;">
                <label>Image</label><br/>
                <input name="backgroundImage" type="text" class="extended-field"/>
                <div class="extension backgroundImagePane">
                    <div class="yui3-g preset-selections">
                    <#include "/components/images"/>
                    </div>
                    <div class="yui3-g">
                        <label class="yui3-u-1-3" for="backgroundPosition">Position</label>
                        <div class="yui3-u-2-3">
                            <input type="radio" name="backgroundPosition" value="left top"/>
                            <input type="radio" name="backgroundPosition" value="center top"/>
                            <input type="radio" name="backgroundPosition" value="right top"/><br/>
                            <input type="radio" name="backgroundPosition" value="left center"/>
                            <input type="radio" name="backgroundPosition" value="center center"/>
                            <input type="radio" name="backgroundPosition" value="right center"/><br/>
                            <input type="radio" name="backgroundPosition" value="left bottom"/>
                            <input type="radio" name="backgroundPosition" value="center bottom"/>
                            <input type="radio" name="backgroundPosition" value="right bottom"/>
                        </div>
                    </div>
                    <div style="text-align: right;"
                         onclick="Y.longtail.ImageEditor.browseImageCallback({zIndex: 100,href : PageData.servicesBase + '/image/browse?c=BACKGROUND',onSelect: function(e){Y.fire('custom:css', {node: '#_nav_form_bgimage', css: {backgroundImage : 'url(\'' + e.src + '\')',backgroundRepeat: 'no-repeat'}});}});"><a href="more" onclick="return false">more...</a></div>
                </div>
            </div>
        </div>

        <div class="field yui3-g">
            <label class="yui3-u-1 css-form-fieldset-label">Border</label>
            <div class="yui3-u-1-3">
                <label>Color</label><br/>
                <input name="borderColor">
            </div>
            <div class="extension borderPane">
                <div class="color-choices preset-selections yui3-g">
                    <#include "/components/borderColor"/>
                </div>
            </div>

            <div class="yui3-u-1-3">
                <label>Width</label><br/>
                <input type="text" name="borderWidth" value="0" class="yui3-spinner"/>
            </div>

            <div class="extension borderWidthPane">
                <table style="width: 100%;">
                    <tr><td>Left<br/><input type="text" name="borderLeftWidth" value="0" class="yui3-spinner"/></td><td>Right<br/><input type="text" name="borderRightWidth" value="0" class="yui3-spinner"/></td></tr>
                    <tr><td>Top<br/><input type="text" name="borderTopWidth" value="0" class="yui3-spinner"/></td><td>Bottom<br/><input type="text" name="borderBottomWidth" value="0" class="yui3-spinner"/></td></tr>
                </table>
            </div>

            <div class="yui3-u-1-3">
                <label>Style</label><br/>
                <input type="text" name="borderStyle" value=""/>
            </div>

            <div class="extension borderStylePane">
                <div class="border-style-choices yui3-g">
                    <div class="border-swatch yui3-u-1-2"
                         onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'solid'}})">
                        <div style="border-top: 3px #000 solid"></div>
                    </div>
                    <div class="border-swatch yui3-u-1-2"
                        onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'double'}})">
                        <div style="border-top: 3px #000 double"></div>
                    </div>
                    <div class="border-swatch yui3-u-1-2"
                        onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'dashed'}})">
                        <div style="border-top: 3px #000 dashed;"></div>
                    </div>
                    <div class="border-swatch yui3-u-1-2"
                        onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'dotted'}})">
                        <div style="border-top: 3px #000 dotted"></div>
                    </div>
                    <div class="border-swatch yui3-u-1-2"
                        onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'ridge'}})">
                        <div style="border-top: 3px #000 ridge"></div>
                    </div>
                    <div class="border-swatch yui3-u-1-2"
                        onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'inset'}})">
                        <div style="border-top: 3px #000 inset"></div>
                    </div>
                    <div class="border-swatch yui3-u-1-2"
                        onclick="Y.fire('custom:css', {node: this, css: {borderStyle : 'outset'}})">
                        <div style="border-top: 3px #000 outset"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="field yui3-g">
            <div class="yui3-u-2-3">
                <label>Font</label>
                <@w.selectFontFamily name="fontFamily" style="width: 90%;" />
            </div>
            <div class="yui3-u-1-3">
                <label>Size</label>
                <input type="text" name="fontSize" class="yui3-spinner" min="8" max="216" majorStep="8">
            </div>
        </div>

        <div class="field yui3-g">
        	<div class="yui3-u-1-2">
                <label>Text Align</label><br/>
                <select  name="textAlign">
                    <option value="left">Left</option>
                    <option value="center">Center</option>
                    <option value="right">Right</option>
                </select>
            </div>
        
            <div class="yui3-u-1-2">
                <label>Rounded Corner</label>
                <input name="MozBorderRadius" class="yui3-spinner">
                <div class="extension MozBorderRadiusPane">
                    <table style="width: 100%;">
                        <tr><td>Top Left<br/><input type="text" name="MozBorderRadiusTopleft" value="0" class="yui3-spinner"/></td><td>Top Right<br/><input type="text" name="MozBorderRadiusTopright" value="0" class="yui3-spinner"/></td></tr>
                        <tr><td>Bottom Left<br/><input type="text" name="MozBorderRadiusBottomleft" value="0" class="yui3-spinner"/></td><td>Bottom Right<br/><input type="text" name="MozBorderRadiusBottomright" value="0" class="yui3-spinner"/></td></tr>
                    </table>
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset data-selector=".link">
        <div class="legend"><span class="right-icon">&#x25B6;</span><span class="down-icon">&#x25BC;</span><span>Link Styles - Normal Mode</span></div>
        <div class="field yui3-g">
            <div class="yui3-u-1">
                <label for="backgroundColor">Solid Color &nbsp;</label>
                <input name="backgroundColor" type="text" class="extended-field color-input"/>
                <div class="extension backgroundColorPane">
                    <div class="color-choices preset-selections yui3-g">
                        <#assign subSelect=".link"/>
                        <#include "/components/backgroundColor"/>
                    </div>
                    <div>
                        <label for="backgroundColorOpacity">Opacity</label>
                        <input type="text" min="0.1" max="1.0" minorStep="0.1" majorStep="0.1" name="backgroundColorOpacity" class="yui3-spinner"/>
                    </div>
                    <div>
                        <label for="backgroundColor">Hex Code</label>
                        <input name="backgroundColorHex" type="text" class="extended-field color-input" style="font-family: monospace; width: 50px;"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>None</label>
                <div class="gradient-swatch yui3-u" style="background-image: none;border: 1px dotted #fff;" onclick="Y.fire('custom:css', {node: this, css: {backgroundImage : 'none'}})"></div>
            </div>
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>Gradient</label>
                <input name="backgroundGradient" type="text" class="extended-field"/>
                <div class="extension backgroundGradientPane">
                    <div class="gradient-choices preset-selections yui3-g">
                        <#include "/components/gradients"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-2-3">
                <label>Font</label>
                <@w.selectFontFamily name="fontFamily" style="width: 90%;" />
            </div>
            <div class="yui3-u-1-3">
                <label>Size</label>
                <input type="text" name="fontSize" class="yui3-spinner" min="8" max="216" majorStep="8">
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-3" style="margin-top: 0.5em;">
                <input type="checkbox" name="fontWeight" value="bold" onclick="Y.fire('custom:css', {node: this, css: {fontWeight : 'bold'}})"/>
                <label style="font-weight:bolder;vertical-align: top;">Bold</label><br/>
            </div>
            <div class="yui3-u-1-3" style="margin-top: 0.5em;">
                <input type="checkbox" name="fontStyle" value="italic" onclick="Y.fire('custom:css', {node: this, css: {fontStyle : 'italic'}})"/>
                <label style="font-style:italic;vertical-align: top;">Italic</label>
            </div>
            <div class="yui3-u-1-3">
                <label style="margin-left: 4px;">Color</label><br/>
                <input type="text" name="color" />
                <div class="extension colorPane preset-selections">
                    <div class="color-choices yui3-g">
                        <#include "/components/textColor"/>
                        <div class="canvas-style-section yui3-u-3-5" style="margin-left: 5px;">
                            <label for="color">Hex Code</label>
                            <input name="colorHex" type="text" class="extended-field color-input" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
                <div class="yui3-u-1-2">
                    <label style="width: 30px;">Padding</label>
                    <input name="padding" type="text" class="yui3-spinner"/>
                    <div class="extension paddingPane">
                        <table style="width: 100%;">
                            <tr><td>Left<br/><input type="text" name="paddingLeft" value="0" class="yui3-spinner"/></td><td>Right<br/><input type="text" name="paddingRight" value="0" class="yui3-spinner"/></td></tr>
                            <tr><td>Top<br/><input type="text" name="paddingTop" value="0" class="yui3-spinner"/></td><td>Bottom<br/><input type="text" name="paddingBottom" value="0" class="yui3-spinner"/></td></tr>
                        </table>
                    </div>
                </div>
        </div>
    </fieldset>
    <fieldset data-selector=".link.selected">
        <div class="legend"><span class="right-icon">&#x25B6;</span><span class="down-icon">&#x25BC;</span><span>Link Styles - Selected Mode</span></div>
        <div class="field yui3-g">
            <label class="yui3-u-1 css-form-fieldset-label">Mouseover Mode</label>
            <div class="yui3-u-1">
                <label for="backgroundColor">Solid Color &nbsp;</label>
                <input name="backgroundColor" type="text" class="extended-field color-input"/>
                <div class="extension backgroundColorPane">
                    <div class="color-choices preset-selections yui3-g">
                        <#assign subSelect=".link.selected"/>
                        <#include "/components/backgroundColor"/>
                    </div>
                    <div>
                        <label for="backgroundColorOpacity">Opacity</label>
                        <input type="text" min="0.1" max="1.0" minorStep="0.1" majorStep="0.1" name="backgroundColorOpacity" class="yui3-spinner"/>
                    </div>
                    <div>
                        <label for="backgroundColor">Hex Code</label>
                        <input name="backgroundColorHex" type="text" class="extended-field color-input" style="font-family: monospace; width: 50px;"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>None</label>
                <div class="gradient-swatch yui3-u" style="background-image: none;border: 1px dotted #fff;" onclick="Y.fire('custom:css', {node: this, selector: '.link.selected', css: {backgroundImage : 'none'}})"></div>
            </div>
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>Gradient</label>
                <input name="backgroundGradient" type="text" class="extended-field"/>
                <div class="extension backgroundGradientPane">
                    <div class="gradient-choices preset-selections yui3-g">
                        <#include "/components/gradients"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-3" style="margin-top: 0.5em;">
                <input type="checkbox" name="fontWeight" value="bold" onclick="Y.fire('custom:css', {node: this, selector: '.link.selected', css: {fontWeight : 'bold'}})"/>
                <label style="font-weight:bolder;vertical-align: top;">Bold</label><br/>
            </div>
            <div class="yui3-u-1-3" style="margin-top: 0.5em;">
                <input type="checkbox" name="fontStyle" value="italic" onclick="Y.fire('custom:css', {node: this, selector: '.link.selected', css: {fontStyle : 'italic'}})"/>
                <label style="font-style:italic;vertical-align: top;">Italic</label>
            </div>
            <div class="yui3-u-1-3">
                <label style="margin-left: 4px;">Color</label><br/>
                <input type="text" name="color" />
                <div class="extension colorPane preset-selections">
                    <div class="color-choices yui3-g">
                        <#include "/components/textColor"/>
                        <div class="canvas-style-section yui3-u-3-5" style="margin-left: 5px;">
                            <label for="color">Hex Code</label>
                            <input name="colorHex" type="text" class="extended-field color-input" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset data-selector=".link:HOVER">
        <div class="legend"><span class="right-icon">&#x25B6;</span><span class="down-icon">&#x25BC;</span><span>Link Styles - Mouseover Mode</span></div>
        <div class="field yui3-g">
            <div class="yui3-u-1">
                <label for="backgroundColor">Solid Color &nbsp;</label>
                <input name="backgroundColor" type="text" class="extended-field color-input"/>
                <div class="extension backgroundColorPane">
                    <div class="color-choices preset-selections yui3-g">
                        <#assign subSelect=".link:HOVER"/>
                        <#include "/components/backgroundColor"/>
                    </div>
                    <div>
                        <label for="backgroundColorOpacity">Opacity</label>
                        <input type="text" min="0.1" max="1.0" minorStep="0.1" majorStep="0.1" name="backgroundColorOpacity" class="yui3-spinner"/>
                    </div>
                    <div>
                        <label for="backgroundColor">Hex Code</label>
                        <input name="backgroundColorHex" type="text" class="extended-field color-input" style="font-family: monospace; width: 50px;"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-4" style="text-align: center;">
                <label>None</label>
                <div class="gradient-swatch yui3-u" style="background-image: none;border: 1px dotted #fff;" onclick="Y.fire('custom:css', {node: this, selector: '.link:HOVER', css: {backgroundImage : 'none'}})"></div>
            </div>

            <div class="yui3-u-1-4" style="text-align: center;">
                <label>Gradient</label>
                <input name="backgroundGradient" type="text" class="extended-field"/>
                <div class="extension backgroundGradientPane">
                    <div class="gradient-choices preset-selections yui3-g">
                        <#include "/components/gradients"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-3" style="margin-top: 0.5em;">
                <input type="checkbox" name="fontWeight" value="bold" onclick="Y.fire('custom:css', {node: this, selector: '.link:HOVER', css: {fontWeight : 'bold'}})"/>
                <label style="font-weight:bolder;vertical-align: top;">Bold</label><br/>
            </div>
            <div class="yui3-u-1-3" style="margin-top: 0.5em;">
                <input type="checkbox" name="fontStyle" value="italic" onclick="Y.fire('custom:css', {node: this, selector: '.link:HOVER', css: {fontStyle : 'italic'}})"/>
                <label style="font-style:italic;vertical-align: top;">Italic</label>
            </div>
            <div class="yui3-u-1-3">
                <label style="margin-left: 4px;">Color</label><br/>
                <input type="text" name="color" />
                <div class="extension colorPane preset-selections">
                    <div class="color-choices yui3-g">
                        <#include "/components/textColor"/>
                        <div class="canvas-style-section yui3-u-3-5" style="margin-left: 5px;">
                            <label for="color">Hex Code</label>
                            <input name="colorHex" type="text" class="extended-field color-input" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
</form>
