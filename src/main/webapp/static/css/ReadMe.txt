The CSS structure supported right now is
	.site-container : Contains the full user site
	.page : Container for content specific to the current page 
	.content-area : One or more content-areas
	.section
	.column
	.leaf 

.content-area .section .column .leaf : Are also widgets and follow the wrapper specification as below. 

The Widget Wrapper Specification
	<div class="container content-widget-container leaf-container|column-container|section-container|content-area-container" id="c_${widgetId}">
		<div class="top"><div class="tl"></div><div class="tr"></div></div>
		  	
		  	<div class="widget content-widget no-title leaf|column|section|content-area" id="${widgetId}">
		  	  $$$$ Actual Widget Content $$$$
		  	</div>
		
		<div class="bottom"><div class="bl"></div><div class="br"></div></div>
	</div>

