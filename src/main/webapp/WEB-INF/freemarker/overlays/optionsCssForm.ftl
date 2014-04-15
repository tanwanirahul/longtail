<form id="cssForm" class="ajax-form css-style-form">
<div class="tabs">
    <ul>
        <li><a href="#backgroundStyles">Background</a></li>
        <li><a href="#borderStyles">Borders</a></li>
        <li><a href="#elementSpacing">Spacing</a></li>
        <li><a href="#textStyles">Text Styling</a></li>
        <li><a href="#cssEffects">Advanced Effects</a></li>
    </ul>
    <div>
    <fieldset id="backgroundStyles" class="yui3-g">
        <div class="options yui3-u">
            <h3>Colors</h3>
            <div class="bg-options"></div>
            <h3>Gradients</h3>
            <div class="gradient-options"></div>
            <h3>Textures</h3>
            <div class="bgImage-options"></div>
        </div>
        <div class="configuration yui3-u">
            <input type="color" id="obgcolor" name="backgroundColor"/>
            <input type="button" onclick="increment('obgcolor', 0.1)" value="+">
            <input type="button" onclick="increment('obgcolor', -0.1)" value="-">
        </div>
    </fieldset>
    <fieldset id="borderStyles" class="yui3-g">
        <div class="options yui3-u">
            <div class="border-options">
            </div>
        </div>
        <div class="configuration yui3-u">
            <input id="oborderWidth" type="px" name="borderWidth" value="">
            <input type="button" onclick="increment('oborderWidth', 1)" value="+">
            <input type="button" onclick="increment('oborderWidth', -1)" value="-">
            <br/>
            <input type="color" id="obordercolor" name="borderColor"/>
            <input type="button" onclick="increment('obordercolor', 0.1)" value="+">
            <input type="button" onclick="increment('obordercolor', -0.1)" value="-">
        </div>
    </fieldset>
        <fieldset id="elementSpacing yui3-g">
            <div class="field yui3-u-2-5">
                <table>
                    <tr><td style="padding-right: 20px"><label for="margin">Margin</label> :
                        <input id="marginTotal" type="px" name="margin"/>
                        <input type="button" onclick="increment('marginTotal', -1)" value="-">
                        <input type="button" onclick="increment('marginTotal', 1)" value="+">
                    </td>
                        <td colspan="2" style="text-align: center;"><input type="px" name="marginTop" /></td></tr>
                    <tr><td></td>
                        <td><input type="px" name="marginLeft"/></td>
                        <td><input type="px" name="marginRight"/></td>
                    </tr>
                    <tr><td></td>
                        <td colspan="2" style="text-align: center;"><input type="px" name="marginBottom"/></td>
                    </tr>
                </table>
            </div>
            <div class="field yui3-u-2-5">
                <table>
                    <tr><td style="padding-right: 20px"><label for="padding">Padding</label> : <input type="px" id="paddingTotal" name="padding"/>
                        <input type="button" onclick="increment('paddingTotal', -1)" value="-">
                        <input type="button" onclick="increment('paddingTotal', 1)" value="+">
                    </td>
                        <td colspan="2" style="text-align: center;"><input type="px" name="paddingTop" /></td></tr>
                    <tr><td></td>
                        <td><input type="px" name="paddingLeft"/></td>
                        <td><input type="px" name="paddingRight"/></td>
                    </tr>
                    <tr><td></td>
                        <td colspan="2" style="text-align: center;"><input type="px" name="paddingBottom"/></td>
                    </tr>
                </table>
            </div>
            <div class="field">
                <label for="top">Offset</label>
                <span>
                Top: <input id="offSetTopInput" type="px" name="top"/>
                    <input type="button" onclick="increment('offSetTopInput', -1)" value="-">
                    <input type="button" onclick="increment('offSetTopInput', 1)" value="+">
                Left: <input id="offSetLeftInput"  type="px" name="left"/>
                    <input type="button" onclick="increment('offSetLeftInput', -1)" value="-">
                    <input type="button" onclick="increment('offSetLeftInput', 1)" value="+">
                </span>
            </div>
        </fieldset>
        <fieldset id="textStyles">
            <div class="field">
                <label for="fontFamily">Font Family</label>
                <@w.selectFontFamily name="fontFamily" />
            </div>
            <div class="field">
                <label for="fontSize">Text Size</label>
                <select name="fontSize">
                    <option value="100%">normal</option>
                    <option value="70%">smallest</option>
                    <option value="80%">smaller</option>
                    <option value="90%">small</option>
                    <option value="110%">large</option>
                    <option value="120%">larger</option>
                    <option value="130%">largest</option>
                </select>
            </div>
    </fieldset>
    <fieldset id="cssEffects">
        <div class="effects-options"></div>
    </fieldset>
    </div>
    </div>
    <div class="style-options"></div>
</form>
