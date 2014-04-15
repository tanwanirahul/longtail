<#include "/widgets/page/header.ftl"/>

<style>
#presetSelection {
    background: #777;
    color: #fff;
    height: 100px;
    left: 0;
    position: fixed;
    right: 0;
    top: 0;
    z-index: 200;
}

#previewSelections {
    position: fixed;
}

#currentImage {
    position: fixed;
    right: 0;
    bottom: 100px;
    width: 200px;
    border-left: 2px solid #000;
    border-top: 2px solid #000;
}

#cssPresetForm {
    position: fixed;
    right: 0;
    top: 100px;
    background: #999;
}

#cssPresetForm label {
    width: 50px;
    text-align: right;
    margin-right: 4px;
    display: inline-block;
    vertical-align: top;
}

#cssPresetForm .field {
    margin: 5px;
}

.yui3-tab {
    background: #555;
}

.yui3-tab-selected {
    background: #999;
}

.yui3-tab-panel-selected {
    background: #999;
}

#sampleWidget {
    margin-top: 30px;
    width: 350px;
    padding: 10px;
}
</style>

<form id="presetSelectionForm">
    <div id="presetSelection" class="tabs">
        <#assign keyList=req.styles?keys/>
        <ul>
            <#list keyList as k>
                <li><a href="#">${k}</a></li>
            </#list>
        </ul>
        <div>
            <#list keyList as k>
                <div class="${k}-gallery">
                    <#assign presetList = req.styles[k]/>
                    <#list presetList as c>
                        <div class="${k}-Swatch yui3-dropdown-item" data-uuid="${c.uuid}" style="${c.cssStyles}" data-csstext="${c.cssStyles}">
                        <#if k == "FontColor">AaBb</#if>
                        </div>
                    </#list>
                </div>
            </#list>
        </div>
    </div>
</form>

<div id="previewSelections">
    <h2>Preview</h2>
    <div id="c_sampleWidget">
    <div id="sampleWidget">
        <h3>We are DesignOnCloud.com</h3>
        <div editpath="data.widgets.WimguhB9Q.image" class="editable image-div" id="TyiIGP" title="Click to Edit" style="display: inline;float: left;width: 60px; height: 60px;padding: 0 5px 5px 0;">
            <img src="/static/img/no_img.jpg" id="yui_3_3_0_1_13072494870301883">
        </div>
        <p>Simplicity is beauty, but we can also deal with complexity if need be. We make it possible for everyone to design their own business website with ease. We have the best astounding features and the latest themes to suite your need.</p>
    </div>
    </div>
</div>

<form id="cssPresetForm">
    <h3>Create / Remove Style</h3>
    <div class="field"><label>UUID </label> <input type="text" name="uuid" readonly="readonly"/></div>
    <div class="field"><label>CSS  </label> <textarea name="cssStyles" rows="5" cols="40"></textarea></div>
    <div class="field"><label>Type  </label> <select name="type"><#list req.styles?keys as k><option>${k}</option></#list></select></div>
    <div class="field"><label>Preview Image </label> <input type="file" name="previewImage" disabled="disabled"></div>
    <div class="field" style="text-align: right;">
        <input type="submit" name="action" value="Update"/>
        <input type="submit" name="action" value="Create"/>
    </div>
</form>

<div id="currentImage">
    <textarea style="width: 100%;" rows="4"></textarea>
</div>

<#include "/widgets/page/footer.ftl"/>
<script>
    initSiteAndEdit();
    Y.use("event", function(){
        Y.on("hashed:loaded", function(){

            Y.longtail.Designer.bindSelector("#presetSelectionForm", "#sampleWidget");
            var presetForm = Y.one("#cssPresetForm");

            Y.delegate("click", function(e){
                var item = e.currentTarget;
                var uuid = item.getAttribute("data-uuid");
                var css = item.getAttribute("data-csstext");
                Y.longtail.forms.setValues(presetForm, {uuid: uuid, cssStyles: css});
                Y.fire('css-preset:selected', {node: item, cssId: uuid, cssText: css});
            }, "#presetSelectionForm", ".yui3-dropdown-item");

            var imageBrowser = new Y.longtail.ImageBrowser({zIndex: 100});
            imageBrowser.render();
            imageBrowser.on("selected:image", function(e){
                Y.one("#currentImage textarea").set("value", e.src);
            });
        });
    });
</script>