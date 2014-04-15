<#-- Other Edit interface related code -->
<div class="templates" style="display: none">
    <div id="cal1Container" class="yui-skin-sam"></div>

    <div id="editOverlay" class="edit-overlay yui3-overlay">
        <div class="status-bar">
            <div class="edit-settings" title="Edit Widget Settings"></div>
            <div class="edit-styles" title="Edit Container Styles"></div>
            <div class="delete" title="Remove this Widget"></div>
        </div>
    </div>
    <div id="actionsOverlay">
        <div class="yui3-widget-hd"><span class="header">Header</span></div>
        <div class="yui3-widget-bd"></div>
        <div class="yui3-widget-ft"><span class="close" style="cursor: pointer;">Save &amp; Close</span></div>
    </div>
    <div id="columnResizer" class="resizer yui3-overlay">
        <div class="thumb-rail">
            <div class="col-change">
                <div class="section-settings"></div>
                <div class="section-settings-overlay">
                  <div class="arrow-top"></div>
                  <select class="col-change-select" style="float:left">
                        <option value="1">1 Column</option>
                        <option value="2">2 Column</option>
                        <option value="3">3 Column</option>
                        <option value="4">4 Column</option>
                        <option value="5">5 Column</option>
                    </select>
                    <span title="Edit Section Styles" class="edit-styles"></span>
                    <span title="Move Up Entire Section" class="move-up"></span>
                    <span title="Move Down Entire Section" class="move-down"></span>
                    <span title="Delete Entire Section" class="delete"></span>
                </div></div>
            <div class="thumb first"><div class="thumb-img"></div></div>
            <div class="thumb second"><div class="thumb-img"></div></div>
            <div class="thumb third"><div class="thumb-img"></div></div>
            <div class="thumb fourth"><div class="thumb-img"></div></div>
        </div>
    </div>
</div>

<textarea id="editor" style="display: none;"></textarea>

<div style="display: none;" id="textButtonsForm">
  <iframe src="/static/html/text-buttons.html" border="0" scrolling="0"
       style="border: none; width: 216px; height: 20px; overflow: hidden;"></iframe>
</div>
