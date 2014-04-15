<fieldset class="item-properties yui3-g">
  <div class="FormDataItemSettings yui3-u-1-6">
    <button name="form-settings" style="height: 50px;">Form Settings</button>
  </div>

  <div class="TextDataItemSettings yui3-u-1-3">
      
  </div>

  <div class="ListDataItemSettings yui3-u-1-4">
    <div style="font-size:13px; font-weight:bold; margin: 2px;"> Image Gallery Settings </div>
    <button name="slideshow" value="delete">Delete Slide</button>
    <button name="slideshow" value="previous">Previous Slide</button>
    <button name="slideshow" value="next">Next Slide</button>
    <button name="slideshow" value="add">Add Slide</button>
    <input type="button" class="change-image" title="Change the current Image" onclick="EditInterface.openItemBrowse(this,'content-image'); return false" value="Change Slide"/>
  </div>

  <div class="ActionItems yui3-u-1-4">
    <div style="font-size: 13px; font-weight:bold; margin: 2px;"> Data Element Settings </div>
    <button name="delete" value="delete">Delete</button>
    <button name="addSibling" value="clone">Copy Down</button>
    <button name="addSibling" value="text">Insert Text Below</button>
    <button name="addSibling" value="image">Insert Img Below</button>

    Display
      <input type="radio" name="display" value="block"> Block
      <input type="radio" name="display" value="none"> None
      <input type="radio" name="display" value="inline-block"> Inline

  </div>
</fieldset>

<#--
  <div class="CommonActions">
    Common Actions
    <button>Hide</button>
    <button>Remove</button>
    <button>Copy Down</button>
    <button>Copy Up</button>
    <button>Add Image</button>
    <button>Add Text</button>
    <button>Auto Width</button>
    <button>Auto Height</button>
    <button>Link</button>
    <button>Select Parent</button>
    <button>Select Child</button>
    <button>Select Next</button>

    Display
    <input type="checkbox" name="mode" value="h"> Block
    <input type="checkbox" name="mode" value="v"> Inline
  </div>

  <div class="ListDataInstanceSettings">
    List Settings
    <input type="checkbox" name="mode" value="h"> Horizontal Slideshow
    <input type="checkbox" name="mode" value="v"> Vertical Slideshow
    <input type="checkbox" name="mode" value="f"> FadeIn Slideshow
    <input type="checkbox" name="mode" value="m"> Marquee
    <input type="checkbox" name="mode" value="m"> Horizontal List
    <input type="checkbox" name="mode" value="m"> Vertical List
  </div>

  <div class="ImageDataItemSettings">
    Image Settings
    <button>Change Image</button>
    <button>Reset Size</button>
    <button>Fix Aspect</button>
  </div>

  <div class="WidgetInstanceSettings">
    Custom Layouts <select><option>Select Layout</option></select>
  </div>
-->
