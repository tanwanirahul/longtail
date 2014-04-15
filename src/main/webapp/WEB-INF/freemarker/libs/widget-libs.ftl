<#macro widget name class="">
<#local selectedMode>${mode!(modes[0].name)!""}</#local>
<#local widgetDepth>${.globals.widget.depth!1}</#local>
<#local widgetType><#if widgetDepth=="1">leaf<#elseif widgetDepth=="2">column<#elseif widgetDepth=="3">section<#elseif widgetDepth=="4">content-area</#if></#local>
<#if widgetType=="section">


</#if>
<div class="widget-container ${name}-container ${widgetType}-container" id="c_${widgetId}"><#if widgetType=="section"><!-- Section Starts ${selectedMode} --></#if>
<div class="widget ${name}-widget ${selectedMode} ${class} ${widgetType}" id="${widgetId}">
<#nested>
</div>
</div></#macro>

<#macro form el method="Post" returnUrl="${req.currentUrl!}">
	<#if el.elements?has_content>
		<#local formObj = el>
	<#else>	
		<#local formObj = t.load("form",el.formName).widget>
	</#if>
   <#if (req.params.ty)?? && req.params.ty=widgetId>
           <#nested>
   <#else>
   	 <#assign formAction><#if el.action?has_content>${el.action}<#elseif formObj.action?has_content>${formObj.action}<#else>${req.currentUrl}</#if></#assign>
     <#assign formAction = formAction?replace(r"${req.servicesBase}",req.servicesBase) />
     
     <#assign name = el.formName />
     <form id="${widgetId}" class="editable user-form <#list labels as label>${label!} </#list>" method="${method}" action="${formAction}" onsubmit="return H5F.checkValidity(this)">
            <@renderErrors/>
            <input type="hidden" name="widgetId" value="${widgetId}" />
            <input type="hidden" name="returnUrl" value="${returnUrl}" />
            <input type="hidden" name="formName" value="${formObj.formName!}" />
            <input type="hidden" name="category" value="${(req.params.category)!""}"/>
            <#if name == "invitefriends">
                <input type="hidden" name="referredBy" value="${req.isUserLoggedIn?string(req.loggedInUserName, "")}" />
            <#elseif name == "autosignup">
                <input type="hidden" name="InviteCode" value="autosignup" />
            </#if>
            <fieldset>
                <#local fields=formObj.elements>
                <#list fields as f>
                    <@field field=f/>
                </#list>
            </fieldset>
     </form>
    </#if>
</#macro>

<#-- TODO Perhaps this is getting too much for FTL language to handle.
     Need to think about refactoring this to a Java method/library of
     it's own.
