<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0"
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="element()">
    <xsl:element name="{name()}">
      <xsl:apply-templates select="element()|attribute()"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="attribute()">
    <xsl:element name="{name()}">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>
</xsl:transform>
