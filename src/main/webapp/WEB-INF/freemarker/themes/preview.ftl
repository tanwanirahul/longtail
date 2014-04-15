<html>
<head>
<link rel="stylesheet" type="text/css" href="/static/css/base.css"/>
<style>
  .theme-preview { width: 300px; height: 200px; text-align: center; display: inline-block; overflow: hidden; background-color: #3D4D6D; position: relative; }
  .theme-preview:after { content: ""; height: 200px; width: 0; display: inline-block; vertical-align: middle; }
  .theme-div { margin: 0 auto; display: inline-block; vertical-align: middle; }
  .typography-preview { font-size: 8px; height: 350px; text-align: left; width: 450px; }
  .button-div { font-size: 36px; }
  .navigation-preview { height: 50px; padding: 10px 5px; width: 340px; }
  .navigation-div { display: block; }
  .forms-preview { height: 300px; width: 300px; }
  .forms-div { background-color: #DDDDDD; margin: 15px auto; padding: 5px 20px 10px; text-align: left; }
  .widget-div { margin: 0 20px; text-align: left; }
  body { width: 960px; }
  #layoutArea { min-height: 0; }
</style>
<#list styles as style>
  <@w.renderHeaderFragment header=style cssId="themeStylesCss"/>
</#list>
</head>
<body>
<#list themes as theme>
	<div class="theme-preview ${theme.attributes.tags}-preview" onclick="window.location='?theme=${theme.name}'">
      <div id="${theme.name?replace(" ","")}" class="theme-div ${theme.attributes.tags}-div">
        <@preview theme=theme />
      </div>
    </div>
</#list>
</body>

<#macro preview theme>
  <#if theme.attributes.tags == "typography">
    <div class="canvas" style="background-color: #DDDDDD; font-size: 1.5em; margin: 10px; padding: 5px 10px;">
      <div class="heading-1">Page Title</div>
      <div class="heading-2">Secondary Page Title</div>
      <div class="heading-3">Section Heading</div>
      <div class="heading-4">Secondary Section Heading</div>
      <div class="heading-5">Sub-section Heading</div>
      <div class="heading-6">Subtitle</div>
      <div class="normal-text">
        Paragraph. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
        aliquip ex ea commodo consequat.
      </div>
    </div>
  <#elseif theme.attributes.tags == "button">
    <a href="#" class="button">Button</a>
  <#elseif theme.attributes.tags == "navigation">
    <ul class="el-navigation-data-item yui3-g">
      <li class="link yui3-u selected"><a href="#">Home</a></li>
      <li class="link yui3-u"><a href="#">About</a></li>
      <li class="link yui3-u"><a href="#">Contact</a></li>
    </ul>
  <#elseif theme.attributes.tags == "widget">
    <div class="el-leaf-widget el-widget-instance">
     <div class="editable rich-text"><div class="heading-4">Lorum ipsum</div></div>
      <div class="editable rich-text">Lorum ipsum dolor amit pnue lask pais iuas aosw paksle lskahbas aks ap.</div>
    </div>
   <#elseif theme.attributes.tags?lower_case == "color">
    <div class="canvas" style="width: 300px">
      <div class="layoutArea" style="width: 220px; margin: 0 auto; text-align: left;">
        <div class="header">
          <div id="siteNameText" style="font-size: 1.2em; padding: 8px 10px 0; text-align: right;">Site Name</div>
          <ul class="el-navigation-data-item yui3-g" style="font-size: 85%; margin: 0 2px; padding: 30px 0 0; text-align: center;">
            <li class="yui3-u selected" style="margin: 3px; padding: 2px 3px;">Home</li>
            <li class="yui3-u" style="margin: 3px; padding: 2px 3px;">About</li>
            <li class="yui3-u" style="margin: 3px; padding: 2px 3px;">Contact</li>
          </ul>
        </div>
        <div class="content-area">
      <div class="section" style="height: 120px; margin: 5px 10px;">
        <div class="column">
          <div class="el-widget-instance">
            <div class="heading-3" style="font-size: 1.1em; margin: 0 0 4px;">Heading</div>
            <div class="normal-text" style="font-size: 0.9em; line-height: 1.4;">
              Lorum ipsum dolor amit pnue lask pais iuas aosw paksle lskahbas aks ap. Oasi ysioa oso ua us.
            </div>
            <div style="text-align: right;"><button class="button" style="font-size: 0.9em; margin: 10px 0;">Select</button></div>
          </div>
        </div>
      </div>
        </div>
      </div>
    </div>
  <#elseif theme.attributes.tags == "forms">
    <form class="user-form">
      <fieldset>
        <div class="field field-name">
          <label for="Name">Name<span class="mandatory">*</span></label>
          <input type="text" name="Name" ftype="name" required="">
          <div class="help-text">Enter your full name</div>
        </div>
        <div class="field field-comments">
          <label for="Comments">Comments<span class="mandatory">*</span></label>
          <textarea rows="2" cols="30" name="Comments" ftype="comments" required=""></textarea>
          <div class="help-text">Enter your comments/feeback</div>
        </div>
        <div class="field field-submit">
          <input type="submit" value="Submit" class="button">
        </div>
      </fieldset>
    </form>
  <#elseif theme.attributes.tags == "table">
    <table>
      <thead>
        <tr><th>#</th><th>Name</th><th>Profile</th></tr>
      </thead>
      <tfoot>
        <tr><td>Total</td><td></td><td>End of Table</td></tr>
      </tfoot>
      <tbody>
        <tr><td>1</td><td>Arjun</td><td>Student</td></tr>
        <tr><td>2</td><td>Brijesh</td><td>Developer</td></tr>
        <tr><td>3</td><td>Chetan</td><td>Manager</td></tr>
        <tr><td>4</td><td>Deepak</td><td>Unemployed</td></tr>
      </tbody>
    </table>
  </#if>
</#macro>
</html>