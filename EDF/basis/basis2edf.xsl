<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:db="ugly:hack" exclude-result-prefixes="xs db" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:param name="basis-csv" select="'basis.csv'"/>
    <xsl:param name="basis-edf" select="'basis-edf.csv'"/>
    <xsl:variable name="eol" select="'&#xd;&#xa;'"/>
    <xsl:template match="/">
        <xsl:variable name="basis-line" select="tokenize(unparsed-text($basis-csv), '&#xa;')"/>
        <xsl:result-document href="{$basis-edf}" method="text" encoding="UTF-8">
            <xsl:text>time,HR</xsl:text>
            <xsl:value-of select="$eol"/>
            <xsl:for-each select="$basis-line[(position() gt 1) and (position() lt last())]">
                <xsl:value-of select="db:epochToDate(tokenize(., ',')[2])"/>
                <xsl:text>,</xsl:text>
                <xsl:variable name="hr" select="tokenize(., ',')[4]"/>
                <xsl:value-of select="if ( $hr castable as xs:integer ) then $hr else ''"/>
                <xsl:value-of select="$eol"/>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    <xsl:function name="db:epochToDate">
        <xsl:param name="epoch"/>
        <xsl:variable name="dayTimeDuration" select="concat('PT',$epoch,'S')"/>
        <xsl:value-of select="xs:dateTime('1970-01-01T00:00:00') + xs:dayTimeDuration($dayTimeDuration)"/>
    </xsl:function>
</xsl:stylesheet>