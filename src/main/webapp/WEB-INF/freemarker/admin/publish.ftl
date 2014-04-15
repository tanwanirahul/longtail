<div class="yui3-g" id="publishForm">
  <script>
    function recalculatePrice()
    {
      var form = document.forms['upgradePlanForm'];
      var duration = parseInt(form['duration'].options[form['duration'].selectedIndex].value, 10);
      var price = form['plan'].selectedIndex == 0 ? 195 : 395;
      var oneTime = form['plan'].selectedIndex == 0 ? 0 : 8000;
      document.getElementById('totalBill').innerHTML = 'Rs. ' + (oneTime + duration * price);
    }

    function init() {
        document.getElementsByTagName('input')[5].focus();
    }
    window.onload = init; 
  </script>

  <#if req.user.membership == "Trial" && !req.user.requests?seq_contains("Upgrade")>
    <div class="yui3-u-1" style="font-size: 1.1em;">
      You are currently signed up for a trial account.
      Submit the form below to upgrade to Basic plan and launch your web-site.
    </div>
  <#elseif (req.user.requests)?? && req.user.requests?seq_contains("Upgrade")>
    <div class="yui3-u-1" style="font-size: 1.1em;">
      You have an upgrade plan request under process!
    </div>
  <#elseif (req.user.membership)?? || req.user.membership != "Trial">
    <div class="yui3-u-1" style="font-size: 1.1em;">
      You are already enrolled to a pricing plan. Please <a href="/contact">contact us</a>,
      if you need any further assistance with your pricing plan.
    </div>
  </#if>

  <#if (!(req.user.membership)?? || req.user.membership == "Trial" && !req.user.requests?seq_contains("Upgrade")) || req.user.membership == "SuperAdmin">
    <h3 class="yui3-u-1">Upgrade Your Plan and Launch Site</h3>
    <form name="upgradePlanForm" action="${req.servicesBase}/site/publish" method="POST" onsubmit="return H5F.checkValidity(this)" class="admin-page-form">
      <input type="hidden" name="widgetId" value="${widgetId}" />
      <input type="hidden" name="returnUrl" value="${req.currentUrl}?site=${(req.params.site)!}" />
      <input type="hidden" name="formName" value="upgrade-plan" />
      <input type="hidden" name="site" value="${(req.params.site)!}" />
      <input type="hidden" name="Email" value="${(req.user.userName)!}" />
  
      <div class="field yui3-u-1">
        <@w.renderErrors/>
      </div>
  
      <div class="field">
        <label for="url" class="yui3-u-1-3">URL</label>
        <span class="yui3-u-2-3">
          <input type="text" name="subDomain" pattern="[0-9a-zA-Z-_]{6,15}" placeholder="6 or more letter site name"
              style="width: 200px; text-align: right;padding:1px 2px;"/>.designoncloud.com</span>
        <span class="help-text yui3-u-1">URL on designoncloud.com. Provided Free of cost.</span>
      </div>
  
      <div class="field">
        <label for="plan" class="yui3-u-1-3">Plan</label>
        <select name="plan" size="2" class="yui3-u-2-3" onchange="recalculatePrice()">
          <option value="Basic" selected="selected">Basic Plan (Rs. 195 per month)</option>
          <option value="Premium">Premium Plan (Rs. 8000 one time + Rs. 395 per month)</option>
        </select>
        <span class="help-text yui3-u-1">Select premium plan if you want our design experts to create your website for you.</span>
      </div>
  
      <div class="field">
        <label for="duration" class="yui3-u-1-3">Duration</label>
        <select name="duration" size="6" class="yui3-u-2-3" onchange="recalculatePrice()">
          <option value="1">Monthly Subscription</option>
          <option value="6">6 months</option>
          <option value="12" selected="selected">1 year (Recommended)</option>
          <option value="24">2 years</option>
          <option value="36">3 years</option>
        </select>
        <span class="help-text yui3-u-1">Select 1 year or more to get a FREE custom domain name</span>
      </div>
  
      <div class="field">
        <label for="plan" class="yui3-u-1-3" onchange="recalculatePrice()">Do you want a custom Domain?</label>
        <span class="yui3-u-2-3">
          <input type="radio" name="customDomain" checked="checked" value="yes" /> Yes
          <input type="radio" name="customDomain" value="no" style="margin-left: 20px;" /> No
        </span>
        <span class="help-text yui3-u-1">(Free with a year or longer plan)</span>
      </div>
  
      <div class="field yui3-u-1" style=" margin: 30px 15px 30px;">
        <span style="font-size: 1.3em; margin-left: 33.333%;">Total Billing Amount <span id="totalBill">Rs. 2340</span></span>
        <br/>
        <span class="help-text">(The amount is indicative and will be charged after a telephonic confirmation)</span>
      </div>
  
      <div class="field yui3-u-1">
        <input class="button" type="submit" value="Upgrade and Launch Site" style="margin-left: 33.333%;" />
        <a href="javscript:cancel">Cancel</a>
        <br/>
        <span class="help-text">
          Our sales representative will get in touch to make sure the plans you selected
          are suitable for your needs and walk you through the payment process.
        </span>
      </div>
    </form>
  </#if>
</div>
