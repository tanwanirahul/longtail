<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<link rel="shortcut icon" href="/static/img/favicon.ico"/>

<title><?php
    /*
     * Print the <title> tag based on what is being viewed.
     */
    global $page, $paged;

    wp_title( '|', true, 'right' );

    // Add the blog name.
    bloginfo( 'name' );

    // Add the blog description for the home/front page.
    $site_description = get_bloginfo( 'description', 'display' );
    if ( $site_description && ( is_home() || is_front_page() ) )
        echo " | $site_description";

    // Add a page number if necessary:
    if ( $paged >= 2 || $page >= 2 )
        echo ' | ' . sprintf( __( 'Page %s', 'twentyten' ), max( $paged, $page ) );

    ?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<?php
    /* We add some JavaScript to pages with the comment form
     * to support sites with threaded comments (when in use).
     */
    if ( is_singular() && get_option( 'thread_comments' ) )
        wp_enqueue_script( 'comment-reply' );

    /* Always have wp_head() just before the closing </head>
     * tag of your theme, or you will break many plugins, which
     * generally use this hook to add elements to <head> such
     * as styles, scripts, and meta tags.
     */
    wp_head();
?>
<link rel="stylesheet" type="text/css" href="/static/js/yui/3.2.0/build/cssreset/reset-min.css"/>
<link rel="stylesheet" type="text/css" href="/static/js/yui/3.2.0/build/cssfonts/fonts-min.css"/>
<link rel="stylesheet" type="text/css" href="/static/js/yui/3.2.0/build/cssgrids/grids-min.css"/>
<link rel="stylesheet" type="text/css" href="/static/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/static/css/themes/hashedin/theme.css"/>

<style>
html{
 margin-top: 0 !important;
}
body {
  background-color: transparent;
  background-repeat: repeat-x;

}
#canvas {
    background-color: #EAEAEA;
    background-image: url("/static/img/sites/hashedin/bg-header.jpg");
    background-position: center top;
    background-repeat: repeat-x;
}
#main {
  padding: 0;
}
#main #primary ul {
  list-style: disc outside none;
}
#main #primary ul li {
  list-style: disc outside none;
}
#theme-header-content {
  width : 944px;
  margin : auto;
}
#searchform {
  width : auto;
  padding : 0;
}
#main .widget-area ul.xoxo {
  padding: 0;
}
#siteLogo .image-div {
    height: 45px;
    width: 232px;
}
</style>

</head>

<body <?php body_class(); ?>>
<div id="canvas" >
<div id="theme-header-content" style="position: relative;">
  <div id="accountActions">
            <a href="/login" alt="Login">Login</a>
        <span class="slash">|</span>

        <a href="/create" alt="Register">Register</a>
  </div>

   <div class="siteheader">
           <div id="logoContainer">
            <div id="siteLogo" style="float:left;"><div>            <div class="editable image-div" editPath="data.globals.siteLogo" helpText="Click to edit and type in the value. You can use Rich Text Tools on the right to format.">
               <a href="/"> <img src="/static/css/themes/hashedin/img/logo.png"></a><br>
            </div>
        </div></div>

            <div id="siteMotto" style="clear:both;">            
                <div class="editable rich-text" editPath="data.globals.siteMotto" helpText="Click to edit and type in the value. You can use Rich Text Tools on the right to format.">
                <h2 id="yui_3_1_1_1_12832881491272735">Online Success for your <span style="color: rgb(109, 207, 246);">Business</span></h2>
            </div>
        </div>
        </div>
        <div id="siteName" style="float:left;">            
        	<div class="editable rich-text" editPath="data.globals.siteName" helpText="Click to edit and type in the value. You can use Rich Text Tools on the right to format.">
                <br>
            </div>
        </div>

    </div>

    <div id="nav">
        <div class="widget nav-widget horizontal-right  " id="nav01">
        <ul class="editable navigation-links">
                <li togglePath="data.widgets.nav01.meta.lists.siteNav.p7.state" class="state-enabled"><a href="/">Home</a></li>
                <li togglePath="data.widgets.nav01.meta.lists.siteNav.p2.state" class="state-enabled "><a href="/about-us/">About Us</a></li>
                <li togglePath="data.widgets.nav01.meta.lists.siteNav.p4.state" class="state-enabled "><a href="/features/">Features</a></li>
                <li togglePath="data.widgets.nav01.meta.lists.siteNav.p3.state" class="state-enabled selected"><a href="/blog/">Blog</a></li>
                <li togglePath="data.widgets.nav01.meta.lists.siteNav.p2.state" class="state-enabled "><a href="/contact-us/">Contact Us</a></li>
	    </ul>
    	<div style="clear:both"></div>
		</div>
    </div>
</div>


<div id="wrapper" class="hfeed">

    <div id="main">
