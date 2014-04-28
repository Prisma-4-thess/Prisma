<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 4/17/14
  Time: 2:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <resource:autoComplete skin="default"/>
    %{--<resource:tooltip/>--}%
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="global_main"/>
</head>

<body>

<!--start portfolio------>
<div>
    <div class="wrap" id="portfolio">
        <div class="main">
            <!-- start gallery  -->
            <div class="gallery1">
                <!---start-content---->
                <div class="gallery">
                    <div class="clear"></div>
                    <g:formRemote id="searchForm" name="full_search"
                                  url="[controller: 'search', action: 'searchfull']" update="results"
                                  onComplete="hideDecisionShowResults();">
                        <div class="container">
                            <h2><g:message code="dedicatedSearchPage.search.header" /></h2>

                            <p><g:message code="search.landing.paragraph" /></p>

                            <div class="search_table">
                                <script type="text/javascript">
                                    function clearAll() {
                                        document.getElementById(
                                                "searchForm").reset();
                                        <g:remoteFunction controller="ajax" action="clearGlobal"/>
                                        document
                                                .getElementById("portfoliolist").style["display"] = "inline-block";
                                    }

                                </script>
                                <ul id="filters" class="clearfix">
                                    <li><span class="filter" data-filter="ada"
                                              onClick="clearAll();"><g:message code="search.searchBy.ada" /></span></li>
                                    <li><span class="filter"
                                              data-filter="prot_num unit org signer fromDate toDate"
                                              onClick="clearAll();"><g:message code="search.searchBy.specific" /></span></li>
                                    <li><span class="filter"
                                              data-filter="subject type tag fromDate toDate"
                                              onClick="clearAll();"><g:message code="search.searchBy.general" /></span></li>
                                    <li><span class="filter"
                                              data-filter="ada prot_num unit org signer subject type tag fromDate toDate"
                                              onClick="clearAll();"><g:message code="search.searchBy.full" /></span></li>
                                    <li><g:submitButton class="search_button" name=" "/></li>
                                    <li><input type='reset' class="clear_button" value=' '/></li>
                                    <li><div id="spinner" class="spinner"
                                             style="display: none;">
                                        <g:message code="spinner.alt" default="Loading&hellip;"/>
                                    </div></li>
                                </ul>

                            </div>

                            <div id=search_params>

                                <div id="portfoliolist">
                                    <ul>
                                        <li><div class="portfolio ada" data-cat="ada">
                                            <label for="ada"><g:message code="decision.ada.label"/>:<br/></label>
                                            <g:textField name="ada"
                                                         title="${message(code:'decision.ada.tooltip')}"/>
                                            <richui:tooltip id="ada"/>
                                            <%--<div class="popup">some text here</div>
                                        --%>
                                        </div></li>
                                        <li><div class="portfolio prot_num" data-cat="prot_num">
                                            <label for="prot_num"><g:message code="decision.protocolNumber.label"/>:<br/></label>
                                            <g:textField name="prot_num"
                                                         title="Πληκρολογείστε τον Αριθμό Πρωτοκόλου της απόφασης που αναζητείτε."/>
                                            <richui:tooltip id="prot_num"/>
                                        </div></li>
                                        <li><div class="portfolio unit" data-cat="unit">
                                            <label for="unit"><g:message code="unit.label"/>:</label>
                                            <richui:autoComplete name="unit"
                                                                 title="${message(code:'decision.unit.tooltip')}"
                                                                 action="${createLinkTo('dir': 'ajax/unitAJAX')}"
                                                                 onItemSelect="${remoteFunction(controller: 'ajax', action: 'selUn', params: '\'id=\' + id')}"/>
                                            <richui:tooltip id="unit"/>
                                        </div></li>
                                        <li><div class="portfolio org" data-cat="org">
                                            <label for="org"><g:message code="organization.label"/>:</label>
                                            <g:select id="org" class="dropdownMenu" name="org"
                                                      from="${prisma.Organization.findAllByToShow(true)}"
                                                      noSelection="${[null: message(code:"decision.org.selectOrg")]}"
                                                      onchange="${remoteFunction(controller: 'ajax', action: 'selOrg', params: '\'id=\' + this.value')}"/>
                                        </div></li>
                                        <li><div class="portfolio signer" data-cat="signer">
                                            <label for="signer"><g:message code="signer.label"/>:</label>
                                            <richui:autoComplete name="signer"
                                                                 title="${message(code:'decision.signer.tooltip')}"
                                                                 action="${createLinkTo('dir': 'ajax/signerAJAX')}"/>
                                            <richui:tooltip id="signer"/>
                                        </div></li>
                                        <li><div class="portfolio subject" data-cat="subject">
                                            <label for="subject"><g:message code="decision.subject.label"/>:<br/></label>
                                            <g:textField name="subject"
                                                         title="${message(code:'decision.subject.tooltip')}"/>
                                            <richui:tooltip id="subject"/>
                                        </div></li>
                                        <li><div class="portfolio type" data-cat="type">
                                            <label for="type"><g:message code="type.label"/>:</label>
                                            <richui:autoComplete name="type"
                                                                 title="${message(code:'decision.type.tooltip')}"
                                                                 action="${createLinkTo('dir': 'ajax/typeAJAX')}"/>
                                            <richui:tooltip id="type"/>
                                        </div></li>
                                        <li><div class="portfolio tag" data-cat="tag">
                                            <label for="tag"><g:message code="tag.label"/>:</label>
                                            <richui:autoComplete name="tag"
                                                                 title="${message(code:'decision.tag.tooltip')}"
                                                                 action="${createLinkTo('dir': 'ajax/tagAJAX')}"/>
                                            <richui:tooltip id="tag"/>
                                        </div></li>
                                        <li><div id="fromDate" class="portfolio fromDate"
                                                 data-cat="fromDate">
                                            <label for="fromDate"><g:message code="search.from.date" />:<br/></label>
                                            <g:datePicker id="datePicker" name="fromDate"
                                                          precision="day" noSelection="['': message(code:'search.noSelection.Date')]"
                                                          default="none"
                                                          years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
                                        </div></li>
                                        <li><div id="toDate" class="portfolio toDate"
                                                 data-cat="toDate">
                                            <label for="toDate"><g:message code="search.to.date" /><br/></label>
                                            <g:datePicker id="datePicker" class="dropdownMenu"
                                                          name="toDate" precision="day"
                                                          noSelection="['': message(code:'search.noSelection.Date')]" default="none"
                                                          years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
                                        </div></li>
                                        <li><input name="pageId" type="hidden" value="home"/></li>
                                    </ul>
                                </div>

                                <div id="results"></div>

                                <div id="decision"></div>
                            </div>

                        </div>

                    </g:formRemote>

                </div>
                <!-- container -->
                <%--<script type="text/javascript"
                    src="${resource(dir: 'js', file: 'fliplightbox.min.js')}"></script>
                <script type="text/javascript">
                    $('body').flipLightBox()
                </script>

                --%>
                <div class="clear"></div>

            </div>

        </div>
        <!---End-gallery----->

    </div>

</div>
<!--end portfolio------>

<div class="clear"></div>
</body>
</html>