<form class="text-style-form css-accordian-form" onsubmit="return false">
    <fieldset class="expanded">
        <div class="legend"><span class="right-icon">&#x25B6;</span><span class="down-icon">&#x25BC;</span>Text Styling</div>
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
                <input type="checkbox" name="fontStyle" value="italic" onclick="Y.fire('custom:css', {node: this, css: {fontStyle : 'italic'}})"/>
                <label style="font-style:italic;vertical-align: top;">Italic</label>
            </div>
            <div class="yui3-u-1-3" >
                <label>Background</label><br/>
                <input type="text" name="color" />
                <div class="extension colorPane preset-selections">
                    <div class="color-choices yui3-g">
                        <#include "/components/backgroundColor"/>
                        <div class="canvas-style-section yui3-u-3-5" style="margin-left: 5px;">
                            <label for="backgroundColorHex">Hex Code</label>
                            <input name="backgroundColorHex" type="text" class="extended-field color-input" />
                        </div>
                    </div>
                </div>
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
                <label>Text Align</label><br/>
                <select  name="textAlign">
                    <option value="left">Left</option>
                    <option value="center">Center</option>
                    <option value="right">Right</option>
                    <option value="justify">Justify</option>
                </select>
            </div>
            <div class="yui3-u-1-2">
                <label>Text Case</label>
                <select name="textTransform">
                    <option value="none">None</option>
                <option value="capitalize">Capitalize</option>
                <option value="uppercase">Upper Case</option>
                    <option value="lowercase">Lower Case</option>
                </select>
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-2">
                <label>Line Height</label>
                <input type="text" name="lineHeight" class="yui3-spinner" min="0" max="5" minorStep="0.1" majorStep="0.5">
            </div>
            <div class="yui3-u-1-2">
                <label>Letter Spacing</label>
                <input type="text" name="letterSpacing" class="yui3-spinner" min="-20" max="50" minorStep="1" majorStep="2">
            </div>
        </div>
        <div class="field yui3-g">
            <div class="yui3-u-1-3">
                <button class="insert-image" title="Insert image" onclick="Y.longtail.EditorManager.insertSampleImage('insertimage', false, '/static/img/no_img.jpg')"">
                    <span class="toolbar-icon"></span>
                </button>
            </div>
            <div class="yui3-u-2-3" style="text-align: right;padding-top: 15px">
                <a href="javascript:Y.longtail.EditorManager.showAdvanceEditor()" class="action-link">More</a>
                <button class="done admin-button form-submit-button" value="Done">Done</button>
            </div>
        </div>
    </fieldset>
</form>