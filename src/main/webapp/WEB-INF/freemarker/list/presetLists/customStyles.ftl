<div class="yui3-g css-style-form" style="height:auto;">

    <div class="yui3-u-1-4 styles-section" style="width:21%;padding-left:10px;">
        <div class="yui3-u-1 legend">
            Background Settings
        </div>
        <div class="yui3-u-1-3">
            <table>
                <tr><td colspan="2">Attachment</td></tr>
                <tr><td>Fixed <input name="backgroundAttachment" type="radio" value="fixed"><br/></td></tr>
                <tr><td>Scroll <input name="backgroundAttachment" type="radio" value="scroll"></td></tr>
            </table>
        </div><div class="yui3-u-1-3">
            <table>
                <tr><td colspan="2">Repeat</td></tr>
                <tr><td><input type="radio" name="backgroundRepeat" value="no-repeat"></td><td><input type="radio" name="backgroundRepeat" value="repeat-x"></td></tr>
                <tr><td><input type="radio" name="backgroundRepeat" value="repeat-y" ></td><td><input type="radio" name="backgroundRepeat" value="repeat"></td></tr>
            </table>
        </div><div class="yui3-u-1-3">
            <table>
                <tr><td colspan="3">Position</td></tr>
                <tr><td><input type="radio" name="backgroundPosition" value="left top"></td><td><input type="radio" name="backgroundPosition" value="center top"></td><td><input type="radio" name="backgroundPosition" value="right top"></td></tr>
                <tr><td><input type="radio" name="backgroundPosition" value="left center"></td><td><input type="radio" name="backgroundPosition" value="center center"></td><td><input type="radio" name="backgroundPosition" value="right center"></td></tr>
                <tr><td><input type="radio" name="backgroundPosition" value="left bottom"></td><td><input type="radio" name="backgroundPosition" value="center bottom"></td><td><input type="radio" name="backgroundPosition" value="right bottom"></td></tr>
            </table>
        </div>
    </div>

    <div class="yui3-u-1-4 styles-section" style="width:21%;padding-left:10px;">
        <div class="yui3-u-1 legend">
            Text Settings
        </div>
        <div class="yui3-u-1" style="margin-bottom:5px;">
            <select name="fontFamily" style="width: 25%;margin-right:5px;">
                <option>Select a Font</option>
                <option>Helvetica Neue</option>
                <option>Arial</option>
                <option>Georgia</option>
                <option>Times New Roman</option>
                <option>Tahoma</option>
                <option>Trebuchet</option>
                <option>Lucida</option>
                <option>Lucida Grande</option>
                <option>Verdana</option>
                <option>Droid Sans</option>
                <option>Yanone Kaffeesatz</option>
                <option>Droid Serif</option>
                <option>Lobster</option>
                <option>Nobile</option>
                <option>Reenie Beanie</option>
                <option>Tangerine</option>
                <option>Josefin Slab</option>
                <option>PT Sans</option>
                <option>Molengo</option>
                <option>OFL Sorts Mill Goudy TT</option>
                <option>Vollkorn</option>
                <option>Neucha</option>
                <option>Cantarell</option>
                <option>Inconsolata</option>
                <option>Crimson Text</option>
                <option>Cardo</option>
                <option>Cuprum</option>
                <option>Ubuntu</option>
                <option>Droid Sans Mono</option>
                <option>Neuton</option>
                <option>Just Me Again Down Here</option>
                <option>Old Standard TT</option>
                <option>Philosopher</option>
            </select>
            <input type="text" name="fontSize" class="yui3-spinner" min="8" max="216" minorStep="1" majorStep="8" value="0" title="Change Text Size" />
            <input type="color" name="color" style="width:50px;margin-left:5px;" title="Change Color of the Text"/>
        </div>
        <div class="yui3-u-1">
            <span class="text-align">
              <input type="button" class="align-left" title="Left Text Alignment" onclick="Y.fire('custom:css', {node: this, css: {textAlign : 'left'}})" value=""/>
              <input type="button" class="align-center" title="Center Text Alignment" onclick="Y.fire('custom:css', {node: this, css: {textAlign : 'center'}})" value=""/>
              <input type="button" class="align-right" title="Right Text Alignment" onclick="Y.fire('custom:css', {node: this, css: {textAlign : 'right'}})" value=""/>
              <input type="button" class="align-justify" title="Justify Text Alignment" onclick="Y.fire('custom:css', {node: this, css: {textAlign : 'justify'}})" value=""/>
            </span>
            <select name="attr_type" style="margin-left:10px;">
                 <option>Select Type</option>
                 <option value="div">Default</option>
                 <option value="h1">Heading 1</option>
                 <option value="h2">Heading 2</option>
                 <option value="h3">Heading 3</option>
                 <option value="h4">Heading 4</option>
                 <option value="h5">Heading 5</option>
                 <option value="h6">Heading 6</option>
                 <option value="p">Paragraph</option>
                 <option value="blockquote">Quote</option>
            </select>           
        </div>
        <div class="yui3-u-1-2" style="margin:5px 0;">
            <label>Line Height</label>
            <input type="text" name="lineHeight" class="yui3-spinner" min="0" max="5" minorStep="0.1" majorStep="0.5" />
        </div><div class="yui3-u-1-2" style="margin:5px 0;">
            <label>Letter Spacing</label>
            <input type="text" name="letterSpacing" class="yui3-spinner" min="-20" max="50" minorStep="1" majorStep="2" value="0" />
        </div>
    </div>

    <div class="yui3-u-1-4 styles-section" style="width:21%;padding-left:10px;">
        <div class="yui3-u-1 legend">
            Image Settings
        </div>   
        <div class="yui3-u-1-2">
            <label>Reset Container :</label> </br>
            <input type="button" class="reset-size" title="Reset Width to Auto" onclick="Y.fire('custom:css', {node: this, css: {width : 'auto'}})" value="Width"/>
            <input type="button" class="reset-size" title="Reset Height to Auto" onclick="Y.fire('custom:css', {node: this, css: {minHeight : '0'}})" value="Height"/>
        </div><div class="yui3-u-1-2">
            <label>Reset Image:</label> </br>
            <input type="button" class="reset-size" title="Reset to Original Image Size" onclick="Y.fire('custom:css', {node: this, css: {imagesize : 'reset'}})" value="Size"/>
            <input type="button" class="reset-size" title="Reset to Original Image Aspect Ratio" onclick="Y.fire('custom:css', {node: this, css: {imageaspect : 'reset'}})" value="Aspect"/>
        </div>
        <div class="yui3-u-1" style="margin:5px 0;">
              <label for="href" style="margin-right: 2%;">Link :</label>
              <input type="text" name="href" title="Add/Modify link for the selected Image" style="width: 66%;" />
        </div>
        <div class="yui3-u-1" style="margin:5px 0;">
              <label for="href" style="margin-right: 2%;">Alt Text :</label>
              <input type="text" name="imgalt" title="Add/Modify Alt text for the selected Image" style="width: 60%;" />
        </div>
    </div>

    <div class="yui3-u-1-4 styles-section" style="width:25%;padding-left:10px;">
        <div class="yui3-u-1 legend">
            Border Settings
        </div>          
        <div class="yui3-u-2-3">
          <table style="text-align:center;width:90%;">
            <tr style="height: 26px;">
                <td><input class="yui3-spinner border-radius-element" name="borderTopLeftRadius" type="text"/></td>
                <td><input class="yui3-spinner" name="borderTopWidth" type="text"/></td>
                <td><input class="yui3-spinner border-radius-element" name="borderTopRightRadius" type="text"/></td>
            </tr>
            <tr style="height: 24px;">
                <td><input class="yui3-spinner" name="borderLeftWidth" type="text"/></td>
                <td></td>
                <td><input class="yui3-spinner" name="borderRightWidth" type="text"/></td>
            </tr>
            <tr style="height: 26px;">
                <td><input class="yui3-spinner border-radius-element" name="borderBottomLeftRadius" type="text"/></td>
                <td><input class="yui3-spinner" name="borderBottomWidth" type="text"/></td>
                <td><input class="yui3-spinner border-radius-element" name="borderBottomRightRadius" type="text"/></td>
            </tr>
          </table>      
        </div><div class="yui3-u-1-3">
            <div class="yui3-u-1" style="margin:5px 0;">
                <label>Width&nbsp;</label>
                <input name="borderWidth" class="yui3-spinner" value="0" title="Change Border Width"/>
            </div><div class="yui3-u-1" style="margin-bottom:5px;">
                <label>Radius&nbsp;</label>
                <input name="borderRadius" class="yui3-spinner" value="0" title="Change Border Radius"/>
            </div><div>
                <label>Color&nbsp;</label>
                <input type="color" name="borderColor" style="width:50px;" title="Change Border Color"/>
            </div>
        </div>
    </div>

</div>