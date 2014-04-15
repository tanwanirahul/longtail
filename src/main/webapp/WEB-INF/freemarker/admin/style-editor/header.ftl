<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<#assign form=JspTaglibs["/WEB-INF/spring-form.tld"]>
<head>
  <link rel="stylesheet" type="text/css" href="${req.staticBase}/css/base.css"/>
  <script type="text/javascript" src="${req.staticBase}/js/yui/3.3.0/build/yui/yui-min.js"></script>
  <style>
    html {background: #000000; color: #e4e4e4; min-width: 700px;}
    a, a:visited {color: #ff0;}
    .list-pagination {margin: 10px 20px;}
    .list-pagination .heading, .list-pagination .tags-list, .list-pagination .page-links {display: inline-block; *display: inline; zoom: 1;}
    .list-pagination .page-links {float: right;}
    .quickstyles-list {margin: 0 20px;}
    .container {background: #fff; border: 2px inset #777; border-radius: 5px; height: 130px; margin: 10px; padding: 20px;}
    .box-preview {width: 200px; height: 100px; margin: 0 auto; position: relative;}
    .edit-quickstyles {display: block; margin: 10px 10px; text-align: right;}
    label {display: block;font-size: 1.1em; font-weight: bold;margin: 10px 0 5px 3px;}
    textarea {padding: 10px;}
  </style>
  <script>
    var close_frame = true;
  </script>
</head>
<body id="iframeBody">