-->
<#macro field field>
    <#if field.required?? && field.required>
        <#assign mandatory = "required" />
    <#else>
        <#assign mandatory = "" />
    </#if>

    <#if field.hidden?? && field.hidden=true>
        <#assign hidden = true />
    <#elseif field.fieldType="resetPasswordUserid" || field.fieldType="resetPasswordTime" || field.fieldType="resetPasswordHash">
        <#assign hidden = true />
    <#else>
        <#assign hidden = false />
    </#if>

    <#assign fieldName = (field.label!)?string />

    <div class="field field-${field.fieldType}">
    <#if field.fieldType = "rememberme">
        <input type='checkbox' name='_spring_security_remember_me' checked="checked" />
    </#if>

    <#if !hidden && (field.label)?? && (field.fieldType!="submit")>
        <label for="${fieldName?replace("_"," ")}">${fieldName?replace("_"," ")}<#if mandatory == "required"><span class="mandatory">*</span></#if></label>
    </#if>

    <#if field.fieldType="resetPasswordUserid" && (req.params.id)??>
        <input type="hidden" name="id" value="${req.params.id}"/>
    <#elseif field.fieldType="resetPasswordTime" && (req.params.t)??>
        <input type="hidden" name="t" value="${req.params.t}"/>
    <#elseif field.fieldType="resetPasswordHash" && (req.params.k)??>
        <input type="hidden" name="k" value="${req.params.k}"/>
    <#elseif field.fieldType="comments">
        <textarea rows="3" cols="20" name="${(field.label)!"comments"}" placeholder="${field.placeHolder!""}" ftype="${field.fieldType}" ${mandatory}></textarea>
    <#elseif field.fieldType="google_analytics">
        <input type="hidden" name="path" value="globals.googleAnalyticsProfileId"/>
        <input type="text" name="value" ftype="${field.fieldType}" ${mandatory}></input>
        <p class="validation01"><span class="message">Invalid Format. Example Tracking Code - UA-12198758-1</span></p>
    <#elseif field.fieldType="date">
        <input type="text" name="${(field.label)!"date"}" ftype="${field.fieldType}" ${mandatory} readonly="readonly" size="12"  class="calendar-text" />
        <input type="button" name="${(field.label)!"date"}-btn" class="calendar-btn" />
    <#elseif field.fieldType="numberOfItems">
        <select name="${(field.label)!"numberOfItems"}" ${mandatory}>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
        </select>
    <#elseif field.fieldType="userId">
        <input type="text" name="j_username" />
    <#elseif field.fieldType="email">
        <input type="email" name="${(field.label)!"email"}" ${mandatory} placeholder="${field.placeHolder!""}" />
        <p class="validation01"><span class="message">Please provide a valid email e.g. john@example.com</span></p>
    <#elseif field.fieldType="password">
        <input type="password" name="j_password" pattern=".{5,20}" placeholder="${field.placeHolder!""}"/>
        <p class="validation01"><span class="message">Please enter Password. Should be at least 5 chars long</span></p>
    <#elseif field.fieldType="confirmPassword">
        <input type="password" name="confirmPassword" pattern=".{5,20}" placeholder="${field.placeHolder!""}"/>
        <p class="validation01"><span class="message">Passwords do not match</span></p>
    <#elseif field.fieldType="oldPassword">
        <input type="password" name="oldpassword" placeholder="${field.placeHolder!""}"/>
    <#elseif field.fieldType="inviteCode">
        <input type="text" name="${(field.label)!"inviteCode"}" value="${(req.params.iCode)!""}" ${mandatory}/>
        <!--<p class="validation01"><span class="message">Provide Invitation Code. You can request one if you don't have it already</span></p>-->
    <#elseif field.fieldType="submit">
        <input type="submit" name="submit_action" value="${(field.label)!"Submit"}" class="button" />
    <#elseif field.fieldType="reset">
        <input type="reset" name="reset_action" value="${(field.label)!"Reset"}" class="button"/>
    <#elseif field.fieldType="country">
        <select name="${(field.label)!"country"}" ${mandatory}>
            <option selected="selected" value="1">India</option>
        </select>
    <#elseif field.fieldType="city">
        <select name="${(field.label)!"city"}" ${mandatory}>
            <option selected="selected" value="-1">--Select a City--</option><option value="1">Agartala</option><option value="2">Agra</option><option value="3">Ahmedabad</option><option value="4">Aizwal</option><option value="5">Aligarh</option><option value="6">Allahabad</option><option value="7">Amritsar</option><option value="8">Aurangabad</option><option value="9">Bangalore</option><option value="10">Baroda</option><option value="11">Bhopal</option><option value="12">Bhubaneshwar</option><option value="13">Bokaro</option><option value="14">Chandigarh</option><option value="15">Chennai</option><option value="16">Cochin</option><option value="17">Coimbatore</option><option value="18">Cuttack</option><option value="19">Dehradun</option><option value="20">Delhi</option><option value="21">Dimapur</option><option value="22">Durgapur</option><option value="23">Faridabad</option><option value="24">Gandhinagar</option><option value="25">Ghaziabad</option><option value="26">Goa</option><option value="27">Gurgaon</option><option value="28">Guwahati</option><option value="29">Gwalior</option><option value="30">Hyderabad</option><option value="31">Imphal</option><option value="32">Indore</option><option value="33">Jabalpur</option><option value="34">Jaipur</option><option value="35">Jammu</option><option value="36">Jamnagar</option><option value="37">Jamshedpur</option><option value="38">Jodhpur</option><option value="39">Jullundhar</option><option value="40">Kanpur</option><option value="41">Kolhapur</option><option value="42">Kolkata</option><option value="78">Kolli hills</option><option value="43">Lucknow</option><option value="44">Ludhiana</option><option value="45">Madurai</option><option value="46">Mangalore</option><option value="47">Margaon</option><option value="48">Mumbai</option><option value="49">Mysore</option><option value="50">Nagpur</option><option value="51">Nasik</option><option value="52">Noida</option><option value="54">Panjim</option><option value="53">Patna</option><option value="55">Pondicherry</option><option value="56">Pune</option><option value="57">Raipur</option><option value="60">Rajkot</option><option value="58">Ranchi</option><option value="59">Rourkela</option><option value="61">Salem</option><option value="62">Secunderabad</option><option value="63">Shillong</option><option value="64">Siliguri</option><option value="65">Surat</option><option value="66">Thane</option><option value="67">Thiruvananthapuram</option><option value="68">Tiruchirapalli</option><option value="69">Udaipur</option><option value="70">Varanasi</option><option value="71">Vellore</option><option value="72">Vijaywada</option><option value="73">Vishakapatnam</option><option value="0">Other</option></select>
        </select>
    <#elseif field.fieldType="rating">
        <select name="${(field.label)!"rating"}" ${mandatory}>
            <option value="1">1 of 5</option>
            <option value="2">2 of 5</option>
            <option value="3">3 of 5</option>
            <option value="4">4 of 5</option>
            <option value="5">5 of 5</option>
        </select>
    <#elseif field.fieldType="industry">
        <input type="hidden" name="industry" value="Unknown"/>
    <#elseif field.fieldType="domainSelector">
        <div class="domain-selector">
            <div>
                <input type="radio" name="domain-subdomain-selector" value="subDomain">
                    <input type="text" name="subDomain" value=""/>
                    <span>.${req.siteDomain}</span>
                </input>
            </div>
            <div class="separator">
            OR
            </div>
            <div>
                <input type="radio" name="domain-subdomain-selector" value="domain">
                    <span>www.</span><input type="text" name="domain" value="mydomain.com"/>
                </input>
            </div>
        </ul>
        </div>
    <#elseif field.fieldType="template">
        <input type="hidden" name="template" ${mandatory}/>
        <div id="templateSelector" class="selector-div">

        </div>
    <#elseif field.fieldType="captcha">
        <div class="captcha">
            <img src="http://www.holidayiq.com/CaptchaSecurityImages.php?width=200&height=55&characters=6" />
            <br></br>
            <input type="text" name="captcha_input" size="10"/>
            <input TYPE="hidden" NAME="captcha_actual" value="">
        </div>
    <#elseif field.fieldType != "rememberme">
        <input type="text" name="${(field.label)!field.fieldType}" ftype="${field.fieldType}" ${mandatory} placeholder="${field.placeHolder!""}" />
    </#if>
    <#if field.helpText?? >
        <div class="help-text">
            ${field.helpText}
        </div>
    </#if>
    </div>
