<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 4/17/14
  Time: 2:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="global_main"/>
    <title>Search</title>
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
                            <h2>Αναζήτηση</h2>

                            <p>Επιλέξτε το είδος αναζήτησης που προτιμάτε</p>

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
                                              onClick="clearAll();">ΑΔΑ</span></li>
                                    <li><span class="filter"
                                              data-filter="prot_num unit org signer fromDate toDate"
                                              onClick="clearAll();">Ειδικη</span></li>
                                    <li><span class="filter"
                                              data-filter="subject type tag fromDate toDate"
                                              onClick="clearAll();">Γενικη</span></li>
                                    <li><span class="filter"
                                              data-filter="ada prot_num unit org signer subject type tag fromDate toDate"
                                              onClick="clearAll();">Πληρης</span></li>
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
                                            <label for="ada">ΑΔΑ:<br/></label>
                                            <g:textField name="ada"
                                                         title="Πληκτρολογείστε τον Αριθμό Διαδικτυακής Ανάρτησης
													της απόφασης που αναζητείτε."/>
                                            <richui:tooltip id="ada"/>
                                            <%--<div class="popup">some text here</div>
                                        --%>
                                        </div></li>
                                        <li><div class="portfolio prot_num" data-cat="prot_num">
                                            <label for="prot_num">Αριθμός Πρωτοκόλου:<br/></label>
                                            <g:textField name="prot_num"
                                                         title="Πληκρολογείστε τον Αριθμό Πρωτοκόλου της απόφασης που αναζητείτε."/>
                                            <richui:tooltip id="prot_num"/>
                                        </div></li>
                                        <li><div class="portfolio unit" data-cat="unit">
                                            <label for="unit">Μονάδα:</label>
                                            <richui:autoComplete name="unit"
                                                                 title="Αρχίστε να πληκτρολογείτε το όνομα της μονάδας για την οποία επιθυμείτε να πραγματοποιήσετε αναζήτηση
														και θα εμφανιστούν προτάσεις από τις μονάδες που ανήκουν στον οργανισμό που έχετε επιλέξει.
														Αν δεν έχετε επιλέξει οργανισμό, εμφανίζονται προτάσεις μονάδων από όλους τους οργανισμούς."
                                                                 action="${createLinkTo('dir': 'ajax/unitAJAX')}"
                                                                 onItemSelect="${remoteFunction(controller: 'ajax', action: 'selUn', params: '\'id=\' + id')}"/>
                                            <richui:tooltip id="unit"/>
                                        </div></li>
                                        <li><div class="portfolio org" data-cat="org">
                                            <label for="org">Οργανισμός:</label>
                                            <g:select id="org" class="dropdownMenu" name="org"
                                                      from="${prisma.Organization.findAllByToShow(true)}"
                                                      noSelection="${[null: 'Επιλέξτε Οργανισμό']}"
                                                      onchange="${remoteFunction(controller: 'ajax', action: 'selOrg', params: '\'id=\' + this.value')}"/>
                                        </div></li>
                                        <li><div class="portfolio signer" data-cat="signer">
                                            <label for="signer">Τελικός Υπογράφων:</label>
                                            <richui:autoComplete name="signer"
                                                                 title="Αρχίστε να πληκτρολογείτε το όνομα του τελικού υπογράφων που υπέγραψε την απόφαση που
														αναζητείται και διαλέξτε μία από τις προτάσεις που θα εμφανιστούν.
														Για καλύτερη αναζήτηση πληκτρολογείστε πρώτα το επίθετο του υπογράφων."
                                                                 action="${createLinkTo('dir': 'ajax/signerAJAX')}"/>
                                            <richui:tooltip id="signer"/>
                                        </div></li>
                                        <li><div class="portfolio subject" data-cat="subject">
                                            <label for="subject">Θέμα:<br/></label>
                                            <g:textField name="subject"
                                                         title="Συμπληρώστε το πεδίο με λέξεις κλειδιά που περιγράφουν
													την απόφαση που αναζητείτε."/>
                                            <richui:tooltip id="subject"/>
                                        </div></li>
                                        <li><div class="portfolio type" data-cat="type">
                                            <label for="type">Τύπος Απόφασης:</label>
                                            <richui:autoComplete name="type"
                                                                 title="Αρχίστε να πληκτρολογείτε τον τύπο της απόφασης που αναζητείτε
														και διαλέξτε μία από τις προτάσεις που θα εμφανιστούν."
                                                                 action="${createLinkTo('dir': 'ajax/typeAJAX')}"/>
                                            <richui:tooltip id="type"/>
                                        </div></li>
                                        <li><div class="portfolio tag" data-cat="tag">
                                            <label for="tag">Θεματική Ενότητα:</label>
                                            <richui:autoComplete name="tag"
                                                                 title="Αρχίστε να πληκτρολογείτε την θεματική ενότητα που ανήκει η απόφαση που αναζητείτε
														και επιλέξτε μία από τις προτάσεις που εμφανίζονται."
                                                                 action="${createLinkTo('dir': 'ajax/tagAJAX')}"/>
                                            <richui:tooltip id="tag"/>
                                        </div></li>
                                        <li><div id="fromDate" class="portfolio fromDate"
                                                 data-cat="fromDate">
                                            <label for="fromDate">Από Ημερομηνία:<br/></label>
                                            <g:datePicker id="datePicker" name="fromDate"
                                                          precision="day" noSelection="['': '-No Selection-']"
                                                          default="none"
                                                          years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
                                        </div></li>
                                        <li><div id="toDate" class="portfolio toDate"
                                                 data-cat="toDate">
                                            <label for="toDate">Έως Ημερομηνία<br/></label>
                                            <g:datePicker id="datePicker" class="dropdownMenu"
                                                          name="toDate" precision="day"
                                                          noSelection="['': '-No Selection-']" default="none"
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