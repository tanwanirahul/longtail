<div class="yui3-g">
    <div id="uploadForm" class="image-upload-form yui3-u-1-6" style="height: 100%;">
        <div style="border-right: 1px solid #000;margin: 0; padding: 8px; font-size: 12px;height: 100%;">
            <div style="margin: 5px 0;">Upload Image</div>
            <form class="image-upload-form" action="${req.servicesBase}/image/upload" enctype="multipart/form-data" method="POST" 
                    style="text-align: left;padding: 0; margin: 0;width: auto;">
                <input type="file" name="file" style="font-size: 10px;" />
                
                <#if (req.params.cat)??>
                	<input type="hidden" name="category" value="${req.params.cat}"/>
                <#else>
                	<select name="category">
                		<option value="GENERAL">General</option>
                		<option value="GRADIENT">Gradient</option>
                		<option value="HEADER">Header</option>
                		<option value="ICON">Icon</option>
                		<option value="TEXTURE">Texture</option>
                		<option value="BACKGROUND">Background</option>
                	</select>
                </#if>
                <input type="submit" class="form-submit-button" value="Upload" style="display: block; margin: 5px 0;" />
            </form>
        </div>
    </div>
    <div class="yui3-u-4-5" style="height: 100%;">
        <div style="border-left: 1px solid #3E4E6A; height: 100%;">
        <div style="overflow-y: auto;">
        	<@w.renderPagination page=images targetId="imageBrowseList" targetUrl="${req.servicesBase}/image/browse?"/>
	        <div id="imageBrowseList" class="yui3-g image-list">
	            <#list images.results as i>
	                <div class="image-thumb yui3-u" title="Click to select this Image">
	                    <img src="${req.staticBase}/${i.path}"/>
	                </div>
	            </#list>
	        </div>
        </div>
        </div>
    </div>
	<div class="close" style="float:right;"></div>
</div>
