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
    <h1 align="center"><g:message code="approve.header.old" /></h1>

    <div>
        <g:if test="${pre}">
            <table>
                <tr>
                    <td><g:message code="decision.ada.label"/></td>
                    <td><g:message code="decision.subject.label"/></td>
                    <td><g:message code="geo.namegrk.label"/></td>
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
                                              update="${it.decision.id}"><g:message code="approve.approve" /></g:remoteLink>
                                <g:remoteLink action="dis_decision" id="${it.id}"
                                              update="${it.decision.id}"><g:message code="approve.decline" /></g:remoteLink>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </table>
        </g:if>
        <g:else>
            <p align="center">
                <i><g:message code="approve.nothingToApprove" /></i>
            </p>
        </g:else>
    </div>

    <h1 align="center"><g:message code="approve.header.new" /></h1>

    <div>
        <g:if test="${udd}">
            <table>
                <tr>
                    <td><g:message code="decision.ada.label"/></td>
                    <td><g:message code="decision.subject.label"/></td>
                    <td><g:message code="geo.namegrk.label"/></td>
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
                                <g:link action="examine" id="${it.id}"><g:message code="approve.position" /></g:link>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </table>
        </g:if>
        <g:else>
            <p align="center">
                <i><g:message code="approve.header.new" /></i>
            </p>
        </g:else>
    </div>
</div>
</body>
</html>