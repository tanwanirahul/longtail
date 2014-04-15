<html>
<head>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.3.0/build/cssreset/reset-min.css"/>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.3.0/build/cssfonts/fonts-min.css"/>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/js/yui/3.3.0/build/cssgrids/grids-min.css"/>
<link rel="stylesheet" type="text/css" href="${req.staticBase}/css/elaunch/base.css"/>
<script type="text/javascript" src="${req.staticBase}/js/yui/3.3.0/build/yui/yui-min.js"></script>

<script type="text/javascript" src="${req.staticBase}/js/preload.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/spinner.js"></script>

<style>
#c_widgetProps {
  background: #B8B8B8;
  position: absolute;
  width: 322px;
  margin-left: 10px;
}

#widgetProps {
  padding: 2px 5px;
  border: 1px solid #000;
}

#c_widgetProps .tl {
    border-bottom: 10px solid transparent;
	border-top: 10px solid transparent;
	border-right: 10px solid #000;
	height: 0px;
	width:0px;
	position: absolute;
	left: -10px;
	top: 20px;
}

#styleBar {
  background-color: black;
  height: 500px;
  width: 100px;
  position: absolute;
  right: 10px;
  -moz-border-radius: 20px;
  border : 3px solid white;
}

#gorilla {
  margin: 0;
}

#leftWidgetsBar {
  background-color: black;
  width: 180px;
  height: 500px;
  position: absolute;
  left: 10px;
  top: 100px;
  -moz-border-radius: 20px;
  border : 3px solid white;
}

#layoutArea {
  width: auto;
}

.widget {
  padding: 5px;
  cursor: move;
  position: relative;
}

#leftWidgetsBar .widget {
  margin: 10px 3px;
  background: #fff;
  border: 2px solid black;  
  -moz-border-radius : 5px;
  text-align: center;
}

.widget-container.focussed {
  border: 2px solid black;
  margin-left: -2px;
  margin-top: -2px;
}

textarea {
  border: none;
}

body {
  background: #D3FF99;
}
#canvas {
  position: absolute;
  height: 100%;
  width: 100%;
  z-index: -1;
}

#canvas img, #canvas textarea {
  display: block;
  width: 100%;
  height: 100%;
}

 

</style>

<script>
	onDomReady(function(){
		Y.use("node", "overlay","dd-plugin","dd-drop-plugin","css","selector-css3","resize", function(Y)
		{
			var widgetsTray = Y.one("#leftWidgetsBar"); 
			var canvas = Y.one("#canvas");

			canvas.plug(Y.Plugin.Drop);

			var trayDelegate = new Y.DD.Delegate({
				container : widgetsTray,
				nodes : ".widget"
			});

			var movedelegate = new Y.DD.Delegate({
				container : canvas,
				nodes : ".widget-container"
			});
			
			trayDelegate.on("drag:drophit", function(e){
				console.log("Dropped on Canvas");
				console.log(e);
				var dragNode = e.drag.get("dragNode"); 
				var html = dragNode.get("innerHTML");
				var node = Y.Node.create('<div class="widget-container"><div class="top"><div class="tl"></div><div class="tr"></div></div><div class="widget">' + html + '</div></div>');
				Y.one("#canvas").append(node);
				node.setStyle("position", "absolute");
				node.setXY(dragNode.getXY());
				var resize = new Y.Resize(
						{node : node.one(".widget"),
						 handles: "br"
							});
			});

			trayDelegate.dd.plug(Y.Plugin.DDProxy, {
				moveOnEnd : false,
				cloneNode : true
			}).plug(Y.Plugin.DDWinScroll);
			
			// Y.one("#c_widgetProps").plug(Y.Plugin.Drag);
			// yui3-overlay

			var propsOverlay = new Y.Overlay({srcNode: "#c_widgetProps"});
			propsOverlay.render();
			propsOverlay.hide();
			
			Y.delegate("click", function(e){
				console.log("Opening properties window");
				var widget = e.currentTarget;
				Y.all(".focussed.widget-container").removeClass("focussed");
				widget.addClass("focussed");
				propsOverlay.set("align",{node: widget, points:["tl","tr"]});
				propsOverlay.show();
			}, "#canvas", ".widget-container");

			canvas.on("click", function(e){
				if(e.target.hasClass("canvas"))
				{
					Y.all(".focussed.widget-container").removeClass("focussed");
					propsOverlay.hide();
				}
			});
		});
	});
