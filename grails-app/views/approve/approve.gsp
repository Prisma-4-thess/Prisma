<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:javascript library="jquery"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Insert title here</title>
</head>

<body>
<div class="body">
    <h1 align="center">Επιβεβαίωση συνδεδεμένων αποφάσεων με ήδη
    ορισμένα σημεία ενδιαφέροντος</h1>

    <div>
        <g:if test="${pre}">
            <table>
                <tr>
                    <td>ΑΔΑ</td>
                    <td>Περιγραφή Απόφασης</td>
                    <td>Τοποθεσία</td>
                </tr>
                <g:each in="${pre}">
                    <tr>
                        <td>
                            ${it.decision.ada}
                        </td>
                        <td>
                            ${it.decision.subject}
                        </td>
                        <td>
                            ${it.geo.namegrk}
                        </td>
                        <td>
                            <div id="${it.decision.id}">
                                <g:remoteLink action="app_decision" id="${it.id}"
                                              update="${it.decision.id}">Έγκριση</g:remoteLink>
                                <g:remoteLink action="dis_decision" id="${it.id}"
                                              update="${it.decision.id}">Απόρριψη</g:remoteLink>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </table>
        </g:if>
        <g:else>
            <p align="center">
                <i>Δεν υπάρχουν απόφασεις που χρειάζονται επιβεβαίωση</i>
            </p>
        </g:else>
    </div>

    <h1 align="center">Επιβεβαίωση συνδεδεμένων αποφάσεων με
    καινούρια σημεία ενδιαφέροντος</h1>

    <div>
        <g:if test="${udd}">
            <table>
                <tr>
                    <td>ΑΔΑ</td>
                    <td>Περιγραφή Απόφασης</td>
                    <td>Τοποθεσία</td>
                </tr>
                <g:each in="${udd}">
                    <tr>
                        <td>
                            ${it.decision.ada}
                        </td>
                        <td>
                            ${it.decision.subject}
                        </td>
                        <td>
                            ${it.geo.namegrk}
                        </td>
                        <td>
                            <div id="${it.decision.id}">
                                <g:link action="examine" id="${it.id}">Εποπτεία θέσης και συσχέτισης</g:link>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </table>
        </g:if>
        <g:else>
            <p align="center">
                <i>Δεν υπάρχουν απόφασεις που χρειάζονται επιβεβαίωση</i>
            </p>
        </g:else>
    </div>
</div>
</body>
</html>