<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" 
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:template match="cookbook">
    <xsl:apply-templates select="chapter"/>
  </xsl:template>
</xsl:transform>