</script>

</head>
<body>
	<div id="topBar">
	    <img class="editbar-logo" alt="" src="/static/img/logo.png" />
	    <div id="accountActions">
	        <div id="userProfileBar" class="toggle-select">
	            <a id="account">
	                <span class="user-name">${req.loggedInUserName}</span>
	            </a>
	        </div>
	        <div class="edit-link">
	            <span class="slash">|</span> <a href="#mode=edit" class="edit-action">Edit</a>
	        </div>
	        <div class="help-link">
	            <span class="slash">|</span> <a class="overlay help-button" title="Help" href="${req.siteBase}/overlays/help">Help</a>
	        </div>
	        <div class="signout-link">
	            <span class="slash">|</span> <a href="/j_spring_security_logout">Sign Out</a>
	        </div>
	    </div>
	</div>


	<div id="leftWidgetsBar">
		<div class="widget image">
			<img src="${req.staticBase}/img/no_img.jpg"/>
		</div>
		
		<div class="widget text">
			<textarea rows="" cols="8">Text</textarea>
		</div>
				
		<div class="widget text">
			<form>
				<input name="email" value="Your email e.g. john@yahoo.com">
				<input type="submit" value="Submit">
			</form>
		</div>
				
	</div>

		<@w.widgetLayout name="properties" id="widgetProps">
			<h3 style="padding-bottom: 3px;">Widget Properties <a href="#" style="font-size: 80%; float: right;-moz-border-radius: 8px; background: #e00; padding: 3px 8px; border: 2px solid #988;color: white;text-decoration: none;">Delete</a></h3>
			<hr/>
			<div class="actions" style="height: 30px;">
				<div style="float: left;padding: 3px 8px;">Layer 
					<a href="#" style="border: 1px solid black; padding :1px;-moz-border-radius: 3px;color: black;text-decoration: none;">&#9660;</a> 
					<a href="#" style="border: 1px solid black; padding :1px;-moz-border-radius: 3px;color: black;text-decoration: none;">&#9650;</a>
				</div> 
				<div style="">
				
				</div>
			</div>
			<hr/>
			<div class="accordian">
				<div class="background">
					<h4>Background</h4>
					<div>
						<div style="margin-top: 3px;">
							<input type="radio" name="type"> None
							<input type="radio" name="type"> Solid
							<input type="radio" name="type"> Gradient
							<input type="radio" name="type"> Texture
							<input type="radio" name="type"> Image
						</div>
						<div>
							<style>
							   .texture {height: 30px;width: 30px; margin: 3px;background: #66c;cursor: pointer;}
							</style>
							<div class="presets" class="yui3-g" style="margin-top: 3px;border: 2px solid black; position: relative;">
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u"></div>
								<div class="texture yui3-u" style="text-align: center;background: -moz-linear-gradient(#fff,#ccc);border-left:2px solid black;height:36px;position: absolute;right: 0;top:0;margin:0;">
									<a href="#" style="font-size: 26px;text-decoration: none;color: black;position: relative;top: 5px;">&#9660;</a>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<hr/>
				<div class="border">
					<h4>Border &amp; Spacing</h4>
					<select>
						<option>Select Style</option>
						<option>Solid</option>
						<option>Dotted</option>
						<option>Dashed</option>
						<option>Dotted Solid</option>
					</select>
					<a href="#" style="padding: 0 0 0 1px;font-size: 16px;text-decoration: none;color: black;background-color: #fff;"><input style="background: #f00; width: 16px; height: 16px; border: none;"/>&#9660;</a>
					<input id="borderWidth" type="text" name="borderWidth" style="width: 2em;" class="yui3-spinner-loading"/>
					<br/>
					<span>Rounded Corners:</span> <input id="roundedCorners" type="text" name="roundedCorners" style="width: 2em;" class="yui3-spinner-loading"/>
                    <br/>
                    <span>Padding:</span> <input id="padding" type="text" name="padding" style="width: 2em;" class="yui3-spinner-loading"/>
				</div>
				<hr/>
				<div class="font">
				    <h4>Font</h4>
				    <span>Color: </span>
				    <a href="#" style="padding: 0 0 0 1px;font-size: 16px;text-decoration: none;color: black;background-color: #fff;"><input style="background: #f00; width: 16px; height: 16px; border: none;"/>&#9660;</a>
				    <a href="#" style="padding: 0 5px;border: 1px solid black;-moz-border-radius: 3px;font-size: 16px;text-decoration: none;color: black;font-weight: bold;">B</a>
				    <a href="#" style="padding: 0 5px;border: 1px solid black;-moz-border-radius: 3px;font-size: 16px;text-decoration: none;color: black;font-style: italic;">I</a>
				    <a href="#" style="padding: 0 5px;border: 1px solid black;-moz-border-radius: 3px;font-size: 16px;text-decoration: underline;color: black;">U</a>
				</div>
				<hr/>
				<div class="effects">
				    <h4>Effects</h4>
				    <div>
					    <h6 style="font-style: italic;">Shadow:</h6>
					    <span>Horizontal Offset:</span> <input id="horizontalOffset" type="text" name="horizontalOffset" style="width: 2em;" class="yui3-spinner-loading"/>
					    <br/>
					    <span>Vertical Offset:</span> <input id="verticalOffset" type="text" name="verticalOffset" style="width: 2em;" class="yui3-spinner-loading"/>
					    <br/>
					    <span>Blur Radius:</span> <input id="blurRadius" type="text" name="blurRadius" style="width: 2em;" class="yui3-spinner-loading"/>
					    <br/>
					    <span>Color:</span> <a href="#" style="padding: 0 0 0 1px;font-size: 16px;text-decoration: none;color: black;background-color: #fff;"><input style="background: #f00; width: 16px; height: 16px; border: none;"/>&#9660;</a>
				    </div>
				</div>
			</div>
		</@w.widgetLayout>
	<div id="canvas" class="canvas">	
	
	
	</div>
</body>
<script type="text/javascript">
var Y = YUI(YUI_DEV_CONF);
var YAHOO = null;
Y.use('event','event-custom', 'io', 'json-parse', 'node', 'longtail-spinner', function(Y) {
    Y.on("domready", function()
    {
        // Handle all the methods added during the page construction
    	executeDomReady();
		var borderWidthSpinner = new Y.Spinner({
				srcNode : "#borderWidth",
				min : 0,
				max : 20
			});
		borderWidthSpinner.render();

        var roundedCornersSpinner = new Y.Spinner({
            srcNode : "#roundedCorners",
            min : 0,
            max : 20
        });
        roundedCornersSpinner.render();

        var paddingSpinner = new Y.Spinner({
            srcNode : "#padding",
            min : 0,
            max : 20
        });
        paddingSpinner.render();

        var horizontalOffsetSpinner = new Y.Spinner({
            srcNode : "#horizontalOffset",
            min : 0,
            max : 20
        });
        horizontalOffsetSpinner.render();

        var verticalOffsetSpinner = new Y.Spinner({
            srcNode : "#verticalOffset",
            min : 0,
            max : 20
        });
        verticalOffsetSpinner.render();

        var blurRadiusSpinner = new Y.Spinner({
            srcNode : "#blurRadius",
            min : 0,
            max : 20
        });
        blurRadiusSpinner.render();
    });
});
</script>
	
</html>