</#macro>

<#macro css files>
    <#if req.resourceConsolidator.canMergeResources() == true >
        <#assign queryString=""/>
        <#list files as file>
            ${req.resourceConsolidator.verifyResourcesExist("${file}")}

            <#if queryString == "">
                <#assign queryString="${file}"/>
            <#else>
                <#assign queryString="${queryString};${file}"/>
            </#if>

        </#list>
        <link rel="stylesheet" type="text/css" href="${req.staticBase}/merged/css?files=${queryString}"/>
    <#else>
        <#list files as file>
            <link rel="stylesheet" type="text/css" href="${req.staticBase}/${file}"/>
        </#list>
    </#if>
</#macro>

<#macro js files>
    <#if req.resourceConsolidator.canMergeResources() == true >
        <#assign queryString=""/>
        <#list files as file>
            ${req.resourceConsolidator.verifyResourcesExist("${file}")}

            <#if queryString == "">
                <#assign queryString="${file}"/>
            <#else>
                <#assign queryString="${queryString};${file}"/>
            </#if>

        </#list>
        <script type="text/javascript" src="${req.staticBase}/merged/js?files=${queryString}"></script>
    <#else>
        <#list files as file>
            <script type="text/javascript" src="${req.staticBase}/${file}"></script>
        </#list>
    </#if>
</#macro>

<#macro selectFontFamily name class="" style="" title="">
    <select name="${name}" class="${class}" style="${style}" title="${title}">
        <option>Select a Font</option>
        <#list accessor.fetch("fonts","") as f>
          <option>${f.family}</option>
        </#list>
    </select>
</#macro>

