<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math tei"
    version="3.0">
    
    <xsl:output encoding="UTF-8" media-type="text/tex" omit-xml-declaration="yes" method="text" indent="no" use-character-maps="latex-chars"/>
    
    <xsl:character-map name="latex-chars">
        <xsl:output-character character="~" string="$\sim$"/>
    </xsl:character-map>
    
    <xsl:template match="/">
        \documentclass[12pt,a4paper,twoside]{scrbook}
        \usepackage{scrlayer-scrpage}
        \usepackage{polyglossia}
        \usepackage{libertine}
        \setmainlanguage{english}
        \setotherlanguage{syriac}
        \setotherlanguage{hebrew}
        \setotherlanguage{coptic}
        \setotherlanguage[variant=ancient]{greek}
        \newfontfamily\syriacfont[Script=Syriac,Scale=1.0,ExternalLocation="./fonts/"]{SyrCOMEdessa.otf}
        % \newfontfamily\hebrewfont[ExternalLocation="./fonts/"]{SBL_Hbrw.ttf}
        \newfontfamily\copticfont[ExternalLocation="./fonts/"]{Antinoou.ttf}
        \newfontfamily\greekfont[ExternalLocation="./fonts/]{SBL_grk.ttf}
        \parindent0pt
        \begin{document}
        \tableofcontents
        \part{Introduction}
        \part{Dictionary}
        \chapter{Genesis Rabbah}
        <xsl:for-each select="collection('../dlgenr')/tei:TEI/tei:text/tei:body/tei:entry">
            <xsl:sort select="./tei:form[@type = 'lemma']/tei:orth[@type = 'lemma'][@xml:lang = 'jpa']/text()" data-type="text"/>
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        \end{document}
    </xsl:template>
    
    <xsl:template match="tei:entry">
        <xsl:text>\section*{\foreignlanguage{hebrew}{</xsl:text>
        <xsl:value-of select="tei:form[@type = 'lemma']/tei:orth[@type = 'lemma'][@xml:lang = 'jpa']/text()"/>
        <xsl:text>}}</xsl:text>
        <xsl:text>\addcontentsline{toc}{chapter}{\textbf{\foreignlanguage{hebrew}{</xsl:text>
        <xsl:value-of select="tei:form[@type = 'lemma']/tei:orth[@type = 'lemma'][@xml:lang = 'jpa']/text()"/>
        <xsl:text>}}}</xsl:text>
        <xsl:apply-templates select="child::tei:form[@type = 'lemma']"/>
        <xsl:if test="exists(child::tei:form[@type = 'inflected'])">
            <xsl:text>Inflected:\par</xsl:text>
            <xsl:apply-templates select="child::tei:form[@type = 'inflected']"/>
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
        <xsl:variable name="number-of-senses" select="count(tei:sense)"/>
        <xsl:for-each select="tei:sense">
            <xsl:apply-templates select=".">
                <xsl:with-param name="count" select="position()"/>
                <xsl:with-param name="counting-enabled">
                    <xsl:if test="$number-of-senses gt 1">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                    <xsl:if test="$number-of-senses eq 1">
                        <xsl:value-of select="'false'"/>
                    </xsl:if>
                </xsl:with-param>
            </xsl:apply-templates>
        </xsl:for-each>
        <xsl:apply-templates select="tei:etym"/>
        <xsl:apply-templates select="tei:note"/>
        <xsl:apply-templates select="tei:ref[@type = 'bibliography']"/>
    </xsl:template>
    
    <xsl:template match="tei:form[@type = 'lemma']">
        <xsl:text>\beginL{</xsl:text>
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates select="tei:orth[@type = 'lemma'][@xml:lang = 'jpa']"/>
        <xsl:text>} </xsl:text>
        <xsl:apply-templates select="tei:orth[@type = 'transliteration']"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="tei:pron[@notation = 'rabbinic']"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="tei:gramGrp"/>
        <xsl:text>}\par\vspace{3mm}</xsl:text>
        <xsl:if test="exists(tei:form[@type = 'variant'][not(exists(@source))])">
            <xsl:if test="count(tei:form[@type = 'variant'][not(exists(@source))]) gt 1">
                <xsl:text>Variants:\par</xsl:text>
            </xsl:if>
            <xsl:if test="count(tei:form[@type = 'variant'][not(exists(@source))]) eq 1">
                <xsl:text>Variant:\par</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="tei:form[@type = 'variant'][not(exists(@source))]"/>
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
        <xsl:if test="exists(tei:form[@type = 'variant'][exists(@source)])">
            <xsl:choose>
                <xsl:when test="exists(tei:form[@type = 'variant'][not(exists(@source))])">
                    <xsl:if test="count(child::tei:form[@type = 'variant'][exists(@source)]) gt 1">
                        <xsl:text>Further variants: </xsl:text>
                    </xsl:if>
                    <xsl:if test="count(child::tei:form[@type = 'variant'][exists(@source)]) eq 1">
                        <xsl:text>Further variant: </xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="count(child::tei:form[@type = 'variant'][exists(@source)]) gt 1">
                        <xsl:text>Variants: </xsl:text>
                    </xsl:if>
                    <xsl:if test="count(child::tei:form[@type = 'variant'][exists(@source)]) eq 1">
                        <xsl:text>Variant: </xsl:text>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="tei:form[@type = 'variant'][exists(@source)]">
                <xsl:apply-templates select="./child::node()" mode="further-variants-inline"/>
                <xsl:if test="position() != last()">
                    <xsl:text> - </xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:form[@type = 'inflected']">
        <xsl:apply-templates select="child::node()" mode="variants-inflected"/>
        <xsl:text>\par</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:orth[@xml:lang = 'jpa']" mode="variants-inflected">
        <xsl:text>\leavevmode\hbox{}\hspace{5mm}</xsl:text>
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:orth[@xml:lang = 'fjb']" mode="variants-inflected">
        <xsl:text> 〈</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>〉 </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pron[@notation = 'rabbinic']" mode="variants-inflected">
        <xsl:text> |</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>| </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:gramGrp" mode="variants-inflected">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:orth[@type = 'lemma'][@xml:lang = 'jpa']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:orth[@type = 'transliteration']">
        <xsl:text> 〈</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>〉 </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pron[@notation = 'rabbinic']">
        <xsl:text> |</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>| </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:gramGrp[parent::tei:form[@type = 'lemma']]">
        <xsl:for-each select="tei:gram">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:gram">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:form[@type = 'variant'][not(exists(@source))]">
        <xsl:text>\beginL{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}\par</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:lbl[parent::tei:usg[parent::tei:cit[@type = 'translationEquivalent']]]">
        <xsl:text>\leavevmode\hbox{}\hspace{5mm}</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>: </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:orth[@type = 'variant'][@xml:lang = 'jpa'][parent::tei:form[@type = 'variant']]">
        <xsl:if test="not(exists(parent::tei:form/tei:lbl))">
            <xsl:text>\leavevmode\hbox{}\hspace{5mm}</xsl:text>
        </xsl:if>
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:gramGrp[parent::tei:form[@type = 'variant']]">
        <xsl:apply-templates select="child::node()"/>    
    </xsl:template>
    
    <xsl:template match="tei:orth[@xml:lang = 'jpa']" mode="further-variants-inline">
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>} </xsl:text>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="parent::tei:form/@source"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:orth[@type = 'transliteration']" mode="further-variants-inline">
        <xsl:text>〈</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pron[@notation = 'rabbinic']" mode="further-variants-inline">
        <xsl:text>|</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>|</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:sense">
        <xsl:param name="count"/>
        <xsl:param name="counting-enabled"/>
        <xsl:if test="$counting-enabled = 'true'">
            <xsl:text>\textbf{</xsl:text>
            <xsl:value-of select="$count"/>
            <xsl:text>.)} </xsl:text>
        </xsl:if>
        <xsl:for-each select="tei:cit[@type = 'translation'][@subtype = 'sense']">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>; </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>\par\vspace{3mm}</xsl:text>
        <xsl:if test="exists(child::tei:usg[exists(child::text())])">
            <xsl:text>Usage:\par </xsl:text>
            <xsl:for-each select="tei:usg">
                <xsl:apply-templates select="."/>
                <xsl:if test="position() != last()"><xsl:text>\par </xsl:text></xsl:if>
            </xsl:for-each>
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="tei:cit[@type = 'translationEquivalent']"/>
        <xsl:text>\par\vspace{3mm}</xsl:text>
        <xsl:variable name="number-of-examples" select="count(tei:cit[@type = 'example'])"/>
        <xsl:for-each select="tei:cit[@type = 'example']">
            <xsl:apply-templates select=".">
                <xsl:with-param name="number-of-example">
                    <xsl:value-of select="position()"/>
                </xsl:with-param>
                <xsl:with-param name="counting-of-examples-enabled">
                    <xsl:if test="$number-of-examples eq 1">
                        <xsl:value-of select="'false'"/>
                    </xsl:if>
                    <xsl:if test="$number-of-examples gt 1">
                        <xsl:value-of select="'true'"/>
                    </xsl:if>
                </xsl:with-param>
            </xsl:apply-templates>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'translation'][@subtype = 'sense']">
        <xsl:text>\textbf{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'translationEquivalent'][@xml:lang = 'grc']">
        <xsl:text>Translation equivalent: </xsl:text>
        <xsl:apply-templates select="child::node()" mode="translation-equivalent-greek"/>
        <xsl:text>\par </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'example']">
        <xsl:param name="number-of-example"/>
        <xsl:param name="counting-of-examples-enabled"/>
        <xsl:if test="$counting-of-examples-enabled = 'true'">
            <xsl:value-of select="$number-of-example"/>
            <xsl:text>.) </xsl:text>
        </xsl:if>
        <xsl:value-of select="tei:bibl/tei:ref[@type = 'witness'][1]/text()"/>
        <xsl:text> [</xsl:text>
        <xsl:value-of select="tei:bibl/tei:ref[@type = 'witness'][2]/text()"/>
        <xsl:text>]\par\vspace{3mm}</xsl:text>
        <xsl:apply-templates select="child::node()[not(self::tei:bibl)]"/>
    </xsl:template>
    
    <xsl:template match="tei:quote[parent::tei:cit[@type = 'example']]">
        <xsl:text>\begin{hebrew}</xsl:text>
        <xsl:apply-templates select="child::text() | child::tei:app" mode="create-example-aramaic-text"/>
        <xsl:text>\end{hebrew}\par\vspace{3mm}</xsl:text>
        <xsl:if test="exists(tei:app)">
            <xsl:apply-templates select="tei:app" mode="create-apparatus"/>
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="text()" mode="create-example-aramaic-text">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="tei:app" mode="create-example-aramaic-text">
        <xsl:value-of select="./tei:lem/text()"/>
    </xsl:template>
    
    <xsl:template match="tei:app" mode="create-apparatus">
        <xsl:text>\leavevmode\hbox{}\hspace{10mm}</xsl:text>
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:value-of select="tei:lem/text()"/>
        <xsl:text>} - </xsl:text>
        <xsl:apply-templates select="child::tei:rdg" mode="create-apparatus"/>
        <xsl:text>\par </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:rdg" mode="create-apparatus">
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>} (</xsl:text>
        <xsl:if test="contains(@wit,' ')">
            <xsl:for-each select="tokenize(@wit,' ')">
                <xsl:if test="starts-with(.,'#')">
                    <xsl:value-of select="substring-after(.,'#')"/>
                </xsl:if>
                <xsl:if test="not(starts-with(.,'#'))">
                    <xsl:value-of select="."/>
                </xsl:if>
                <xsl:if test="position() != last()">
                    <xsl:text> </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="not(contains(@wit,' '))">
            <xsl:if test="starts-with(@wit,'#')">
                <xsl:value-of select="substring-after(@wit,'#')"/>
            </xsl:if>
            <xsl:if test="not(starts-with(@wit,'#'))">
                <xsl:value-of select="@wit"/>
            </xsl:if>
        </xsl:if>
        <xsl:text>) </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'translation'][parent::tei:cit[@type = 'example']]">
        <xsl:if test="local-name(preceding-sibling::*[1]) = 'ref'">
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>\par\vspace{3mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:usg" mode="translation-equivalent-greek">
        <xsl:apply-templates select="child::node()" mode="translation-equivalent-greek"/>
    </xsl:template>
    
    <xsl:template match="tei:lang" mode="translation-equivalent-greek">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:quote" mode="translation-equivalent-greek">
        <xsl:text>\foreignlanguage{greek}{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'translationEquivalent'][@xml:lang = 'la']">
        <xsl:text>Translation equivalent:</xsl:text>
        <xsl:apply-templates select="child::node()" mode="translation-equivalent-latin"/>
        <xsl:text>\par </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:usg" mode="translation-equivalent-latin">
        <xsl:apply-templates select="child::node()" mode="translation-equivalent-latin"/>
    </xsl:template>
    
    <xsl:template match="tei:lang" mode="translation-equivalent-latin">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:quote" mode="translation-equivalent-latin">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>\par\vspace{3mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:foreign[@xml:lang = 'jpa']">
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:foreign[@xml:lang = 'cop']">
        <xsl:text>\foreignlanguage{coptic}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:foreign[@xml:lang = 'grc']">
        <xsl:text>\foreignlanguage{greek}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:foreign[@xml:lang = 'syc']">
        <xsl:text>\foreignlanguage{syriac}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:term[@xml:lang = 'jpa']">
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:term[@xml:lang = 'cop']">
        <xsl:text>\foreignlanguage{coptic}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:term[@xml:lang = 'grc']">
        <xsl:text>\foreignlanguage{greek}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:term[@xml:lang = 'syc']">
        <xsl:text>\foreignlanguage{syriac}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:term[@xml:lang = 'rabbinic']">
        <xsl:text>|</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>|</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:term[@xml:lang = 'fjb']">
        <xsl:text>〈</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>〉</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:bibl[@type = 'ancient']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:bibl[@type = 'modern']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:ref[@xml:lang = 'jpa']">
        <xsl:if test="./parent::tei:cit/parent::tei:sense">
            <xsl:text>\leavevmode\hbox{}\hspace{5mm}</xsl:text>
        </xsl:if>
        <xsl:text>$\rightarrow$ </xsl:text>
        <xsl:text>\foreignlanguage{hebrew}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>} </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:ref[@xml:lang = 'cop']">
        <xsl:text>$\rightarrow$ </xsl:text>
        <xsl:text>\foreignlanguage{coptic}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>} </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:ref[@xml:lang = 'fjb']">
        <xsl:text>$\rightarrow$ </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="tei:usg[exists(child::text())]">
        <xsl:text>\leavevmode\hbox{}\hspace{5mm}</xsl:text>
        <xsl:choose>
            <xsl:when test="@type = 'attitude'"><xsl:value-of select="'Attitude'"/></xsl:when>
            <xsl:when test="@type = 'domain'"><xsl:value-of select="'Domain'"/></xsl:when>
            <xsl:when test="@type = 'frequency'"><xsl:value-of select="'Frequency'"/></xsl:when>
            <xsl:when test="@type = 'geographic'"><xsl:value-of select="'Geographic distribution'"/></xsl:when>
            <xsl:when test="@type = 'hint'"><xsl:value-of select="'Hint'"/></xsl:when>
            <xsl:when test="@type = 'meaningType'"><xsl:value-of select="'Meaning type'"/></xsl:when>
            <xsl:when test="@type = 'normativity'"><xsl:value-of select="'Normativity'"/></xsl:when>
            <xsl:when test="@type = 'socioCultural'"><xsl:value-of select="'Socio-cultural norm'"/></xsl:when>
            <xsl:when test="@type = 'textType'"><xsl:value-of select="'Text type'"/></xsl:when>
            <xsl:when test="@type = 'time'"><xsl:value-of select="'Time'"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
        </xsl:choose>
        <xsl:text>: </xsl:text>
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>

    <xsl:template match="tei:ref[@type = 'bibliography']">
        <xsl:text>Bibliography:\par</xsl:text>
