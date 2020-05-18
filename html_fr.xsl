<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:variable name="width">650</xsl:variable>
	<xsl:template match="/">
		<html>
			<head>
				<title>Curriculum Vitae - <xsl:value-of select="/resume/firstname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/resume/lastname"/>
				</title>
				<link href="cv_fr.css" rel="stylesheet"/>
			</head>
			<body>
				<div class="page">
					<center>
						<xsl:apply-templates select="/resume"/>
						<xsl:apply-templates select="/resume/objective[@locale='fr']"/>
						<xsl:apply-templates select="/resume/experiences"/>
						<xsl:apply-templates select="/resume/speaker"/>
						<xsl:apply-templates select="/resume/education"/>
						<!-- <xsl:apply-templates select="/resume/computerskills"/> -->
						<xsl:apply-templates select="/resume/languagelist"/>
						<!-- <xsl:apply-templates select="/resume/micellaneous"/> -->
						<xsl:apply-templates select="/resume/personal[@locale='fr']"/>
					</center>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="resume">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="address">
						<b>
							<xsl:value-of select="/resume/firstname"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="/resume/lastname"/>
						</b>
					</div>
					<div class="address-sub">
						<xsl:value-of select="/resume/address/street"/>
						<br/>
						<xsl:value-of select="/resume/address/zipcode"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="/resume/address/city"/>
					</div>
				</td>
				<td>
					<div class="tablecellright">
						<xsl:text>Tel : </xsl:text>
						<xsl:apply-templates select="/resume/phonelist"/>
						<xsl:variable name="email" select="/resume/email"/>
						<xsl:text>Email : </xsl:text>
						<a href="$email">
							<xsl:value-of select="$email"/>
						</a>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="phonelist">
		<xsl:for-each select="number">
			<xsl:value-of select="."/>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="objective">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="objective">
						<xsl:copy-of select="."/>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="education">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="title">Etudes</div>
				</td>
			</tr>
		</table>
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<xsl:apply-templates select="diploma"/>
		</table>
	</xsl:template>
	<xsl:template match="diploma">
		<tr>
			<td class="diplomadate">
				<div class="date">
					<xsl:copy-of select="date[@locale='fr']"/>
				</div>
			</td>
			<td>
				<div class="tablecellleft">
					<!-- xsl:value-of select="heading[@locale='fr']"/ -->
					<xsl:copy-of select="heading[@locale='fr']"/>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="experiences">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="title">Expériences professionnelles</div>
				</td>
			</tr>
		</table>
		<table class="position">
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<xsl:apply-templates select="company/position"/>
		</table>
		<xsl:apply-templates select="company"/>
	</xsl:template>
	<xsl:template match="company">
		<xsl:variable name="name" select="name[@locale='fr']"/>
		<table class="company">
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="titleright">
						<div class="companyname">
							<xsl:value-of select="$name"/>
							&#160;&#160;
							<font size="-2">
								<xsl:copy-of select="date[@locale='fr']"/>
							</font>
						</div>
						<font size="-2">
							<xsl:copy-of select="description[@locale='fr']"/>
						</font>
					</div>
				</td>
			</tr>
		</table>
		<ul class="keycontribution">
			<xsl:apply-templates select="keycontribution"/>
		</ul>
		<xsl:if test="count(experience)>0">
			<table  class="experience-title">
				<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
				<tr>
					<td>
						<div class="titleright">
							<b>Chronologie des contributions</b>
						</div>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table  class="experience">
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<xsl:apply-templates select="experience"/>
		</table>
		<div class="pagebreak"/>
	</xsl:template>
	<xsl:template match="keycontribution">
		<li class="keycontribution">
			<div class="listcell">
				<xsl:copy-of select="heading[@locale='fr']"/>
			</div>
		</li>
	</xsl:template>
	<xsl:template match="position">
		<tr>
			<td class="positiondate">
				<div class="date">
					<xsl:copy-of select="date[@locale='fr']"/>
				</div>
			</td>
			<td>
				<div class="positiontitle">
					<xsl:copy-of select="positiontitle[@locale='fr']"/>
				</div>
				<div class="positiondesc">
					<xsl:copy-of select="heading[@locale='fr']"/>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="experience">
		<tr>
			<td class="experiencedate">
				<div class="date">
					<xsl:copy-of select="date[@locale='fr']"/>
				</div>
			</td>
			<td>
				<div class="experiencedesc">
					<xsl:copy-of select="heading[@locale='fr']"/>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="speaker">
		<xsl:if test="count(confspeaker)>0">
			<table>
				<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
				<tr>
					<td>
						<div class="titleright">
							<b>Présentations en conférences</b>
						</div>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="confspeaker">
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<xsl:apply-templates select="confspeaker"/>
		</table>
		<div class="pagebreak"/>
	</xsl:template>
	<xsl:template match="confspeaker">
		<tr>
			<td colspan="2">
				<div class="conftitle"><xsl:copy-of select="conftitle[@locale='fr']"/></div>
			</td>
		</tr>
		<tr>
			<td class="confdate">
				<div class="confdate">
					<xsl:copy-of select="date[@locale='fr']"/>
				</div>
			</td>
			<td>
				<div class="conflocation"><xsl:copy-of select="location[@locale='fr']"/></div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="conference">
		<tr>
			<td>
				<div class="date">
					<xsl:copy-of select="date[@locale='fr']"/>
				</div>
			</td>
			<td>
				<div class="tablecellleft">
					<!-- xsl:value-of select="heading[@locale='fr']"/ -->
					<xsl:copy-of select="heading[@locale='fr']"/>
				</div>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="computerskills">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="title">Compétences informatiques</div>
				</td>
			</tr>
		</table>
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<xsl:for-each select="skills">
					<td>
						<div class="columnheader">
							<xsl:value-of select="title[@locale='fr']"/>
						</div>
					</td>
				</xsl:for-each>
			</tr>
			<tr>
				<xsl:for-each select="skills">
					<td>
						<div class="tablecellleft">
							<dl>
								<xsl:apply-templates select="subject"/>
							</dl>
						</div>
					</td>
				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="subject">
		<dt>
			<xsl:value-of select="."/>
		</dt>
	</xsl:template>
	<xsl:template match="languagelist">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="title">Langues</div>
				</td>
			</tr>
		</table>
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<xsl:apply-templates select="language"/>
		</table>
	</xsl:template>
	<xsl:template match="language">
		<xsl:if test="count(name[@locale='fr'])>0">
			<tr>
				<td class="language">
					<div class="tablecellleft">
						<xsl:value-of select="name[@locale='fr']"/>
					</div>
				</td>
				<td>
					<div class="language">
						<xsl:value-of select="level[@locale='fr']"/>
					</div>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template match="micellaneous">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="title">Autres expériences professionnelles</div>
				</td>
			</tr>
		</table>
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<xsl:apply-templates select="experience"/>
		</table>
	</xsl:template>
	<xsl:template match="personal">
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="title">Loisirs, Intérêts personnels</div>
				</td>
			</tr>
		</table>
		<table>
			<xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
			<tr>
				<td>
					<div class="tablecellleft">
						<xsl:value-of select="."/>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
