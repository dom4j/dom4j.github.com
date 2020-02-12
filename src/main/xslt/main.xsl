<xsl:stylesheet version="3.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:f="http://dom4j.github.io/namespaces/function"
                xpath-default-namespace="http://www.w3.org/1999/xhtml">

    <xsl:output encoding="UTF-8" method="html" version="5"/>

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <xsl:apply-templates select="/html/head/*"/>
                <!-- Bootstrap 4 -->
                <link rel="stylesheet"
                      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
                      integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
                      crossorigin="anonymous"/>
                <!-- Font Awesome -->
                <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
                <!-- Prism -->
                <link rel="stylesheet" href="static/css/prism.css"/>
                <!-- local -->
                <link rel="stylesheet" href="static/css/main.css"/>
            </head>
            <body id="top">
                <xsl:call-template name="copy-attributes-from">
                        <xsl:with-param name="node" select="/html/body" />
                </xsl:call-template>
                <div class="container">
                    <div class="header clearfix">
                        <nav>
                            <ul class="nav nav-pills float-right">
                                <li class="nav-item">
                                    <a class="nav-link active" href="/">Home
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Documentation</a>
                                    <div class="dropdown-menu">
                                        <h6 class="dropdown-header">Javadoc</h6>
                                        <a class="dropdown-item" href="/javadoc/2.1.1/">dom4j-2.1.1</a>
                                        <a class="dropdown-item" href="/javadoc/2.0.2/">dom4j-2.0.2</a>
                                        <a class="dropdown-item" href="/javadoc/1.6.1/">dom4j-1.6.1</a>
                                        <a class="dropdown-item" href="http://dom4j.sourceforge.net/dom4j-1.5.2/apidocs/index.html">dom4j-1.5.2</a>
                                        <a class="dropdown-item" href="http://dom4j.sourceforge.net/dom4j-1.4/apidocs/index.html">dom4j-1.4</a>
                                        <hr />
                                        <a class="dropdown-item" href="https://github.com/dom4j/dom4j/wiki">Wiki</a>
                                        <a class="dropdown-item" href="https://github.com/dom4j/dom4j/wiki/Cookbook">Cookbook</a>
                                        <a class="dropdown-item" href="https://github.com/dom4j/dom4j/wiki/FAQ">FAQ</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="https://github.com/dom4j/dom4j" title="Contribute on GitHub"><i class="fa fa-github fa-2x" aria-hidden="true"></i></a>
                                </li>
                            </ul>
                        </nav>
                        <h3 class="text-muted">
                            <xsl:call-template name="dom4j"/>
                        </h3>
                    </div>

                    <xsl:apply-templates select="/html/body/node()"/>
                </div>
                <!-- Bootstrap 4 -->
                <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
                        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
                        crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
                        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
                        crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
                        integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
                        crossorigin="anonymous"></script>
                <!-- Clipboard (pro Prism) -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
                <!-- Prism -->
                <script src="static/js/prism.js"></script>
                <!-- local -->
                <script src="static/js/main.js"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="span[@class='logo']">
        <xsl:call-template name="dom4j"/>
    </xsl:template>

    <xsl:template match="div[@class='card-deck']/div">
        <div>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">card</xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="div[@class='card-deck']/div/div">
        <div>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">card-block</xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="div[@class='card-deck']/div/div/h1 | div[@class='card-deck']/div/div/h2 | div[@class='card-deck']/div/div/h3 |
    div[@class='card-deck']/div/div/h4 | div[@class='card-deck']/div/div/h5 | div[@class='card-deck']/div/div/h6">
        <xsl:copy>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">card-title</xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="div[@class='card-deck']/div/div/div | div[@class='card-deck']/div/div/p | div[@class='card-deck']/div/div/ul |
    div[@class='card-deck']/div/div/ol">
        <xsl:copy>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">card-text</xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="div[@class='dropdown']" priority="10">
        <xsl:copy>
            <xsl:call-template name="copy-attributes"/>
            <xsl:apply-templates select="*[1]"/>
            <div class="dropdown-menu" aria-labelledby="*[1]/@id">
                <xsl:apply-templates select="*[position() gt 1]"/>
            </div>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="div[@class='dropdown']/*[1]">
        <xsl:copy>
            <xsl:attribute name="type">button</xsl:attribute>
            <xsl:attribute name="data-toggle">dropdown</xsl:attribute>
            <xsl:attribute name="aria-haspopup">true</xsl:attribute>
            <xsl:attribute name="aria-expanded">false</xsl:attribute>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">dropdown-toggle</xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="div[@class='dropdown']/*[position() gt 1]">
        <xsl:copy>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">dropdown-item</xsl:with-param>
            </xsl:call-template>
            <xsl:if test="exists(@title)">
                <xsl:attribute name="data-toggle">tooltip</xsl:attribute>
                <xsl:attribute name="data-placement">right</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="div[@class='dropdown']/hr" priority="10">
        <div class="dropdown-divider"></div>
    </xsl:template>

    <xsl:template match="pre[@data-language]">
        <pre>
            <xsl:call-template name="copy-attributes"/>
            <code class="language-{@data-language} line-numbers"><xsl:apply-templates/></code>
        </pre>
    </xsl:template>

    <xsl:template match="div[@class='container']/div">
        <div>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">row</xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates select="div"/>
        </div>
    </xsl:template>

    <xsl:template match="div[@class='container']/div/div">
        <div>
            <xsl:call-template name="copy-attributes"/>
            <xsl:call-template name="class-attribute">
                <xsl:with-param name="value">
                    <xsl:call-template name="compute-col-size"/>
                    <xsl:call-template name="compute-col-offset"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="a/@href">
        <xsl:attribute name="href" select="replace(., '\{github\}', 'https://github.com/dom4j')"/>
    </xsl:template>

    <xsl:template match="/html/head/title">
        <title>dom4j<xsl:if test="exists(text())"> &gt; <xsl:value-of select="." /></xsl:if></title>
    </xsl:template>

    <xsl:template name="dom4j">
        <span class="logo-bracket">&lt;</span>
        <span class="logo-text">dom</span>
        <span class="logo-number">4</span>
        <span class="logo-text">j</span>
        <span class="logo-bracket">&gt;</span>
    </xsl:template>

    <xsl:template name="copy-attributes">
        <xsl:apply-templates select="@*[not(starts-with(local-name(), 'data-xsl-'))]"/>
    </xsl:template>

    <xsl:template name="copy-attributes-from">
        <xsl:param name="node" required="yes"/>
        <xsl:apply-templates select="$node/@*[not(starts-with(local-name(), 'data-xsl-'))]"/>
    </xsl:template>

    <xsl:template name="class-attribute">
        <xsl:param name="value"/>
        <xsl:attribute name="class" select="string(@class), $value"/>
    </xsl:template>

    <xsl:template name="compute-col-size">
        <xsl:variable name="cols"
                      select="12 - 2 * ../@data-xsl-container-padding - (count(../div) - 1) * ../@data-xsl-container-spacing"/>
        <xsl:sequence select="'col-md-' || $cols div count(../div)"/>
    </xsl:template>

    <xsl:template name="compute-col-offset">
        <xsl:if test="position() eq 1 and exists(../@data-xsl-container-padding)">
            <xsl:sequence select="'col-md-offset-' || ../@data-xsl-container-padding"/>
        </xsl:if>
        <xsl:if test="position() gt 1 and exists(../@data-xsl-container-spacing)">
            <xsl:sequence select="'col-md-offset-' || ../@data-xsl-container-spacing"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>