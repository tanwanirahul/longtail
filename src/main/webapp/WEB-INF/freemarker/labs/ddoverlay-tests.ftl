<#include "/widgets/page/header.ftl"/>
<style>
  #sampleWidget {
    width: 300px; 
    border: 1px solid black;
  }
</style>
<form id="boxStylesForm" class="box-style-bar">
	<label>Fill Color</label>
	<div class="yui3-dropdown" type="BackgroundColor"></div>
	
	<label>Pattern</label>
	<div class="yui3-dropdown" type="BackgroundImage"></div>
	<div class="yui3-dropdown" type="Gradient"></div>
	<div class="yui3-dropdown" type="Texture"></div>
	
	<label>Border</label>
	<div class="yui3-dropdown" type="BoxStyle"></div>

	<label>Shadow</label>
	<div class="yui3-dropdown" type="Shadow"></div>

	<label>Rounded Corner</label>
	<input name="MozBorderRadius" class="yui3-spinner">

	<label>Padding</label>
	<input name="padding" class="yui3-spinner" >
	
	<label>Width</label>
	<input name="width" class="yui3-spinner">
	
	<label>Height</label>
	<input name="height" class="yui3-spinner">
	
</form>

<div id="textStylesForm" class="box-style-bar yui3-g">
	<label>Font</label>
	<div class="yui3-dropdown" type="Font"></div>
	<div class="yui3-dropdown" type="FontColor"></div>
	<input name="fontSize" class="yui3-spinner">
</div>


<div id="imageStylesForm" class="box-style-bar yui3-g">
	<label>Image</label>
	<input name="src" />
	
	<label>Link</label>
	<textarea name="href" ></textarea>
</div>

<div id="c_sampleWidget">
<div id="sampleWidget">
	<h3>Text Title</h3>
	<p>Simplicity is beauty, but we can also deal with complexity if need be. We make it possible for everyone to design their own business website with ease. We have the best astounding features and the latest themes to suite your need.</p>
	<div editpath="data.widgets.WimguhB9Q.image" class="editable image-div" id="TyiIGP" title="Click to Edit">
		<img src="/static/img/no_img.jpg" id="yui_3_3_0_1_13072494870301883">
	</div>
</div>
</div>

<#include "/widgets/page/footer.ftl"/>
<script>
	initSiteAndEdit();
	Y.use("event", function(){
		Y.on("hashed:loaded", function(){
			Y.all(".yui3-dropdown").each(function(e){
				var d = new Y.longtail.DropDown({srcNode: e});
				d.render();
			});

			Y.longtail.Designer.bindSelector("#boxStylesForm", "#sampleWidget");
			Y.longtail.Designer.bindSelector("#textStylesForm", "#sampleWidget");
			Y.longtail.Designer.bindSelector("#imageStylesForm", Y.one("#TyiIGP").one("img"));
		});
	});
</script>