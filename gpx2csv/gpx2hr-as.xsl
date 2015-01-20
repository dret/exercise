<?xml version="1.0" encoding="UTF-8"?>
<!-- Takes GPX as input and produces AS of elevated heart rate episodes as output. -->
<!-- Input must be GPX with embedded HR data. Only GPS points with HR values >0 will be considered. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gpx="http://www.topografix.com/GPX/1/1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <!-- HR : the HR value which is used to identify "elevated HR events". Any periods of time where all HR values are at least like specified by this parameter will be considered "elevated HR events". -->
  <xsl:param name="HR" select="155" as="xs:integer"/>
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:for-each-group select="//gpx:trkpt[exists(gpx:time) and exists(gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr[xs:integer(text()) ne 0])]" group-adjacent="xs:integer(gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr) ge $HR">
    <!-- Only GPX points with time stamps and HR values >0 will be considered in the transformation. -->
      <xsl:if test="xs:integer(current-group()[1]/gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr) ge $HR">
        <xsl:text>{ "verb" : "elevatedHeartRate",
  "actor"     : { "objectType" : "person", "id" : http://dret.net/netdret, "displayName" : "Erik" },
  "object"    : {	"objectType" : "labreport",
    "title"   : "SiemensHeartRate Labreport", 
    "id"      : "http://example.org/heartRateData/17",
    "url"     : "http://example.org/heartRateData/17/data",
  },
  "startTime" : "</xsl:text>
        <xsl:value-of select="current-group()[1]/gpx:time/text()"/>
        <xsl:text>",
  "endTime"   : "</xsl:text>
        <xsl:value-of select="current-group()[last()]/gpx:time/text()"/>
        <xsl:text>",
  "minHR"     : "</xsl:text>
        <xsl:value-of select="min(current-group()/gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr)"/>
        <xsl:text>",
  "maxHR"     : "</xsl:text>
        <xsl:value-of select="max(current-group()/gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr)"/>
        <xsl:text>",
  "avgHR"     : "</xsl:text>
        <xsl:value-of select="avg(current-group()/gpx:extensions/gpxtpx:TrackPointExtension/gpxtpx:hr)"/>
        <xsl:text>"
}&#xa;</xsl:text>
      </xsl:if>
    </xsl:for-each-group>
  </xsl:template>
</xsl:stylesheet>