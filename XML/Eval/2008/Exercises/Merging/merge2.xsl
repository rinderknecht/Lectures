<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="2.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="lists" as="xs:integer*">
    <xsl:call-template name="merge">
      <xsl:with-param name="items1" select="list[1]/item/@val" as="xs:integer*"/>
      <xsl:with-param name="items2" select="list[2]/item/@val" as="xs:integer*"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="merge" as="xs:integer*">
    <xsl:param name="items1" as="xs:integer*"/>
    <xsl:param name="items2" as="xs:integer*"/>
    <xsl:choose>
      <xsl:when test="empty($items1)">
        <xsl:sequence select="$items2"/>
      </xsl:when>
      <xsl:when test="empty($items2)">
        <xsl:sequence select="$items1"/>
      </xsl:when>
      <xsl:when test="$items1[1] lt $items2[1]">
        <xsl:sequence select="$items1[1]"/>
        <xsl:call-template name="merge">
          <xsl:with-param name="items1" select="$items1[position()>1]"/>
          <xsl:with-param name="items2" select="$items2"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$items2[1]"/>
        <xsl:call-template name="merge">
          <xsl:with-param name="items1" select="$items1"/>
          <xsl:with-param name="items2" select="$items2[position()>1]"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:transform>
