<div id="canvas">

<style>
  #header {height: 50px;}
  <@w.renderHeaderFragment header=t.themeCSS() cssId="themeStylesCss"/>
	<@w.renderHeaderFragment header=t.quickstylesCSS() cssId="quickStyles"/>
	<@w.renderHeaderFragment header=t.presetsCSS() cssId="presetStyles"/>
	<@w.renderHeaderFragment header=t.customCSS() cssId="customStyles"/>
</style>

${t.render("", "canvas", "")}

<div id="pageGallery" class="yui3-g page-gallery">
	<div class="yui3-u">Image Gallery Page</div>
	<div class="yui3-u">Home Delivery Page</div>
	<div class="yui3-u">Contact Now Page</div>
	<div class="yui3-u">Custom</div>
</div>

<script>
	document.getElementById('Content_Body').appendChild(document.getElementById('pageGallery'));
</script>

</div>
