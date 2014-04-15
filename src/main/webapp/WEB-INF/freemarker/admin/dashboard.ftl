<@w.adminPageHeader heading="Dashboard" />

<#assign draftSite = "" />
<div class="yui3-g" style="margin-bottom: 70px;">
  <div class="yui3-u-3-4 sites-list-block">
    <@w.renderPagination page=req.sites targetId="sitesList" targetUrl="${req.currentUrl}?" heading="<span>You have ${req.sites.total} websites</span>" />
    <ul>
      <#list req.sites.results as s>
        <li class="site-entry">
          <div class="site-thumb-img-block">
            <div class="site-thumb-img" style="text-align:center;color:#777777;height:70px;padding-top:50px;">Your Website</div>
          </div><div class="site-details-block">
            <#if !s.published>
              <#if req.user.membership == "Trial" && draftSite == ""><#assign draftSite = s.domain /></#if>
              <a href="${w.editUrl(s)}#mode=preview" class="site-name" style="display: inline-block;">Unpublished Site</a>
              <a href="http://${s.domain}" target="_blank" class="site-action-link">(Preview)</a>
            <#else>
              <a href="${w.editUrl(s)}#mode=preview" class="site-name">${s.domain?replace("."  + req.siteDomain, "")}</a>
              <a href="http://${s.domain}" target="_blank" class="site-action-link">(Preview)</a>
            </#if>

            <div class="label" style="margin-top:10px;">Created on:
              <div class="site-creation-date">${s.creationDate?string("d MMM, yyyy, HH:mm:ss")}</div>
              <br/>
            </div>

            <div class="label">Last Updated:
              <div class="site-creation-date">${s.lastModifiedDate?string("d MMM, yyyy, HH:mm:ss")}</div>
              <br/>
            </div>

            <#if req.user.membership == "Premium" || req.user.membership == "SuperAdmin">
                ${s.domain}
                <br/>
                <a href="http://${s.domain}/lt_admin/services/snapshot" class="site-action-link" style="margin-left: 0;">Snapshot</a> |
                <a href="http://${s.domain}/lt_admin/services/clearSnapshots" class="site-action-link">Clear</a><br/>
            </#if>

            <#if (req.user.membership)?? && req.user.membership != "Trial">
                <form name="aliasForm" action="${req.servicesBase}/site/addAlias" style="bottom:0;position:absolute;" method="POST" class="yui3-g">
                  <input type="hidden" name="siteURL" value="${s.domain}" />
                  <input type="hidden" name="returnUrl" value="${req.currentUrl!}" />
                  <input type="alias" name="alias" value="${s.alias!}" placeholder="Add Alias" class="yui3-u-3-5" style="padding:5px;" />
                  <input type="submit" value="Change" style="padding: 2px 20px;margin-left:4px;" class="yui3-u-1-3" />
                </form>
             <#else>
                 <a class="admin-button" href="${req.siteUrl}/lt_admin/publish?site=${draftSite!}" style="margin: 0; padding: 0.5em 2em;bottom:0;position:absolute;">Upgrade My Plan</a>
             </#if>

          </div><div class="site-secondary-block">
              <#if !s.published>
                  <div class="action-block"> 
                      <a href="${req.siteUrl}/lt_admin/publish?site=${s.domain}" class="site-publish-button" style="float:right;">Publish Now</a>
                  </div>
              </#if>
              <div class="action-block"> 
                  <a href="${w.editUrl(s)}" class="site-action-button">Start Editing</a>
              </div>
          </div>
        </li>
      </#list>
    </ul>
    <@w.renderPagination page=req.sites targetId="sitesList" targetUrl="${req.currentUrl}?" heading="${req.sites.total} websites" />
    <div class="dashboard-msg" style="font-size: 1.1em;">
        <h2 style="font-size: 22px; margin-bottom: 10px;">Is this your First Website?</h2>
        <p>You might want to go through the following link explaining how to create your website in 5 simple steps:</p>
        <a href="${req.siteUrl}/tutorial" target="_blank">Create your first website in 5 simple steps</a>
    </div>
  </div>

  <div class="yui3-u-1-4">

    <div class="admin-section-widget">
      <div class="admin-section-widget-hd">Admin Page Links</div>
      <div>
        &rarr; &nbsp; <a href="${req.siteUrl}/lt_admin/profile">Profile</a>
      </div>
    </div>

    <div class="admin-section-widget" style="padding-bottom: 10px;">
      <div class="admin-section-widget-hd">Invite your friends</div>
      ${t.render("invite-friends", "invite01", "")}
    </div>

    <div class="admin-section-widget">
      <div class="admin-section-widget-hd">
        Account Type:
        <span style="font-weight: bold;">${(req.user.membership!"Trial")?upper_case}</span>
      </div>
      <#if !(req.user.membership)?? || req.user.membership == "Trial">
        <#if req.user.requests?seq_contains("Upgrade")>
          <div class="dashboard-invite-sent-msg">You have an upgrade request under process!</div>  
        <#else>
          <a class="admin-button" href="${req.siteUrl}/lt_admin/publish?site=${draftSite!}" style="margin: 0; padding: 0.5em 2em;">Upgrade My Plan</a>
        </#if>
        <div style="font-weight: bold; margin: 5px 0;">With the upgrade you get</div>
        <ul style="margin-left: 5px; font-size: 12px;">
          <li>&ndash;&nbsp; Custom domain</li>
          <li>&ndash;&nbsp; Multiple sites per account</li>
          <li>&ndash;&nbsp; Custom site footer</li>
        </ul>
      </#if>
    </div>

    <#if (req.user.membership)?? && req.user.membership != "Trial">
      <a href="${req.servicesBase}/site/create" class="dashboard-create-btn">Create A New Website</a>
    </#if>

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
