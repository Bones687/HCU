<?php echo doctype("html5");?>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?php echo $title; ?></title>		
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
    <script src="resource/js/jquery.min.js"></script>
    <script src="resource/js/jquery.dropotron.min.js"></script>
    <script src="resource/js/skel.min.js"></script>
    <script src="resource/js/skel-layers.min.js"></script>
    <script src="resource/js/init.js"></script>
            <?php 
              echo link_tag('resource/style/css/skel.css');
              echo link_tag('resource/style/css/style.css'); 
              echo link_tag('resource/style/css/style-desktop.css'); 
            ?>
    <?php //echo link_tag('resource/style/stylesheet.css'); ?>
</head>
<body class="homepage">

