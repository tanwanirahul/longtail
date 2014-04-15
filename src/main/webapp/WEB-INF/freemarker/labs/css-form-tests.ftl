<#include "/widgets/page/header.ftl"/>
<@w.widget name="content">
	<h3>Widget Title</h3>	
	<div class="editable image-div" id="imageDiv">
		<img alt="Sample Image" style="border:1px solid black; float: right;" id="myImage" src="${req.staticBase}/img/no_img.jpg" />
	</div>
	<p>
	It is a long established fact that a reader will be distracted by the readable content 
	of a page when looking at its layout. The point of using Lorem Ipsum is that it has a 
	more-or-less normal distribution of letters, as opposed to using 'Content here, content here', 
	making it look like readable English. 
	
	Many desktop publishing packages and web page editors 
	now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover 
	many web sites still in their infancy. Various versions have evolved over the years, 
	sometimes by accident, sometimes on purpose (injected humour and the like).
	</p>
</@w.widget>

<#include "../overlays/imageForm.ftl"/>
<#include "/widgets/page/footer.ftl"/>
<script type="text/javascript" src="${req.staticBase}/js/CSSStyler.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/longtail-form.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/multi-overlay.js"></script>
<script>
	Y.use("node", "event","longtail-form","css-styler-form","longtail-multi-overlay", "longtail-image-overlay", function(Y)
	{
		Y.on("domready", function(){

			var template = Y.one("#editImageTemplate");
			var image = Y.one("#myImage");
			Y.longtail.CSSStyler.setCurrent(image, "#imageCSSStyleForm");
			initEditInterface();
		});
	}); 	

	function initCSSForm()
	{
		ImageEditor.onEdit({currentTarget: Y.one("#imageDiv")});
	}
</script>
