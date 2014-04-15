<p>Hello ${(user.fullName?capitalize)!(user.userName)!},</p>

<p>We have received your upgrade plan request. Our sales representative will get in touch with you shortly. This is to make sure that the 
plan you have selected is suitable for your needs and will walk you through the payment process.</p>

<p> In the meantime, you can keep designing / editing your website at <a href="http://${siteURL!}">http://${siteURL!}</a>
</p>

<p> <b><u>Upgrade Plan Request Details:-</u> - </b>
    <table style="padding:2px 30px;">
        <tr>
            <td>Sub-Domain:</td>
            <td style="padding-left:10px;padding-bottom:5px;">${formData["subDomain"]!}</td>
        </tr>
        <tr>
            <td>Plan Type:</td>
            <td style="padding-left:10px;padding-bottom:5px;">${(formData["plan"]?capitalize)!}</td>
        </tr>
        <tr>
            <td>Plan Duration:</td>
            <td style="padding-left:10px;padding-bottom:5px;">${formData["duration"]!} months</td>
        </tr>
        <tr>
            <td>Need Custom Domain:</td>
            <td style="padding-left:10px;padding-bottom:5px;">${(formData["customDomain"]?capitalize)!}</td>
        </tr>
    </table>

</p>

<p>To keep yourself updated, Join us on <a href="http://www.facebook.com/hashedin">Facebook</a>.
You can reply to this mail if you have further questions or need more information.</p>

<p>Thanks,<br/>
Himanshu,<br/>
Sales Director & Co-founder,<br/>
DesignOnCloud (<a href="http://designoncloud.com">http://designoncloud.com</a>),<br/>
Ph:- +91 9379-948-294</p>
