<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>XML Sitemap</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <style type="text/css">
                    body {
                    font-family: Helvetica, Arial, sans-serif;
                    font-size: 13px;
                    color: #545353;
                    }
                    table {
                    border: none;
                    border-collapse: collapse;
                    }
                    #sitemap tr.odd td {
                    background-color: #eee !important;
                    }
                    #sitemap tbody tr:hover td {
                    background-color: #ccc;
                    }
                    #sitemap tbody tr:hover td, #sitemap tbody tr:hover td a {
                    color: #000;
                    }
                    #content {
                    margin: 0 auto;
                    width: 1000px;
                    }
                    .expl {
                    margin: 18px 3px;
                    line-height: 1.2em;
                    }
                    .expl a {
                    color: #da3114;
                    font-weight: bold;
                    }
                    .expl a:visited {
                    color: #da3114;
                    }
                    a {
                    color: #000;
                    text-decoration: none;
                    }
                    a:visited {
                    color: #777;
                    }
                    a:hover {
                    text-decoration: underline;
                    }
                    td {
                    font-size:11px;
                    }
                    th {
                    text-align:left;
                    padding-right:30px;
                    font-size:11px;
                    }
                    thead th {
                    border-bottom: 1px solid #000;
                    cursor: pointer;
                    }
                </style>
            </head>
            <body>
                <div id="content">
                    <h1>XML Sitemap</h1>
                    <xsl:if test="count(sitemap:sitemapindex/sitemap:sitemap) &gt; 0">
                        <p class="expl">
                            This XML Sitemap file contains <xsl:value-of select="count(sitemap:sitemap/sitemap:sitemap)"/> sitemaps.
                        </p>
                        <table id="sitemap" cellpadding="3">
                            <thead>
                                <tr>
                                    <th width="75%">Sitemap</th>
                                    <th width="25%">Last Modified</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="sitemap:sitemap/sitemap:sitemap">
                                    <xsl:variable name="sitemapURL">
                                        <xsl:value-of select="sitemap:loc"/>
                                    </xsl:variable>
                                    <tr>
                                        <td>
                                            <a href="{$sitemapURL}"><xsl:value-of select="sitemap:loc"/></a>
                                        </td>
                                        <td>
                                            <xsl:value-of select="concat(substring(sitemap:lastmod,0,11),concat(' ', substring(sitemap:lastmod,12,5)))"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </xsl:if>
                </div>
                <script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
                <script type="text/javascript" src="../js/jquery.tablesorter.min.js"></script>
                <script	type="text/javascript"><![CDATA[
					$(document).ready(function() {
				        $("#sitemap").tablesorter( { widgets: ['zebra'] } );
					});
				]]></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>