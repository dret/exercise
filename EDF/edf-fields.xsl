<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:template match="/">
    <xsl:result-document href="README.md" method="text">
      <xsl:text>Exercise Data Format (EDF)
==========================

A simple, extensible, and open data format for representing exercise data based on timestamps. It is based on CSV and thus the following two RFCs might be helpful when using it:

*[RFC 4180: Common Format and MIME Type for Comma-Separated Values (CSV) Files](https://tools.ietf.org/html/rfc4180)
*[RFC 7111: URI Fragment Identifiers for the text/csv Media Type](https://tools.ietf.org/html/rfc7111)

So far the following </xsl:text>
      <xsl:value-of select="count(//field)"/>
      <xsl:text> fields have been defined:&#xa;&#xa;</xsl:text>
      <xsl:for-each select="//field">
        <xsl:sort select="@name"/>
        <xsl:value-of select="@name"/>
        <xsl:text>&#xa;----------&#xa;&#xa;</xsl:text>
        <xsl:value-of select="documentation"/>
        <xsl:text>&#xa;&#xa;</xsl:text>
      </xsl:for-each>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>