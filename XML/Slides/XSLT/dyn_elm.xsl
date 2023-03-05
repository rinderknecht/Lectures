<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0"
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="cars">
    <models><xsl:apply-templates/></models>
  </xsl:template>
  <xsl:template match="car">
    <xsl:element name="{@manufacturer}">
      <xsl:value-of select="@model"/>
    </xsl:element> </xsl:template>
</xsl:transform>
