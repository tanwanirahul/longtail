<p>Hello ${(user.fullName?capitalize)!(user.userName)!},</p>

<p>Thank you for signing up for DesignOnCloud. You can now design your website right from your web-browser. For further updates and 
latest news, join us on FaceBook at <a href="http://www.facebook.com/hashedin">http://facebook.com/hashedin</a>. 
You can post your website link on the facebook wall to get feedback and join our community of active users.</p>

<p>If this is your first web design, we suggest you to go through the tutorial <a href="http://designoncloud.com/tutorial">"Create your first website in 5 simple steps"</a></p>

<p> <b><u>Your Account Details</u> - </b>
<table style="padding:2px 30px;">
    <tr>
        <td><b>Dashboard:</b></td>
        <td style="padding-left:10px;"><a href="http://designoncloud.com/lt_admin/dashboard">http://designoncloud.com/lt_admin/dashboard</a></td>
    </tr>
    <tr>
        <td><b>UserID:</b></td>
        <td style="padding-left:10px;">${user.userName!}</td>
    </tr>
    <tr>
        <td><b>Password:</b></td>
        <td style="padding-left:10px;padding-bottom:5px;">${password?substring(0,3)+""?right_pad(password?length - 3, "*")}</td>
    </tr>
    <tr>
        <td><b>Plan Type:</b></td>
        <td style="padding-left:10px;padding-bottom:5px;">30 days Free Trial</td>
    </tr>
    <tr>
        <td><b>Website URL:</b></td>
        <td style="padding-left:10px;padding-bottom:5px;"><a href="http://${siteURL!}">http://${siteURL!}</a></td>
    </tr>
</table>
<i>Note:-</i> We do not store your password for security reasons. If you forget it, you can create it again by using Forgot Password 
<a href="http://designoncloud.com/forgot-password">link.</a></p>

<p>If you have any queries or feedback, you can always email us at <a href="mailto:contact@hashedin.com">contact@hashedin.com</a>.</p>

<p>Thanks and Happy Designing,<br/>
Himanshu,<br/>
Sales Director & Co-founder,<br/>
DesignOnCloud (<a href="http://designoncloud.com">http://designoncloud.com</a>),<br/>
Ph:- +91 9379-948-294</p>
