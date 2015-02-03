<?xml version="1.0" encoding="UTF-8"?>
<!-- Takes GPX as input and produces EDF CSV as output. Currently looks for latitude, longitude, elevation, time, and heartrate data in the GPX. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tcx="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" xmlns:tpx="http://www.garmin.com/xmlschemas/ActivityExtension/v2" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
  <xsl:variable name="eol" select="'&#xd;&#xa;'"/>
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:text>time,lat,lon,alt,HR,http://example.com/runcadence,http://example.com/speed</xsl:text>
    <xsl:value-of select="$eol"/>
    <xsl:for-each select="//tcx:Trackpoint">
      <xsl:variable name="time" select="tcx:Time/text()"/>
      <xsl:value-of select="if ( $time castable as xs:dateTime ) then $time else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="lat" select="tcx:Position/tcx:LatitudeDegrees/text()"/>
      <xsl:value-of select="if ( $lat castable as xs:decimal ) then $lat else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="lon" select="tcx:Position/tcx:LatitudeDegrees/text()"/>
      <xsl:value-of select="if ( $lon castable as xs:decimal ) then $lon else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="alt" select="tcx:AltitudeMeters/text()"/>
      <xsl:value-of select="if ( $alt castable as xs:decimal ) then $alt else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="HR" select="tcx:HeartRateBpm/tcx:Value/text()"/>
      <xsl:value-of select="if ( $HR castable as xs:integer ) then $HR else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="time" select="tcx:Extensions/tpx:TPX/tpx:RunCadence/text()"/>
      <xsl:value-of select="if ( $time castable as xs:integer ) then $time else ''"/>
      <xsl:text>,</xsl:text>
      <xsl:variable name="time" select="tcx:Extensions/tpx:TPX/tpx:Speed/text()"/>
      <xsl:value-of select="if ( $time castable as xs:decimal ) then $time else ''"/>
      <xsl:value-of select="$eol"/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>