<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <title>Juego de los Panzer</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <xsl:for-each select="jugadasGraficas/jugadaGrafica">
          <table>
            <xsl:call-template name="forFila">
              <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
          </table>
          <br/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="forFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 8">
      <tr>
        <xsl:call-template name="forColumna">
          <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="forFila">
        <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="forColumna">
    <xsl:param name="i"/>
    <xsl:param name="j"/>
    <xsl:if test="$j &lt;= 8">
      
      <xsl:call-template name="celda">
        <xsl:with-param name="x">
          <xsl:value-of select="$j"/>
        </xsl:with-param>
        <xsl:with-param name="y">
          <xsl:value-of select="$i"/>
        </xsl:with-param>
      </xsl:call-template>
      
      <xsl:call-template name="forColumna">
        <xsl:with-param name="i">
          <xsl:value-of select="$i"/>
        </xsl:with-param>
        <xsl:with-param name="j">
          <xsl:value-of select="$j + 1"/>
        </xsl:with-param>
      </xsl:call-template>
      
    </xsl:if>
  </xsl:template>

  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>

    <td>
     <xsl:for-each select="posicion">
        <xsl:if test="$x = @x and $y = @y">
          <xsl:choose>
            <xsl:when test="@tipo = 'pared'">
              <xsl:attribute name="class">pared</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="class">tanque</xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
</td>
  </xsl:template>

  <xsl:template name="css">
    <style>
      .tanque {
      background: red;
      }

      .pared{
      background: black;
      }

      table, tr, td{
      width: 80%;
      border: 1px solid black;
      border-collapse: collapse;
      }

      td {
      width: 50px;
      height: 50px;
      empty-cells: show;
      }
    </style>
  </xsl:template>
  
</xsl:stylesheet>