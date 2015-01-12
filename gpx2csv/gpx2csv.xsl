<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gpx="http://www.topografix.com/GPX/1/1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:for-each select="//gpx:trkpt[exists(gpx:time) and exists(gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr[xs:integer(text()) ne 0])]">
      <xsl:value-of select="gpx:time/text()"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr/text()"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="@lat"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="@lon"/>
      <xsl:text>&#xa;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>