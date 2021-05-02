<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- Règles relatives à la sélection et à la copie de l'élément racine TEI, et des constituants de la teiHeader ainsi que ceux de text -->  
    <xsl:template match="TEI">
        <xsl:element name="TEI">
            <xsl:copy-of select="teiHeader"/>
            <xsl:element name="text">
                <xsl:apply-templates select="text"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="text/front">
        <xsl:element name="front">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body/div">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Récupération de toutes les balises pb, cb, p, term, persName, placeName, index, div, head, note, stamp, date, body, epigraph, quote, cit, l, et ref -->
    <xsl:template match="pb[@n = '1' or @n = '2' or @n = '3']">
        <xsl:element name="pb">
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="cb[@n = '1' or @n = '2' or @n = '3'or @n = '4' or @n = '5']">
        <xsl:element name="cb">
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="term|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="persName|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="placeName|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="index|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="div|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="head|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="note|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="stamp|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="date|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="body|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="epigraph|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="quote|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="cit|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="l|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ref|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Numérotation de tous les paragraphes pour une facilitation de l'exploration du texte -->
    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:attribute name="n">
                <xsl:number count="p" level="any" format="1"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Création d'une règle avec conditions pour un apport de précisions relatives aux contenus de certaines placeName -->
    <xsl:template match="placeName">
        <xsl:choose>
            <xsl:when test="./text()='Amsterdam'">
                <xsl:copy>Amsterdam(Pays-Bas)</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Anvers'">
                <xsl:copy>Anvers(Belgique)</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Bibliothèque'">
                <xsl:copy>Bibliothèque de Van den Enden</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Châtenay'">
                <xsl:copy>Châtenay(France)</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Cour de Louis XIV'">
                <xsl:copy>Cour de Louis XIV, Roi de France</xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>