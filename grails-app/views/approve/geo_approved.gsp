<p align="center">
    <font color="green"><i>[!]Η τοποθεσία επιβεβαιώθηκε</i></font>
</p>
<g:if test="${decs}">
    <table>
        <tr>
            <td>ΑΔΑ</td>
            <td>Περιγραφή Απόφασης</td>
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
                                      update="${it.decision.id}">Έγκριση</g:remoteLink>
                        <g:remoteLink action="u_dis_decision"
                                      params="[geo_id: geo_id, old_geo_id: old_geo_id]" id="${it.id}"
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