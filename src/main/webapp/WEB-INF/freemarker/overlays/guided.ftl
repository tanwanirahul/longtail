<ul class="slideshow-gallery workflow-step" style="font-size: 1.5em;">
	<li>This is a guided interface that will walk you through site creation steps. You 
	    can navigate between the steps by clicking the next and previous buttons.</li>
	<li>Start by selecting a home-page wire-frame from the choices.
		<button onclick="EditInterface.showOverlay('pages')">Run</button>
	</li>
	<li>Drop widgets to fill the data about your company. Look at some samples here
		<button onclick="EditInterface.showOverlay('widgets')">Run</button>
	</li>
	<li>Upload or select a logo. <button onclick="EditInterface.selectWidget('#siteLogoImg')">Run</button></li>
	<li>Add some product details.</li>
	<li class="sticky-slide" style="position: absolute;bottom: 0;"><button class="previous">Previous</button><button class="next">Next</button></li>
</ul>
