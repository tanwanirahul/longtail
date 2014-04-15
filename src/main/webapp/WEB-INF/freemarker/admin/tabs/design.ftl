<div class="design-pane yui3-tab-panel yui3-tab-panel-selected">
	<form name="cssStyleForm" class="css-style-form yui3-g" action="" onsubmit="return false">
          <div class="yui3-u-1-6 selected-element" style="position: relative;">
            <h6 class="h6">Selection</h6>
            <div class="container-area" onclick="EditInterface.navigate('ancestor')">Select Container</div>
            <div class="selected-area" onclick="EditInterface.highlightSelection();"><input type="checkbox"/> <span class="selected-widget">Text Element</span>
            	<input type="hidden" class="selector-value" name="selector" value=""/>
            </div>
          </div>

		  <div class="yui3-u-5-6">
			  <div class="design-tabs">
				<ul class="yui3-tabview-list">
					<li class="yui3-tab yui3-tab-selected" title="Change Design"><a class="yui3-tab-label" href="#layout">Styles</a></li>
					<li class="yui3-tab" title="Change Layout"><a class="yui3-tab-label" href="#layout">Layouts</a></li>
				</ul>
	
				<div class="yui3-tabview-panel">
					<div class="yui3-tab-panel yui3-tab-panel-selected yui3-g">
						<div class="yui3-u-3-8 yui3-g">
							<div class="design-blocks clearfix">
							    <h6 class="h6 left-stacked">Quick Styles</h6>
							    <div class="yui3-slider-view left-stacked yui3-g" 
							        data-type="quickstyles" title="Set of Saved Styles">
							    	<#list req.quickStyles.results as p>
							    		<@w.renderSwatch p=p type="quickstyles" pageSize=3 filters=""/>
							    	</#list>
							    </div>
							    
							    <div class="right-stacked middle-aligned">
								    <label class="small-text">Fill</label>
						            <div class="yui3-dropdown" data-type="Background"
						            	onclick="EditInterface.browseOptions(this, 'Background')"
						            	title="Change Background Image/Gradient/Texture"></div>
					            </div>	
					            
					            <div class="right-stacked middle-aligned" style="margin: 4px 0">	
						            <label class="small-text">Border</label>
						            <div class="yui3-dropdown" data-type="Border"
						            	onclick="EditInterface.browseOptions(this, 'Border')"
						            	title="Change Border Style"></div>
					            </div>
					            
					            <div class="right-stacked middle-aligned">
						            <label class="small-text">Effect</label>
						            <div class="yui3-dropdown" data-type="Effects"
						            	onclick="EditInterface.browseOptions(this, 'Effects')"
						            	title="Advanced Effects"></div>
					            </div>	
				            </div>	
			            </div>
			            
			            <div class="yui3-u-3-8">
			            	<div class="design-blocks clearfix">
							    <h6 class="h6 left-stacked">Text Styles</h6>
							    <div class="yui3-slider-view left-stacked" data-type="FontColor" 
							    	 title="Set of Saved Styles">
							    	<#list req.textStyles.results as p>
							    		<@w.renderSwatch p=p type="Font" pageSize=3 filters=""/>
							    	</#list>
							   	</div>
							    
							    <div class="right-stacked middle-aligned">
							    	<label class="small-text">Color</label>
							    	<div class="yui3-dropdown" data-type="FontColor" 
							    	 onclick="EditInterface.browseOptions(this, 'FontColor')"
							    	 title="Set of Saved Styles"></div>
							    </div>	 
	
								<div class="right-stacked middle-aligned" style="margin: 4px 0">
									<label class="small-text">Size</label>
								   	<div>
								    	<input type="text" class="yui3-spinner right-stacked" name="fontSize" title="Change text size">
								    </div>
								</div>    
							    
							    <div class="right-stacked middle-aligned">
							    	<label class="small-text">Effect</label>
					            	<div class="yui3-dropdown" data-type="Effects" 
					            	 onclick="EditInterface.browseOptions(this, 'Effects')" 
					            	 title="Advanced Effects"></div>
					            </div>	 
					       </div>     	 
			        	</div>
			            
			            <div class="yui3-u-1-4">
			            	<div class="design-blocks clearfix">
				          		<h6 class="h6">Position &amp; Spacing</h6>
				          		
				          		<div class="right-stacked middle-aligned">
					          		<label class="small-text">Width</label>
					          		<input name="width" class="yui3-spinner" value="0" title="Margins outside the border">
				          		</div>
				          		
				          		<div class="left-stacked middle-aligned">
					          		<label class="small-text">Height</label>
					          		<input name="height" class="yui3-spinner" value="0" title="Margins outside the border">
				          		</div>
				          		
				          		<div class="right-stacked middle-aligned" style="margin-top: 12px;">
					          		<label class="small-text">Padding</label>
					          		<input name="padding" class="yui3-spinner" value="0" title="Margins inside the border">
				          		</div>
				          		
				          		<div class="left-stacked middle-aligned"  style="margin-top: 12px;">
					          		<label class="small-text">Margin</label>
					          		<input name="margin" class="yui3-spinner" value="0" title="Margins outside the border">
				          		</div>
			          		</div>
			            </div>
			        </div>
	
			        <div class="yui3-tab-panel yui3-g">
		            	<h6 class="yui3-u-1 h6">Layout Options</h6>
		            	<h5 class="yui3-u-1-6">Layout 1</h5>
		            	<h5 class="yui3-u-1-6">Layout 2</h5>
		            	<h5 class="yui3-u-1-6">Layout 3</h5>
		            	<h5 class="yui3-u-1-6">Layout 4</h5>
		            	<h5 class="yui3-u-1-6">Layout 5</h5>
		            	<h5 class="yui3-u-1-6">Layout 6</h5>
		        	</div>	
			        
				</div>
				
			  </div>
		  </div>

          <fieldset class="field-extension"></fieldset>
    </form>

</div> 