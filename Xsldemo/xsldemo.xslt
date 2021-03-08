<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/" >

    <table border ="1">
      <tr>
        <td>#</td>
        <xsl:for-each select="catalog/cd[last()]/child::*"> <!--to select node name one time-->
          <td>
          <xsl:value-of select="name()" /><!--to represent tag name-->
          </td>
        </xsl:for-each>
      </tr>
      <xsl:apply-templates select="catalog/cd"> <!--foreach to view all data-->
        <xsl:sort order="ascending" select="Year"/> <!--to order-->
      </xsl:apply-templates>


      <tr>
        <td colspan="4">Total</td>
        <td colspan="2">
          <xsl:value-of select="sum(catalog/cd/Price)"/><!--to sum price-->
        </td>
      </tr>

    </table>
  </xsl:template>
  <xsl:template match="cd">
    <xsl:variable name="trstyle"><!--variable-->
      <xsl:choose>
        <xsl:when test="position() mod 2">
          background-color:gray;color:white
        </xsl:when>
        <xsl:otherwise>
          background-color:pink;color:plue
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    
    <tr style="{$trstyle}">
      <td>
        <xsl:value-of select="position()" /><!--to get number of row-->
      </td>
      <xsl:for-each select="child::*">
        <td>
          <xsl:value-of select="."/>
        </td>
      </xsl:for-each>
    </tr>
  </xsl:template>
</xsl:stylesheet>
