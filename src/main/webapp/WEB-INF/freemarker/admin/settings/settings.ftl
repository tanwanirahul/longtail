<#assign form=JspTaglibs["/WEB-INF/spring-form.tld"]>

<@form.form modelAttribute="dataItem" action="${req.servicesBase}/data/update" class="ajax-form data-update-form" method="POST">

	<input type="hidden" name="uuid" value="${req.dataItem.uuid}"/>
	<input type="hidden" name="refresh" value="${req.dataItem.uuid}"/>
	
	
	<label for="thankYou">Thank You Message</label><br/>
	<@form.textarea path="thankYou"/><br/>

	<label for="emailSubject">Email Subject</label><br/>
	<@form.textarea path="emailSubject"/><br/>
	
	<label for="emailTemplate">Email Template</label><br/>
	<@form.textarea path="emailTemplate"/><br/>
	
	<label for="formName">Change Form</label><br/>
	<@form.select path="formName">
		<#list req.forms as f>
			<@form.option value=f.name/>
		</#list>
	</@form.select><br/>
	
	<input type="submit" value="Save"/>
    <input type="submit" value="Cancel" class="exit"/>
	
</@form.form>