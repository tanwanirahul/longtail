<#include "/widgets/page/header.ftl"/>
<script>
	var cssOptions = {border : [], bg : [], bgImage : [], effects : [], gradient: []};
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid',  'borderWidth': '1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'dotted', 'borderWidth': '1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'dashed', 'borderWidth': '1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'double', 'borderWidth': '3px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'groove', 'borderWidth': '3px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'ridge',  'borderWidth': '3px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'inset',  'borderWidth': '3px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'outset', 'borderWidth': '3px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '1px 0px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '0px 1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '0px 0px 1px 1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '1px 1px 0px 0px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '1px 1px 1px 0px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '1px 1px 0px 1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '1px 0px 1px 1px'});
	cssOptions['border'].push({'borderColor':'black', 'borderStyle':'solid', 'borderWidth': '0px 1px 1px 1px'});

	cssOptions['bg'].push({'backgroundColor':'transparent'});
	cssOptions['bg'].push({'backgroundColor':'rgb(255,100,100)'});
	cssOptions['bg'].push({'backgroundColor':'rgb(100,255,100)'});
	cssOptions['bg'].push({'backgroundColor':'rgb(100,100,255)'});
	cssOptions['bg'].push({'backgroundColor':'rgb(255,255,100)'});
	cssOptions['bg'].push({'backgroundColor':'rgb(255,100,255)'});
	cssOptions['bg'].push({'backgroundColor':'rgb(100,255,255)'});

	cssOptions['gradient'].push({'backgroundImage':'none'});
	
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(90deg, rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(90deg, rgba(0,0,0,0), rgba(0,0,0,0.5))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(90deg, rgba(0,0,0,0), rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(90deg, rgba(0,0,0,0.5), rgba(0,0,0,0), rgba(0,0,0,0.5))'});

	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(-90deg, rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(-90deg, rgba(0,0,0,0), rgba(0,0,0,0.5))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(-90deg, rgba(0,0,0,0), rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(-90deg, rgba(0,0,0,0.5), rgba(0,0,0,0), rgba(0,0,0,0.5))'});

	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(0deg, rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(0deg, rgba(0,0,0,0), rgba(0,0,0,0.5))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(0deg, rgba(0,0,0,0), rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(0deg, rgba(0,0,0,0.5), rgba(0,0,0,0), rgba(0,0,0,0.5))'});

	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(180deg, rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(180deg, rgba(0,0,0,0), rgba(0,0,0,0.5))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(180deg, rgba(0,0,0,0), rgba(0,0,0,0.5), rgba(0,0,0,0))'});
	cssOptions['gradient'].push({'backgroundImage':'-moz-linear-gradient(180deg, rgba(0,0,0,0.5), rgba(0,0,0,0), rgba(0,0,0,0.5))'});

	cssOptions['bgImage'].push({'backgroundImage':'none'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/wood/S_S_WOOD-parisot.jpg)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/wood/S_S_WOOD-bois14.jpg)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/fabric/S_S_Crpet1_t.jpg)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/wood/S_S_Wood18l.JPG)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/misc/S_S_CraftPaper.JPG)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/wood/S_S_Wood28l.JPG)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/wood/S_S_Crdbrd_t.jpg)'});
	cssOptions['bgImage'].push({'backgroundImage':'url(http://textures.forrest.cz/textures/library/wood/S_S_Pine_t.jpg)'});

	cssOptions['effects'].push({'boxShadow':'none'});
	cssOptions['effects'].push({'boxShadow':'3px 3px 6px #000'});
	cssOptions['effects'].push({'boxShadow':'3px 3px 6px #CCC'});
	cssOptions['effects'].push({'boxShadow':'6px 6px 6px #000'});
	cssOptions['effects'].push({'boxShadow':'6px 6px 0px #000'});
</script>

<style>
  #cssForm {background: #EEE;width: auto;padding: 0;margin: 0;fontSize: 12px;}
  #cssForm .yui3-tab {display: block; background: #CCC;}
  #cssForm .yui3-tab-selected {background: #EEE;}
  #cssForm .yui3-tabview-list {display: inline-block;vertical-align: top;}
  #cssForm .yui3-tabview-panel {position: absolute; left: 150px; right: 0; top: 0;}
  .options {width: 50%;}
  .configuration {width: 50%;}
  .content-area {width: 100%;}
  #testArea {margin: 100px;}
  input[type=px]{width: 30px;text-align: right;}
  input[type=color]{height:20px; width: 20px; color: transparent;border: 1px solid black;cursor: pointer;background-color: transparent;}
  label[for=top] {display: block;margin-top: 20px;}
  .border-option{height: 40px;width: 40px;cursor: pointer;margin-bottom: 20px;border: 1px solid black; display: inline-block;margin: 10px;}
  .bg-option{height: 40px;width: 40px; display: inline-block; cursor: pointer;margin: 0 10px 10px 0;border: 1px solid black;}
  .bgImage-option{height: 40px;width: 40px; display: inline-block; cursor: pointer;margin: 0 10px 10px 0;border: 1px solid black;}
  .gradient-option, .effects-option{height: 40px;width: 40px; border: 1px solid black; display: inline-block; cursor: pointer;margin: 0 10px 10px 0;}
  .gradient-option { background-color: #fff;}
  
  .test-widget {border: 3px solid gray; padding: 20px; background-color: #ffeecc; width: 600px;}
  #layoutArea {width: 100%;}
  .tabs > * {padding: 0;}
  
  #backgroundStyles h3 {width: 100px;position: absolute;display: none;}
  .border-options, .bg-options, .bgImage-options, .gradient-options {overflow: hidden;height: 50px;background-color: white;padding: 4px 20px;border: 1px solid black;}
  .border-options {height: 150px;}
  .bg-options:HOVER, .bgImage-options:HOVER, .gradient-options:HOVER, .border-options:HOVER {overflow: visible;height: auto;}
  
</style>
<div id="topNavBar" class="tabs">
	<ul>
		<li><a href="#styles">Style Settings</a></li>
		<li><a href="#typography">Typography</a></li>
	</ul>
	<div>
		<div id="styles">
			<#include "/overlays/optionsCssForm.ftl"/>
		</div>
		<div id="typography">
			<form id="typoForm" onsubmit="return false" class="css-style-form">
				<input type="hidden" name="selector" value=".content-area h1, .content-area h2, .content-area h3, .content-area h4, .content-area h5, .content-area h6, .content-area .title"/>
				<div class="field">
				Headings : <select name="fontFamily">
					<option>Select a Heading Font</option>
					<option>Droid Sans</option>
					<option>Yanone Kaffeesatz</option>
					<option>Droid Serif</option>
					<option>Lobster</option>
					<option>Nobile</option>
					<option>Reenie Beanie</option>
					<option>Tangerine</option>
					<option>Josefin Slab</option>
					<option>PT Sans</option>
					<option>Molengo</option>
					<option>OFL Sorts Mill Goudy TT</option>
					<option>Vollkorn</option>
					<option>Neucha</option>
					<option>Cantarell</option>
					<option>Inconsolata</option>
					<option>Crimson Text</option>
					<option>Cardo</option>
					<option>Cuprum</option>
					<option>Ubuntu</option>
					<option>Droid Sans Mono</option>
					<option>Neuton</option>
					<option>Just Me Again Down Here</option>
					<option>Old Standard TT</option>
					<option>Philosopher</option>
				</select>
				</div>
					Font Size <input type="px" name="fontSize"><br/>
					Line Height <input type="em" name="lineHeight"><br/>
					Word Spacing <input type="em" name="wordSpacing"><br/>
					Letter Spacing <input type="em" name="letterSpacing"><br/>
					Text Transform <br/>
					<input type="radio" name="textTransform" value="none"> None
					<input type="radio" name="textTransform" value="capitalize"> Capitalize
					<input type="radio" name="textTransform" value="uppercase"> Uppercase
					<input type="radio" name="textTransform" value="lowercase"> Lowercase<br/>
					
					Font Style <br/>
					<input type="radio" name="fontStyle" value="none"> None
					<input type="radio" name="fontStyle" value="bold"> Bold
					<input type="radio" name="fontStyle" value="italic"> Italics
					<br/>
					Color <input type="color" name="color">
				</div>
			</form>
		</div>
	</div>
</div>

<div class="content-area">
	<div id="testArea">
	<@w.widget name="test">
		${t.title()}
		${t.text("article",{})}
	</@w.widget>
	</div>

</div>

<#include "/widgets/page/footer.ftl"/>
<script type="text/javascript" src="${req.staticBase}/js/CSSStyler.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/longtail-form.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/multi-overlay.js"></script>
<script type="text/javascript" src="${req.staticBase}/js/edit.js"></script>
<script>
Y.use("node", "event","longtail-form","css-styler-form","longtail-multi-overlay", function(Y)
{
	Y.on("domready", function(){
		var template = Y.one(".test-widget");
		Y.longtail.CSSStyler.setCurrent(template, "#cssForm");
		Y.delegate("click", function(e){ EditInterface.colorChoose(e.target);}, "body", "input[type=color]");
		Y.delegate("change", function(e){ e.currentTarget.setStyle(e.get("value"));}, "body", "input[type=color]");

		var multiFormSet = function(e, styles)
		{
			Y.longtail.forms.setValues("#cssForm", styles);
			for(var i in styles)
			{
				Y.longtail.CSSStyler.change(i, styles[i]);
			}
		}

		for(var i in cssOptions)
		{
			var specificOptDiv = Y.one("." + i + "-options");
			for(var j in cssOptions[i])
			{
				var sample= Y.Node.create("<div class='" + i + "-option'></div>");
				var styles = cssOptions[i][j];
				sample.setStyles(styles);
				for(var k in styles)
				{
					Y.longtail.CSSStyler.setValue(sample, k, styles[k]);
				}
				sample.on("click",multiFormSet,null,styles); 
				specificOptDiv == null ? console.log("Errors : Didn't find div " + i) : specificOptDiv.append(sample);
			}
		}
	});
});

function increment(id, change)
{
	var input = Y.one("#" + id);
	var value = input.get("value");

	if(value != null && value.indexOf("rgb") == 0)
	{
		value = value.replace(/.*rgb[a]*\((.*)\).*/g,'$1').split(",");

		if(value.length < 4)
		{
			value.push("1");
		}

		value[3] = Math.min(parseFloat(value[3]) + change, 1);
		var newColor = "rgba(" + value[0] + "," + value[1] + "," + value[2] + "," + value[3] + ")";
		console.log(newColor);
		input.set("value", newColor);
	}else
	{
		value = parseInt(value, 10);
		if(isNaN(value))
		{
			value = 0;
		}
		var newValue = value + change;
		input.set("value", newValue);
	}
	
	input.simulate("change"); 
	return false;
}





</script>