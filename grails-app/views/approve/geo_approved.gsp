<p align="center">
    <font color="green"><i>[!]<g:message code="approve.geoApproved" /></i></font>
</p>
<g:if test="${decs}">
    <table>
        <tr>
            <td><g:message code="decision.ada.label"/></td>
            <td><g:message code="decision.subject.label"/></td>
        </tr>
        <g:each in="${decs}">
            <tr>
                <td>
                    ${it.decision.ada}
                </td>
                <td>
                    ${it.decision.subject}
                </td>
                <td>
                    <div id="${it.decision.id}">
                        <g:remoteLink action="u_app_decision"
                                      params="[geo_id: geo_id, old_geo_id: old_geo_id]" id="${it.id}"
                                      update="${it.decision.id}"><g:message code="approve.approve"/></g:remoteLink>
                        <g:remoteLink action="u_dis_decision"
                                      params="[geo_id: geo_id, old_geo_id: old_geo_id]" id="${it.id}"
                                      update="${it.decision.id}"><g:message code="approve.decline"/></g:remoteLink>
                    </div>
                </td>
            </tr>
        </g:each>
    </table>
</g:if>
<g:else>
    <p align="center">
        <i><g:message code="approve.nothingToApprove"/></i>
    </p>
</g:else>