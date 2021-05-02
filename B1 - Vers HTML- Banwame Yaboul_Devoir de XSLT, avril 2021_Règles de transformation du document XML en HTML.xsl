<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    version="2.0">
  
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    
    <xsl:strip-space elements="*"/> <!--Pour éviter les espaces non voulus dans notre document de sortie -->
    
    <xsl:template match="TEI">
        
        <!--Génération de fichier HTML en vue de la visualisation de notre travail -->
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title"/>
                </title>
            </head>
            <body>
                <h1>Séquence de Latréaumont</h1>
                <span>
                    <a href="{//distributor/@facs}">Lien vers le manuscrit sur Gallica</a>
                </span>        
                
                <div>
                    <h2>Texte à l'état brut</h2>
                    <div>
                        <ul><xsl:apply-templates select="//text//div" mode="orig"/></ul>
                    </div>
                </div>
                <div>
                    <h2>Texte à encodage normalisé en TEI</h2>
                    <div>
                        <ul><xsl:apply-templates select="//text//div"/></ul>
                    </div>
                </div>
                
                <div>
                    <h2>Index</h2>
                    <ul><xsl:apply-templates select="//text//index"></xsl:apply-templates></ul>
                </div>
           </body>
        </html>
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
    
    <!-- Ajout de références aux termes clés résultant de notre travail d'indexation. L'objectif visé ici est de permettre au lecteur de pouvoir accéder aisément à la page (p.) correspondant au(x) mot(s) clé(s) relatif(s) à sa question de recherche-->
    <xsl:template match="term/placeName">
        <xsl:choose>
            <xsl:when test="./text()='Amsterdam'">
                <xsl:copy> [Amsterdam (Pays-Bas), p. 1, 2], </xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Anvers'">
                <xsl:copy> [Anvers (Belgique), p. 2], </xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Bibliothèque'">
                <xsl:copy> [Bibliothèque de Van den Enden, p. 2] </xsl:copy>
            </xsl:when>
              <xsl:when test="./text()='Châtenay'">
                <xsl:copy> [Châtenay (France), p. 1] </xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Brabant'">
                <xsl:copy> [Brabant (Belgique), p. 2] </xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Burgwal'">
                <xsl:copy> [Burgwal, p. 1, 2] </xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Cabinet'">
                <xsl:copy> [Cabinet de Van den Enden, p. 2] </xsl:copy>
            </xsl:when>
            
            <xsl:when test="./text()='Cordoue'">
                <xsl:copy>[Cordoue (Espagne), p. 2]</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='La Haye'">
                <xsl:copy>[La Haye (Pays-Bas), p. 2]</xsl:copy>
             </xsl:when>
            <xsl:when test="./text()='Hôtel des Muses'">
                <xsl:copy> [Hôtel des Muses, p. 2]</xsl:copy>
              </xsl:when>
            <xsl:when test="./text()='Inde'">
                <xsl:copy>[Inde (Asie), p. 2]</xsl:copy>
              </xsl:when>
            <xsl:when test="./text()='Muraille'">
                <xsl:copy>[Muraille, p. 2]</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='République des sept Provinces-Unies'">
                <xsl:copy> [République des sept Provinces-Unies, p. 2]</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Synagogue portugaise'">
                <xsl:copy>[Synagogue portugaise, p. 2]</xsl:copy>
            </xsl:when> 
                <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="term/persName">
        <xsl:choose>
            <xsl:when test="./text()='Calvinistes'">
                <xsl:copy>[Calvinistes, p. 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Catholiques'">
                <xsl:copy> Catholiques, p. 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Docteur'">
                <xsl:copy> Docteur, p. 1, 2, 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Filles (de Van den Enden)'">
                <xsl:copy> Filles (de Van den Enden), p. 2 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Jésuites'">
                <xsl:copy> Jésuites, p. 2 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Jeune fille de haute nobless'">
                <xsl:copy> Jeune fille de haute noblesse, p. 1 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Juifs'">
                <xsl:copy>   Juifs, p. 3 ;</xsl:copy>
            </xsl:when>
            
            <xsl:when test="./text()='LATRÉAUMONT'">
                <xsl:copy> LATRÉAUMONT, p. 1 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='MEDEAMS, Catherine'">
                <xsl:copy>MEDEAMS, Catherine, p. 2 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()=' '">
                <xsl:copy> Peuples de l'Inde, p. 2 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Philosophe'">
                <xsl:copy>Philosophe, p. 1, 2, 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Savant'">
                <xsl:copy>Savant, p. 1, 2, 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Tendre adolescent'">
                <xsl:copy>Tendre adolescent, p. 1 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Turcs'">
                <xsl:copy>Turcs, p. 3 ;</xsl:copy>
            </xsl:when> 
            <xsl:when test="./text()='VAN DEN ENDEN, Affinius (Maître)'">
                <xsl:copy>VAN DEN ENDEN, Affinius (Maître), p. 1, 2, 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='WITT (de), Jean'">
                <xsl:copy>WITT (de), Jean, p. 1, 2 ;</xsl:copy>
            </xsl:when> 
            <xsl:when test="./text()='Luthériens'">
                <xsl:copy>Luthériens, p. 3 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='Femmes (de Van den Enden)'">
                <xsl:copy>Femmes (de Van den Enden), p. 2 ;</xsl:copy>
            </xsl:when>
            <xsl:when test="./text()='SPINOSA, Baruch (Disciple)'">
                <xsl:copy>SPINOSA, Baruch (Disciple), p. 1, 2, 3 ;</xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="."/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>