<div id="canvas">

	<form action="">
		<div class="form-field">
			<label for="siteName">Site Name</label>
			<input type="text" value="" placeHolder="your site name" onchange="Y.longtail.SaveQueue.save('custom-attribute',{node:'siteNameText', name:'text', value: this.value})"/>
		</div>
		
		
		<div class="form-field">
			<label for="logo">Select a Logo</label>
			
			<div>
				<input type="hidden" name="logo"/>
			
				<div class="yui3-g logo-gallery">
					<div class="yui3-u" onclick="Y.longtail.SaveQueue.save('custom-attribute',{node:'siteLogoImg', name:'path', value: 'http://www.google.com/logos/2011/thailand_day-2011-hp.jpg'})">
						<img src="http://www.google.com/logos/2011/thailand_day-2011-hp.jpg"/>
					</div>

					<div class="yui3-u" onclick="Y.longtail.SaveQueue.save('custom-attribute',{node:'siteLogoImg', name:'path', value: 'http://www.google.com/logos/2011/d4g11_uae-hp.jpg'})">
						<img src="http://www.google.com/logos/2011/d4g11_uae-hp.jpg"/>
					</div>

					<div class="yui3-u" onclick="Y.longtail.SaveQueue.save('custom-attribute',{node:'siteLogoImg', name:'path', value: 'http://www.google.com/logos/2011/romania11-hp.jpg'})">
						<img src="http://www.google.com/logos/2011/romania11-hp.jpg"/>
					</div>

					<div class="yui3-u" onclick="Y.longtail.SaveQueue.save('custom-attribute',{node:'siteLogoImg', name:'path', value: 'http://www.google.com/logos/2011/twain11-hp.jpg'})">
						<img src="http://www.google.com/logos/2011/twain11-hp.jpg"/>
					</div>

					<div class="yui3-u">Upload <input type="file"/></div>
				</div>

				<h4>Or Use site name as logo</h4>

			
			</div>
		</div>
		
		
		
	</form>

</div>