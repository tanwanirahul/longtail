<div id="claimForm">
	   	<form action="${req.servicesBase}/site/claim" class="ajax-form" method="POST" style="width: auto;" onsubmit="return H5F.checkValidity(this)">
	   	    <style>
	   	     label {text-align: right;}
	   	     input {border: 0;}
	   	    </style>
			<fieldset class="yui3-g">
				<p class="yui3-u-1">Please provide your email id and a password to start editing.</p>
				<p class="yui3-u-1" style="font-size: 0.85em;margin-bottom: 10px;color: #999;">(Unless you provide your email id and claim it, anyone with access to the unique URL
				can put a claim on it and start editing.)</p>
			
				<label for="Email" class="yui3-u-1-3">Email : </label>
				<input type="Email" class="yui3-u-2-3"  name="Email" />
				
				<label for="j_password" class="yui3-u-1-3">Password : </label>
				<input type="password" class="yui3-u-2-3" name="j_password" />
				
				<label for="password" class="yui3-u-1-3">Verify Password : </label>
				<input type="password" class="yui3-u-2-3" name="password" />
				
				<input type="hidden" class="yui3-u-2-3" name="InviteCode" value="hashedin"/>
				
				<input type="submit" style="padding: 5px;margin-top: 10px;float: right;" value="Claim this Site">
				
			</fieldset>
		</form>
</div>