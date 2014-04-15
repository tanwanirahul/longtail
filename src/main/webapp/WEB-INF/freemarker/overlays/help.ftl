<div class="yui3-overlay-help yui3-widget yui3-overlay yui3-longtail-overlay yui3-widget-positioned yui3-widget-stacked" style="z-index: 110;">
<div class="yui3-overlay-mask"></div>
<div class="yui3-widget-hd">Quick Overview <div class="close" style="cursor: pointer;" onclick="Y.one('.yui3-overlay-help').remove()">X</div></div>
<div class="yui3-widget-bd"> 
<div class="help-overlay" style="background-color: #000;">
	
	<h3 style="font-size: 18px;padding:20px 50px;color: #EFEFEF;font-weight: bold;">Some quick guidelines to help you through the interface</h3>
    <div style="text-align: left;padding:25px 50px;font-size: 14px;" class="yui3-g">
        <table>
            <tr style="border-bottom: 1px solid #333333;">
                <td>
                    <div class="yui3-u-1-3 help-illustration-text help-illustration"></div>            	
                </td>
                <td>
                    <h4 class="yui3-u-2-3">To edit Text, click on it and start typing. Use blue arrow icon to adjust position.</h4>
                </td>
            </tr>
            <tr style="border-bottom: 1px solid #333333; border-top: 1px solid #777777; padding:20px 0;">
                <td>
                    <div class="help-illustration-image help-illustration yui3-u"></div>
                </td>
                <td>
                    <h4 class="yui3-u">To edit Image, click and browse image library Or upload your own image. Use image properties on top right to adjust width and aspect ratio. </h4>
                </td>
            </tr>
            <tr style="border-bottom: 1px solid #333333; border-top: 1px solid #777777; padding:20px 0;">
                <td>
                    <div class="yui3-u help-illustration-widget help-illustration"></div>
                </td>
                <td>
                    <h4 class="yui3-u">Add more content to the page using the Widgets Tab.</h4>
                    <br/>
                </td>
            </tr>
            <tr style="border-bottom: 1px solid #333333; border-top: 1px solid #777777; padding:20px 0;">
                <td>
                    <div class="yui3-u help-illustration-style help-illustration"></div>
                </td>
                <td>
                    <h4 class="yui3-u">Use Quick Styles and other styling elements in Design Tab to quickly achieve the look you want.</h4>
                </td>
            </tr>
        </table>
	</div>
	
	<div style="text-align: left;padding: 20px 50px;">
	<h5 style="font-size: 16px;">If this is your first web design, we suggest going through the tutorial<br/>
	- <a href="${req.siteUrl}/tutorial" target="_blank" style="color:#FFFF00;">Create your first website in 5 simple steps</a></h5>
	</div>
	
    <div style="background-color: #000;height: 40px;">
        <button class="button done" onclick="Y.one('.yui3-overlay-help').remove()" style="float:right;margin-right:55px;font-weight: bold;letter-spacing:1;font-size: 18px;">I am Ready to Design</button> 
    </div>
		<style>
	 .help-illustration {
	   background-image: url('${req.staticBase}/img/Help-Overlay.png');
	   background-repeat: no-repeat;
	 }
	 
	 .help-illustration, .help-overlay h4{ vertical-align: middle;margin: 5px 15px;}
	 .help-overlay h4{ width: 500px;}
	 .help-illustration-text {background-position: 0 -86px;height: 42px; width: 132px;}
	 .help-illustration-image {background-position: 0 -129px;height: 61px; width: 100px;}
	 .help-illustration-widget {background-position: 0 0px;height: 35px; width: 100px;}
	 .help-illustration-style {background-position: -99px 0;height: 35px; width: 132px;}
	</style>
	</div>
</div></div>