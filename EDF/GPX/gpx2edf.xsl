<?xml version="1.0" encoding="UTF-8"?>
<!-- Takes GPX as input and produces EDF CSV as output. Currently looks for latitude, longitude, elevation, time, and heartrate data in the GPX. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gpx="http://www.topografix.com/GPX/1/1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:variable name="eol" select="'&#xd;&#xa;'"/>
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:text>lat,lon,alt,time,HR</xsl:text>
    <xsl:value-of select="$eol"/>
    <xsl:for-each select="//gpx:trkpt">
      <xsl:variable name="lat" select="@lat"/>
      <xsl:value-of select="if ( $lat castable as xs:decimal ) then $lat else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="lon" select="@lon"/>
      <xsl:value-of select="if ( $lon castable as xs:decimal ) then $lon else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="alt" select="gpx:ele/text()"/>
      <xsl:value-of select="if ( $alt castable as xs:decimal ) then $alt else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="time" select="gpx:time/text()"/>
      <xsl:value-of select="if ( $time castable as xs:dateTime ) then $time else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="HR" select="gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr/text()"/>
      <xsl:value-of select="if ( $HR castable as xs:integer ) then $HR else ''"/>
      <xsl:value-of select="$eol"/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>