<#macro renderPagination page targetId targetUrl filters=[] context=[] heading="">
  <#assign pages = (page.total/page.pageSize + 1)?floor/>
  <div class="list-pagination" data-target="${targetId}" data-url="${targetUrl}">
    <div class="heading">
      <#if heading?has_content>${heading}<#else>Total ${page.total}</#if>
      &nbsp;|&nbsp;
      <#assign startItemIndex = page.page * page.pageSize + 1 />
      <#assign endItemIndex = (page.page + 1) * page.pageSize />
      <#if (endItemIndex > page.total)><#assign endItemIndex = page.total /></#if>
      Showing ${startItemIndex}-${endItemIndex} of ${page.total}
    </div>
    <div class="tags-list">
      <#if filters?has_content>
        <div class="tag-group">
          <#list filters as f><#--
            --><#if req.params.filters?? && req.params.filters == f><#--
              --><span  class="tag-item <#if !f_has_next>last</#if>">${f?capitalize}</span><#--
            --><#else><#--
              --><a href="${targetUrl}&ps=${page.pageSize}&pn=0&filters=${f}&context=${req.params.context!}" class="tag-item <#if !f_has_next>last</#if>">${f?capitalize}</a><#--
            --></#if><#--
          --></#list>
        </div>
      </#if>
      <#if context?has_content>
        <div class="tag-group">
          <#list context as c><#--
            --><#if req.params.context?? && req.params.context == c><#--
              --><span class="tag-item <#if !c_has_next>last</#if>">${c?capitalize}</span><#--
            --><#else><#--
              --><a href="${targetUrl}&ps=${page.pageSize}&pn=0&filters=${req.params.filters!}&context=${c}" class="tag-item <#if !c_has_next>last</#if>">${c?capitalize}</a><#--
            --></#if><#--
          --></#list>
        </div>
      </#if>
    </div>
    <div class="page-links">
      <#if (pages > 1)>
        <#list page.pageLinks as p>
          <#if prev?? && p.pageNo - prev.pageNo &gt; 1>...</#if>
          <#if p.pageNo == page.page>
            <span>${p}</span>
          <#else>
            <#if !(req.params.filters)??>
              <a href="${targetUrl}&ps=${page.pageSize}&pn=${p.pageNo}&context=${(req.params.context)!}">${p.text}</a>
            <#else>
              <a href="${targetUrl}&ps=${page.pageSize}&pn=${p.pageNo}&filters=${(req.params.filters)!}&context=${(req.params.context)!}">${p.text}</a>
            </#if>
          </#if>
          <#assign prev = p/>
        </#list>
      </#if>
    </div>
  </div>
</#macro>

<#macro renderElement element>
  <#if element.class.simpleName == "TextDataItem">
    <div id="${element.uuid}" data-type="TextDataItem" class="editable rich-text">${element.itemValue}</div>
  <#elseif element.class.simpleName == "FormDataItem">
    <#assign formName>${t.required("formName")!element.formName}</#assign>
    <@w.form name=formName>
        </@w.form>
  </#if>
</#macro>

<#function getPath path dim="" tn=false>
  <#assign imagePath = ""/>
  <#if tn && path?index_of("libs/images/") != -1>
    <#assign imagePath="${req.imageServer}${dim}${path?replace('.*libs/images','','r')}"/>
  <#elseif path?starts_with("http://")>
    <#assign imagePath=path/>
  <#elseif path?starts_with("/static")>
    <#assign imagePath="${req.staticBase}/${path?replace('/static/','')}"/>
  <#else>
    <#assign imagePath="${req.staticBase}/${path}"/>
  </#if>

  <#return imagePath/>
</#function>

<#function extractImage css dim="" tn=false>
  <#assign res = css?matches(".*url([^;]*).*")/>
  <#if res>
    <#assign image = res?groups[1]?replace('[\'\"\\(\\) ]','','r')/>
    <#return getPath(image, dim, tn)/>
  <#else>
    <#return "Didn't Match " + css/>
  </#if>
</#function>

<#function editUrl site>
	<#return "http://${site.domain}/${req.editPath}/"/>
</#function>

