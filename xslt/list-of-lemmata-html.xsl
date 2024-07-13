<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output media-type="text/html" method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html lang="en-US">
            <head>
                <meta charset="UTF-8"></meta>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>
                <meta name="mobile-web-app-capable" content="yes"></meta>
                <meta name="apple-mobile-web-app-capable" content="yes"></meta>
                <meta name="apple-mobile-web-app-title" content="LRL - Lemmata"></meta>
                <link rel="profile" href="http://gmpg.org/xfn/11"></link>
                <link rel="shortcut icon" type="image/x-icon" href="favicon.ico"></link>
                <link rel="icon" type="image/png" href="favicon.png" sizes="96x96"></link>
                <title>
                    <xsl:text>LRL: Lemmata</xsl:text>
                </title>
                <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond|Frank+Ruhl+Libre&amp;display=swap" rel="stylesheet"></link>
                <link rel='stylesheet' id='theme-asset-styles-css'  href='./css/assets.min.css' type='text/css' media=''></link>
                <link rel='stylesheet' id='theme-styles-css'  href='./css/style.css' type='text/css' media=''></link>
                <script type='text/javascript' src='https://fundament.acdh.oeaw.ac.at/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
                <script type='text/javascript' src='https://fundament.acdh.oeaw.ac.at/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
                <link rel="canonical" href="https://fundament.acdh.oeaw.ac.at/documentation/"></link>
                <style type="text/css">
                    /**
                    * GeSHi Dynamically Generated Stylesheet
                    * --------------------------------------
                    * Dynamically generated stylesheet for html5
                    * CSS class: , CSS id: 
                    * GeSHi (C) 2004 - 2007 Nigel McNie, 2007 - 2014 Benny Baumann
                    * (http://qbnz.com/highlighter/ and http://geshi.org/)
                    * --------------------------------------
                    */
                    .html5 .de1, .html5 .de2 {}
                    .html5  {font-family:monospace;}
                    .html5 .imp {font-weight: bold; color: red;}
                    .html5 li, .html5 .li1 {font-weight: normal; vertical-align:top;}
                    .html5 .ln {width:1px;text-align:right;margin:0;padding:0 2px;vertical-align:top;}
                    .html5 .li2 {font-weight: bold; vertical-align:top;}
                    .html5 .kw2 {color: #000000; font-weight: bold;}
                    .html5 .kw3 {color: #000066;}
                    .html5 .es0 {color: #000099; font-weight: bold;}
                    .html5 .br0 {color: #66cc66;}
                    .html5 .sy0 {color: #66cc66;}
                    .html5 .st0 {color: #ff0000;}
                    .html5 .nu0 {color: #cc66cc;}
                    .html5 .sc-2 {color: #404040;}
                    .html5 .sc-1 {color: #808080; font-style: italic;}
                    .html5 .sc0 {color: #00bbdd;}
                    .html5 .sc1 {color: #ddbb00;}
                    .html5 .sc2 {color: #009900;}
                    .html5 .ln-xtra, .html5 li.ln-xtra, .html5 div.ln-xtra {background-color: #ffc;}
                    .html5 span.xtra { display:block; }
                </style>
                <style type="text/css">
                    img.wp-smiley,
                    img.emoji {
                    display: inline !important;
                    border: none !important;
                    box-shadow: none !important;
                    height: 1em !important;
                    width: 1em !important;
                    margin: 0 .07em !important;
                    vertical-align: -0.1em !important;
                    background: none !important;
                    padding: 0 !important;
                    }
                </style>
                <link rel='stylesheet' id='bodhi-svgs-attachment-css'  href='https://fundament.acdh.oeaw.ac.at/wp-content/plugins/svg-support/css/svgs-attachment.css?ver=4.9.11' type='text/css' media='all'/>
                <link rel='stylesheet' id='wpgeshi-wp-geshi-highlight-css'  href='https://fundament.acdh.oeaw.ac.at/wp-content/plugins/wp-geshi-highlight/wp-geshi-highlight.css?ver=4.9.11' type='text/css' media='all' />
                <link rel='stylesheet' id='kirki-styles-fundament_wp_options-css'  href='https://fundament.acdh.oeaw.ac.at/wp-content/themes/fundament_wp/inc/customizer-controls/assets/css/kirki-styles.css?ver=4.9.11' type='text/css' media='all' />
                <style id='kirki-styles-fundament_wp_options-inline-css' type='text/css'>
                    body{font-family:inherit;font-weight:400;background-color:#F1F1F1;border-right-width:0rem;border-left-width:0rem;border-bottom-width:0rem;border-color:#6c757d;}.btn-round,.navbar-brand,h1,h2,h3,h4,h5,h6{font-family:inherit;font-weight:500;}.page main > article .entry-content,.post-teaser,.single main > article .entry-content{font-family:inherit;font-weight:400;}.navbar .navbar-brand{height:2.5rem;}.navbar{padding-top:1.25rem;padding-bottom:1.25rem;background-color:#fff;}.navbar .nav-link{font-size:1rem;}.navbar .nav-item a.nav-link{padding-right:0.75rem;padding-left:0.75rem;}.navbar .nav-item.active > a.nav-link::after{left:0.75rem;right:0.75rem;}#wrapper-hero-content .hero-dark .btn-round:hover,.btn-round,.page main > article .entry-content a,.separator-title,.single main > article .entry-content a{color:#212529;}.page main > article .entry-content a,.separator-title,.single main > article .entry-content a{border-color:#212529;}.card-wrapper .card .card-inner{border-top-color:#88dbdf !important;border-width:1px;border-color:rgba(0, 0, 0, 0.1);;border-top-width:5px !important;}.btn-round:hover{background-color:#212529;}html{background-color:#fff;}#wrapper-navbar{border-top-width:0rem;border-top-color:#6c757d;}#wrapper-hero-content > #wrapper-hero-inner > h1{font-size:2.5rem;}#wrapper-hero-content > #wrapper-hero-inner > p{font-size:1rem;}#wrapper-hero-content > #wrapper-hero-inner button{font-size:0.9rem;padding-top:0.6rem;padding-bottom:0.6rem;padding-right:1.2rem;padding-left:1.2rem;}#wrapper-hero-content::after{background-color:rgba(52,195,202,0.75);}#wrapper-hero-inner h1,#wrapper-hero-inner p{width:50%;}#wrapper-footer-full{background-color:#ffffff;}#wrapper-footer-full,#wrapper-footer-full a,#wrapper-footer-full h1,#wrapper-footer-full h2,#wrapper-footer-full h3,#wrapper-footer-full h4,#wrapper-footer-full h5,#wrapper-footer-full h6{color:#212529;}#wrapper-footer-full .widget-title,.footer-separator{border-bottom-color:rgba(0, 0, 0, 0.15);}#wrapper-footer-secondary{background-color:#f1f1f1;}#wrapper-footer-secondary .widget-title{border-bottom-color:rgba(255, 255, 255, 0.3);}#wrapper-footer-secondary,#wrapper-footer-secondary a,#wrapper-footer-secondary h1,#wrapper-footer-secondary h2,#wrapper-footer-secondary h3,#wrapper-footer-secondary h4,#wrapper-footer-secondary h5,#wrapper-footer-secondary h6{color:#222222;}
                </style>
            </head>
            <body class="page-template page-template-page-templates page-template-empty-wrapped page-template-page-templatesempty-wrapped-php page page-id-8 wp-custom-logo">
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->
                    <div class="wrapper-fluid wrapper-navbar " id="wrapper-navbar" itemscope="itemscope" itemtype="http://schema.org/WebSite">
                        <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="container" >
                                <!-- Your site title as branding in the menu -->
                                <a href="./index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="./images/logo.png" class="img-fluid" alt="DLiRL Logo" itemprop="logo" /></a><!-- end custom logo -->
                                <a class="navbar-brand site-title-with-logo" rel="home" href="./index.html" title="DLiRL" itemprop="url">DLiRL</a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                    <!-- The WordPress Menu goes here -->
                                    <ul id="main-menu" class="navbar-nav"><li id="menu-item-11" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home nav-item menu-item-11 active"><a title="Home" href="./index.html" class="nav-link">Home</a></li>
                                        <li class="nav-item dropdown">
                                            <a title="Dropdown" href="." data-toggle="dropdown" class="nav-link dropdown-toggle">Projects <span class="caret"></span></a>
                                            <ul class=" dropdown-menu" role="menu">
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Dictionary of Loandwords in Midrash Genesis Rabbah" href="project-dlgenr.html" class="nav-link">DLGenR</a>
                                                    <a title="Dictionary of Loanwords in Midrash Yalkut Shimoni" href="project-dlys.html" class="nav-link">DLYS</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-20" class="menu-item menu-item-type-post_type menu-item-object-page nav-item menu-item-15"><a title="Dictionary &amp; Tools" href="./dictionaryandtools.html" class="nav-link">Dictionary &amp; Tools</a></li>
                                        <li id="menu-item-25" class="menu-item menu-item-type-post_type menu-item-object-page nav-item menu-item-15"><a title="Genesis Rabbah" href="./genesisrabbah.html" class="nav-link">Genesis Rabbah</a></li>
                                        <li id="menu-item-26" class="menu-item menu-item-type-post_type menu-item-object-page nav-item menu-item-15"><a title="Yalkut Shimoni" href="./yalkutshimoni.html" class="nav-link">Yalkut Shimoni</a></li>
                                        <li id="menu-item-30" class="menu-item menu-item-type-post_type menu-item-object-page nav-item menu-item-15"><a title="Jewish-Greek Lexicography" href="./jewishgreeklexicography.html" class="nav-link">Hebrew / Aramaic-Greek Lexicography</a></li>
                                    </ul>
                                </div><!-- .collapse navbar-collapse -->
                            </div><!-- .container -->
                        </nav><!-- .site-navigation -->
                    </div><!-- .wrapper-navbar end -->
                    <div class="wrapper" id="page-wrapper">
                        <div class="container" id="content" tabindex="-1">
                             <div class="row">
                                 <!-- Start shortcoder --><div class="d-none d-md-block col-md-3 col-lg-2">
                                    <nav class="docs-side-nav sticky-top">
                                        <h5 class="docs-side-nav-title seperation"><a href="./search.html">Search</a></h5>
                                        <h5 class="docs-side-nav-title seperation"><a href="./search.html#browseindices">Browse Indices</a></h5>
                                        <ul class="nav">
                                            <li class="docs-side-nav-link">
                                                <a href="./search.html#aramaicindex">Browse Aramaic Index</a>
                                            </li>
                                            <li class="docs-side-nav-link">
                                                <a href="./search.html#greekindex">Browse Greek Index</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div><!-- End shortcoder v4.1.7-->
                                <!-- Start shortcoder --><div class="col-md-9 col-lg-10 content-area" id="primary">
                                    <main class="site-main" id="main" role="main">
                                        <article class="post-8 page type-page status-publish hentry" id="post-8">
                                            <header class="entry-header">
                                                <h1 class="entry-title set-latin-font">
                                                    <xsl:text>Lemmata</xsl:text>
                                                </h1>
                                            </header><!-- .entry-header -->
                                            <div class="entry-content"><!-- End shortcoder v4.1.7-->
                                                <xsl:for-each select="collection('../dlgenr?select=*.xml')/tei:TEI/tei:text/tei:body/tei:entry">
                                                    <xsl:sort select="./tei:form[@type = 'lemma']/tei:orth[@type = 'lemma']/text()" data-type="text"/>
                                                    <xsl:element name="div">
                                                        <xsl:attribute name="class" select="'list-of-lemmata-lemma'"/>
                                                        <xsl:element name="a">
                                                            <xsl:attribute name="href" select="concat(substring-before(@xml:id,'-dlgenr'),'.html')"/>
                                                            <xsl:value-of select="tei:form[@type = 'lemma']/tei:orth[@type = 'lemma']/text()"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                </xsl:for-each>
                                            </div><!-- .entry-content -->
                                        </article><!-- #post-## -->
                                    </main><!-- #main -->
                                </div><!-- End shortcoder v4.1.7-->
                                <p> </p>
                            </div><!-- .row -->
                        </div><!-- Container end -->
                    </div><!-- Wrapper end -->
                    <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
                        <div class="container" id="footer-full-content" tabindex="-1">
                            <div class="footer-separator">
                                <i data-feather="message-circle"></i> CONTACT
                            </div>
                            <div class="row">
                                <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 col-3">
                                    <div class="textwidget custom-html-widget">
                                        <a href="/"><img src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"></img></a>
                                    </div>
                                </div><!-- .footer-widget -->
                                <div class="footer-widget col-lg-4 col-md-4 col-sm-6 col-9">
                                    <div class="textwidget custom-html-widget">
                                        <p>
                                            ACDH-ÖAW
                                            <br></br>
                                                Austrian Centre for Digital Humanities and Cultural Heritage
                                                <br></br>
                                                    Austrian Academy of Sciences
                                        </p>
                                        <p>
                                            Sonnenfelsgasse 19,
                                            <br></br>
                                                1010 Vienna
                                        </p>
                                        <p>
                                            T: +43 1 51581-2200
                                            <br></br>
                                                E: <a href="mailto:acdh@oeaw.ac.at">acdh@oeaw.ac.at</a>
                                        </p>
                                    </div>
                                </div><!-- .footer-widget -->
                                <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 col-3">
                                    <div class="textwidget custom-html-widget">
                                        <a href="https://www.fwf.ac.at/"><img src="./images/fwf-logo.png" class="image" alt="FWF Logo" style="max-width: 250%; height: auto;" title="FWF Logo"></img></a>
                                    </div>
                                    <div class="textwidget custom-html-widget" style="margin-top:1em;">
                                        <a href="https://uni-salzburg.at"><img src="./images/uni-salzburg-logo.png" class="image" alt="Uni Salzburg Logo" style="max-width: 250%; height: auto;" title="Uni-Salzburg Logo"></img></a>
                                    </div>
                                    <div class="textwidget custom-html-widget">
                                        <a href="https://www.uni-salzburg.at/index.php?id=142"><img src="./images/zentrum-juedische-kulturgeschichte-logo.jpg" class="image" alt="Zentrum für Jüdische Kulturgeschichte Logo" style="max-width: 250%; height: auto; margin-top: 1em;" title="Zentrum für Jüdische Kulturgeschichte Logo"></img></a>
                                    </div>
                                </div>
                                <div class="footer-widget col-lg-3 col-md-4 col-sm-4 ml-auto">
                                    <div class="textwidget custom-html-widget">
                                        <h6>HELPDESK</h6>
                                        <p>ACDH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
                                        <p>
                                            <a class="helpdesk-button" href="mailto:acdh-helpdesk@oeaw.ac.at">ASK US!</a>
                                        </p>
                                    </div>
                                </div><!-- .footer-widget -->
                            </div>
                        </div>
                    </div><!-- #wrapper-footer-full -->
                    <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;">
                        © Copyright OEAW | <a href="./imprint.html">Impressum/Imprint</a>
                    </div>
                </div><!-- #page we need this extra closing tag here -->
                <script type='text/javascript' src='https://fundament.acdh.oeaw.ac.at/wp-content/themes/fundament_wp/js/assets.min.js?ver=1.1.0'></script>
                <script type='text/javascript' src='https://fundament.acdh.oeaw.ac.at/wp-content/themes/fundament_wp/js/theme.min.js?ver=1.1.0'></script>
                <script type='text/javascript' src='https://fundament.acdh.oeaw.ac.at/wp-includes/js/wp-embed.min.js?ver=4.9.11'></script>										
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>