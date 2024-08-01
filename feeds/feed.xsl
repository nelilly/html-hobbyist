<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]></xsl:text>
    <html lang="en">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/> RSS Feed</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1" />
        <link rel="stylesheet" type="text/css" href="/feeds/feed.css" media="screen" />
        <link rel="icon" href="/favicon.ico" sizes="any" />
        <link rel="icon" href="/favicon.svg" type="image/svg+xml" />
      </head>
      <body>
        <header>
          <div class="banner">
            <a href="https://www.htmlhobbyist.com/" target="_blank" rel="noopener noreferrer">
              <img src="https://www.htmlhobbyist.com/html-hobbyist-square-animated-opt.svg" height="160" width="200" alt="The HTML Hobbyist" />
            </a>
            <a target="_blank" rel="noopener noreferrer">
              <xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/></xsl:attribute>
              <h1><xsl:value-of select="/rss/channel/title"/> RSS Feed
                <img src="/images/rss.svg" height="30" width="30" alt="" /></h1>
            </a>
          </div>
          <p>
            <xsl:value-of select="/rss/channel/description"/>
          </p>
        </header>
        <main>
          <aside>
            <p>This is a styled RSS feed for <xsl:value-of select="/rss/channel/title"/>.</p>
            <p>You can add this URL to a <a href="https://htmlhobbyist.com/rss/what_is_a_feed_reader.html" target="_blank" rel="noopener noreferrer">feed reader</a> to get updates whenever the feed is updated.</p>
            <p><img src="/images/rss.svg" height="16" width="16" alt="" />&#xA0;
            <a target="_blank" rel="noopener noreferrer">
              <xsl:attribute name="href"><xsl:value-of select="/rss/channel/atom:link/@href"/></xsl:attribute>
              <xsl:value-of select="/rss/channel/atom:link/@href"/>
            </a></p>
          </aside>
          <section>
          <h2>
            <xsl:for-each select="/rss/channel/category">
              <xsl:value-of select="."/>
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
              <xsl:if test="position()=last()-1">
                <xsl:text> and </xsl:text>
              </xsl:if>
              <xsl:if test="position()=last()">
                <xsl:text>:</xsl:text>
              </xsl:if>
            </xsl:for-each>
          </h2>
          <xsl:for-each select="/rss/channel/item">
            <article>
              <header>
                <h3>
                  <a target="_blank" rel="noopener noreferrer">
                    <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                    <xsl:value-of select="title"/>
                  </a>
                </h3>
                <xsl:if test="source != ''">
                  <p>Source: 
                    <a target="_blank" rel="noopener noreferrer">
                      <xsl:attribute name="href"><xsl:value-of select="source/@url"/></xsl:attribute>
                      <xsl:value-of select="source"/>
                    </a>
                  </p>
                </xsl:if>
              </header>
              <p><xsl:value-of select="description" disable-output-escaping="yes" /></p>
              <p><xsl:value-of select="content:encoded" disable-output-escaping="yes" /></p>
              <p><a target="_blank" rel="noopener noreferrer">
                <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                Read more
              </a> &#x2192;</p>
              <footer>
                <p>Published: <time><xsl:value-of select="pubDate" /></time></p>
              </footer>
            </article>
          </xsl:for-each>
          </section>

          <xsl:for-each select="/rss/channel/textInput">
            <fieldset>
              <legend><xsl:value-of select="title"/></legend>
              <p><xsl:value-of select="description"/></p>
              <form>
                <xsl:attribute name="action"><xsl:value-of select="link"/></xsl:attribute>
                <!-- <label>
                  <xsl:attribute name="for"><xsl:value-of select="name"/></xsl:attribute>
                  <xsl:value-of select="title"/>
                </label> -->
                <input required="true">
                  <xsl:attribute name="aria-label"><xsl:value-of select="title"/></xsl:attribute>
                  <xsl:attribute name="name"><xsl:value-of select="name"/></xsl:attribute>
                  <xsl:attribute name="id"><xsl:value-of select="name"/></xsl:attribute>
                </input>
                <button type="submit"><xsl:value-of select="title"/></button>
              </form>
            </fieldset>
          </xsl:for-each>

        </main>
        <footer>
          <h2>The HTML Hobbyist</h2>
          <p>Learn HTML to build your website, fanzine, or personal site.</p>
          <nav>
            <a href="https://htmlhobbyist.com/" target="_blank" rel="noopener noreferrer">Home</a>
            <a href="https://htmlhobbyist.com/about/" target="_blank" rel="noopener noreferrer">About</a>
            <a href="https://htmlhobbyist.com/contact/" target="_blank" rel="noopener noreferrer">Contact</a>
            <a href="https://htmlhobbyist.com/feeds/" target="_blank" rel="noopener noreferrer">Feeds</a>
            <a href="https://htmlhobbyist.com/announcements/" target="_blank" rel="noopener noreferrer">Announcements</a>
          </nav>
          <p>&#x00A9;2022-2024 N.E.Lilly</p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>