<xsl:for-each select="tei:bibl"><xsl:apply-templates select="./child::node()"/><xsl:if test="position() != last()"><xsl:text>;</xsl:text></xsl:if><xsl:if test="position() = last()"><xsl:text>.</xsl:text></xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:title">
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>,</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:citedRange">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:etym">
        <xsl:text>Etymology </xsl:text>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>): </xsl:text>
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:lbl[parent::tei:etym]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:lang">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'etymon'][@xml:lang = 'grc']">
        <xsl:apply-templates mode="greek-etymon"/>
    </xsl:template>
    
    <xsl:template match="tei:cit[@type = 'etymon'][@xml:lang = 'la']">
        <xsl:apply-templates mode="latin-etymon"/>
    </xsl:template>
    
    <xsl:template match="tei:xr" mode="latin-etymon">
        <xsl:apply-templates mode="latin-etymon"/>
    </xsl:template>
    
    <xsl:template match="tei:xr" mode="greek-etymon">
        <xsl:apply-templates mode="greek-etymon"/>
    </xsl:template>
    
    <xsl:template match="tei:lbl" mode="latin-etymon">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:lbl" mode="greek-etymon">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:ref[@type = 'entry']" mode="latin-etymon">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:ref[@type = 'entry']" mode="greek-etymon">
        <xsl:text>\foreignlanguage{greek}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>