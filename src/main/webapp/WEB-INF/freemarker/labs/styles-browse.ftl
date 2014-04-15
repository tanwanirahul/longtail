<#include "/widgets/page/header.ftl"/>

<style>
  .preset-selection-div {
    height: auto;
  }
  
  .preset-swatches div {
    width: 200px;
  }
  
  .yui3-overlay.yui3-overlay-labs-bundles-browser {
    width: auto;
    position: static !important;
    height: auto;
    background: none !important;
  }
  
  
</style>

<div id="browse_styles_widget">




</div>

<script>
	onDomReady(function(){
		Y.once("hashed:loaded", function(){
			Y.log("Rendering");
			var node = Y.one("#browse_styles_widget");
			Y.LUI.open("itembrowseroverlay", {
				  type: 'labs-bundles-browser', 
				  href: PageData.servicesBase + '/styles/browse?type=bundles&ps=50',
			      node: node, 
			      headerContent: "Browsing Bundles",
			      closeOnClickOutside : false 
				  }, 

			      [node]);
		});
	});
	initSiteAndEdit();
</script>

<#include "/widgets/page/footer.ftl"/>