<table>
    <thead>
    <tr>
        <g:sortableColumn property="label"
                          title="${message(code: 'organization.label.label', default: 'Label')}"/>
    </tr>
    </thead>
    <tbody>
    <g:each in="${orgsFromDatabase}" status="i" var="organizations" >
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>
                ${organizations}
                <g:remoteLink action="removeFromList" update="organizationsList" params="[chosenOrganToDelete:organizations]">
                    <g:img dir="images" file="minus.png" class="plusMinus"/>
                </g:remoteLink>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>