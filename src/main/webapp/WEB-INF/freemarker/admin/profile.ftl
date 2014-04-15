<@w.adminPageHeader heading="Profile" />

<#if req.user?? && req.user?has_content>
  <#assign user = req.user />
<#else>

</#if>
<div class="yui3-g" style="margin: 25px 0 70px;">
  <div class="yui3-u-3-4">
    <form name="userProfile" action="${req.servicesBase}/user/profile" method="POST" onsubmit="return H5F.checkValidity(this)"
        class="admin-page-form" style="margin-right: 25px;">
      <input type="hidden" name="widgetId" value="${widgetId}" />
      <input type="hidden" name="returnUrl" value="${req.currentUrl}" />
      <input type="hidden" name="formName" value="user-profile" />

      <div class="field yui3-u-1">
        <@w.renderErrors/>
      </div>

      <div class="field account-type-field">
        <label for="membership" class="yui3-u-1-3">Account Type
        </label><span class="yui3-u-2-3">
          <span class="account-type">${(user.membership!'Trial')?upper_case}</span>
          <#if req.user.membership == "Trial" && !req.user.requests?seq_contains("Upgrade")>
            &nbsp;&nbsp; <a href="/lt_admin/publish?site=${(req.params.site)!}">Upgrade</a>
          </#if>
        </span>
        <span class="help-text yui3-u-1">
          <#if req.user.membership == "Trial" && !req.user.requests?seq_contains("Upgrade")>
            Upgrade to Basic plan to launch your web-site.
          <#elseif (req.user.requests)?? && req.user.requests?seq_contains("Upgrade")>
            You have an upgrade plan request under process!
          </#if>
        </span>
      </div>

      <div class="field">
        <label for="userName" class="yui3-u-1-3">Name
        </label><span class="yui3-u-2-3">
          <input type="text" name="fullName" value="${user.fullName!}"
              placeholder="First Name                Middle Name                Last Name" style="width: 90%;" />
        </span>
        <span class="help-text yui3-u-1">Enter your full name (first name, middle name, last name)</span>
      </div>

      <div class="field">
        <label for="username" class="yui3-u-1-3">Username
        </label><span class="yui3-u-2-3">
          <input type="email" name="userName" value="${user.userName!}" disabled="disabled" style="width: 50%;" />
          <#if !user.verified>
            <span style="margin-left: 15px; color: #DD0000; font-style: italic; font-weight: bold;">UNVERIFIED</span>
            <a href="#" style="font-size: 0.9em; margin-left: 10px;">Verify Now</a>
          <#else>
            <span style="margin-left: 15px; color: #006600; font-style: italic; font-weight: bold;">VERIFIED</span>
          </#if>
        </span>
        <span class="help-text yui3-u-1">Username for logging into DesignOnCloud, which is same as your email</span>
      </div>

      <div class="field">
        <label for="password" class="yui3-u-1-3">Password
        </label><span  class="yui3-u-2-3">
          <a href="/change-password">Change Password</a>
        </span>
        <span class="help-text yui3-u-1">
          Password in not show due to security reasons.<br/>
          Its advised to change your password regularly (recommended, once in a month)
        </span>
      </div>

      <div class="field">
        <label for="email" class="yui3-u-1-3">Alternate Email
        </label><span  class="yui3-u-2-3">
          <input type="email" name="email"  value="${user.email!}" style="width: 50%;" />
        </span>
        <span class="help-text yui3-u-1">Alternate email, other than the one used in username</span>
      </div>

      <div class="field">
        <label for="phoneNumber" class="yui3-u-1-3">Phone
        </label><span class="yui3-u-2-3">
          <input type="text" name="phoneNumber" value="${user.phoneNumber!}" style="width: 40%;" />
        </span>
        <span class="help-text yui3-u-1">Primary phone number (mobile or landline)</span>
      </div>

      <div class="field">
        <label for="facebookId" class="yui3-u-1-3">Facebook Id
        </label><span class="yui3-u-2-3">
          <input type="text" name="facebookId" value="${user.facebookId!}" pattern="[0-9]{14}" style="width: 40%;" />
        </span>
        <span class="help-text yui3-u-1">
          Place your 14-digit facebook id (can be found at the URL https://graph.facebook.com/hashedin, replace 'hashedin' with your 'userID').
        </span>
      </div>

      <div class="field">
        <label for="preferredContactMethod" class="yui3-u-1-3">Preferred Contact Method
        </label><span class="yui3-u-2-3">
          <input type="radio" name="preferredContactMethod" value="email" <#if !user.preferredContactMethod?? || user.preferredContactMethod == "Email">checked="checked"</#if> /> Email
          <input type="radio" name="preferredContactMethod" value="Phone" <#if user.preferredContactMethod?? && user.preferredContactMethod == "Phone">checked="checked"</#if> style="margin-left: 20px;" /> Phone
        </span>
        <span class="help-text yui3-u-1">You will like us to contact you by email or phone</span>
      </div>

      <div class="field">
        <label for="preferredLanguage" class="yui3-u-1-3">Preferred Language
        </label><span class="yui3-u-2-3">
          <input type="radio" name="preferredLanguage" value="English" <#if !user.preferredLanguage?? || user.preferredLanguage == "English">checked="checked"</#if> /> English
          <input type="radio" name="preferredLanguage" value="Hindi" <#if user.preferredLanguage?? && user.preferredLanguage == "Hindi">checked="checked"</#if> style="margin-left: 20px;" /> Hindi
        </span>
        <span class="help-text yui3-u-1">You will like us to communicate you in English or Hindi</span>
      </div>

      <div class="field yui3-u-1">
        <input class="button" type="submit" value="Update" style="margin-left: 33.333%;" />
        <a href="javscript:cancel">Cancel</a>
        <br/>
        <span class="help-text"></span>
      </div>
    </form>
  </div>
  <div class="yui3-u-1-4">
    <div class="admin-section-widget" style="padding-bottom: 10px;">
      <div class="admin-section-widget-hd">Invite your friends</div>
      ${t.render("invite-friends", "invite01", "")}
    </div>

    <#if !(req.user.membership)?? || req.user.membership == "Trial" && !req.user.requests?seq_contains("Upgrade")>
      <div class="admin-section-widget">
        <div class="admin-section-widget-hd">Need help with design?</div>
        <div>
          <p>Upgrade to Premium plan and let our professional designers create your website for you.</p>
          <a class="admin-button" href="${req.siteUrl}/lt_admin/publish?site=${draftSite!}&plan=premium" style="margin-bottom: 10px; padding: 0.5em 2em;">Upgrade To Premium</a>
        </div>
        <div>
          <p>&hellip; or you might want to go through our tutorial explaining how to create your website
              in 5 simple steps. <a href="/tutorial">Learn more</a></p>
        </div>
      </div>
    </#if>

    <#if (req.user.membership)?? && req.user.membership != "Premium" && req.user.membership != "SuperAdmin" && !req.user.requests?seq_contains("Upgrade")>
      <div class="admin-section-widget">
        <div class="admin-section-widget-hd">Are you a web designer?</div>
        <div>
          <p>&hellip; or an aspiring web designer and want to run an online business building websites,
          we are looking for you!</p>
          <p>Contact us now for interesting partnership opportunities.</p>
          <a class="admin-button" href="/contact" style="padding: 0.5em 2em;">Yes I Am Interested!</a>
        </div>
      </div>
    </#if>
  </div>
</div>