<#macro renderErrors>
  <#if (req.params.errors)??>
    <ul class="errors">
      <#if req.params.errors?index_of("icode") != -1>
        <li>Please provide a valid invite code. Don't have one ? You can request one now &#8594;</li>
      <#elseif req.params.errors?index_of("alreadyExists") != -1>
        <li>An account already exists with that email id. Did you already register ? You can try logging in <a href="${req.navBase}/login">here</a></li>
      <#elseif req.params.errors?index_of("login") != -1>
        <li>Invalid email or password. <a href="${req.navBase}/forgot-password/">Forgot your password ?</a></li>
      <#elseif req.params.errors?index_of("preservedSubDomain") != -1>
        <li>The domain name is already in use. Please select another</li>
      <#elseif req.params.errors?index_of("noid") != -1>
        There was a problem with your request<br/>
        We're sorry. We weren't able to identify you given the information provided.
      <#elseif req.params.errors?index_of("invalidDomain") != -1>
        The URL should contain only letters and alphabets. It should be of at least 6 characters. 
      </#if>
    </ul>
  </#if>
</#macro>

<#macro renderHeaderFragment header cssId="">
  <#if header.cssTags?has_content>
    <style type="text/css" <#if cssId?has_content>id="${cssId}"</#if>>
    ${header.cssTags}
    </style>
  </#if>

  <#if header.cssLinks?has_content>
    <#list header.cssLinks as l>
      ${l}
    </#list>
  </#if>

  <#if header.scriptTag?has_content && header.scriptTag?length gt 0>
    <script type="text/javascript">
      ${header.scriptTag}
    </script>
  </#if>
</#macro>

<#macro adminPageHeader heading>
  <div class="admin-page-header">
    <h1 class="admin-page-heading">${heading}</h1>
  </div>
</#macro>

<#macro renderSwatch p type pageSize filters>
<#assign filterClass = "" />
<#if !(req.params.filters)??>
  <#assign filterClass = "General" />
<#else>
  <#assign filterClass = req.params.filters />
</#if>

<div class="yui3-u yui3-u-1-${pageSize!10}" <#if (filters)?? && filters == "Navigation">style="text-align: center;"</#if>>
          <div class="swatch-container">
            <#if type == "content-image">
              <div class="yui3-dropdown-item preview-swatch ${type}-Swatch" data-csstext="src:${w.getPath(p.path)}"
                  title="Click to select this Image" onclick="Y.fire('custom:css', {node: this, css: {src : '${w.getPath(p.path)}'}})"/>
                <img src="${w.getPath(p.path, 'w100-h70', true)}" />
              </div>
            <#else>
              <#assign qName = cssUtils.getClassName(p)/>
              <#assign cssText = cssUtils.toCssText(p)/>
              <style type="text/disabled-css">
                ${cssText}
              </style>
              <#if (filters)?? && filters == "Navigation">
                <ul data-uuid="${qName}" class="yui3-dropdown-item preview-swatch ${type}-Swatch ${filterClass}-Swatch ${qName} yui3-g">
                  <li class="link yui3-u selected"><a href="#">Home</a></li><li
                      class="link yui3-u"><a href="#">About</a></li><li
                      class="link yui3-u"><a href="#">Contact</a></li>
                </ul>
              <#elseif (filters)?? && filters == "Forms">
                <div data-uuid="${qName}" class="yui3-dropdown-item preview-swatch ${type}-Swatch ${filterClass}-Swatch ${qName} user-form">
                  <fieldset>
                    <div class="field field-name">
                      <label>Name<span class="mandatory">*</span></label>
                      <input type="text" name="Name" placeholder="Dummy Name" value="">
                      <div class="help-text">Enter your full name</div>
                    </div>
                    <div class="field field-submit">
                      <input type="submit" value="Submit" class="button">
                    </div>
                  </fieldset>
                </div>
              <#elseif (filters)?? && filters == "Table">
                <table data-uuid="${qName}" class="yui3-dropdown-item preview-swatch ${type}-Swatch ${filterClass}-Swatch ${qName}">
                  <thead>
                    <tr><th></th><th></th><th></th></tr>
                  </thead>
                  <tbody>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                  </tbody>
                </table>
              <#else>
                <div data-uuid="${qName}" class="yui3-dropdown-item preview-swatch ${type}-Swatch ${filterClass}-Swatch ${qName}"></div>
              </#if>
            </#if>
          </div>
        </div>
</#macro>


