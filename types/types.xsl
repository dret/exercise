<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:template match="/">
    <xsl:result-document href="README.md" method="text">
      <xsl:text>Exercise Types
==============

An attempt to create a vocabulary of exercise types than can be shared across services that are concerned with exercises (i.e., physical activities such as hiking, walking, running, or cycling).

So far the following APIs have been taken into consideration:&#xa;&#xa;</xsl:text>
      <xsl:for-each select="//API">
        <xsl:sort select="@name"/>
        <xsl:text>* [</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>.md) (</xsl:text>
        <xsl:value-of select="count(exercise)"/>
        <xsl:text> exercise types)&#xa;</xsl:text>
      </xsl:for-each>
    </xsl:result-document>
    <xsl:for-each select="//API">
      <xsl:result-document href="{@id}.md" method="text">
        <xsl:value-of select="concat('[', @name, '](', @href, ')')"/>
        <xsl:text>&#xa;=============&#xa;&#xa;</xsl:text>
        <xsl:for-each select="exercise">
          <xsl:value-of select="concat('* ', @name, '&#xa;')"/>
        </xsl:for-each>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>