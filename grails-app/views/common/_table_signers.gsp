<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="firstName"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.ada.label', default: 'Όνομα')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="lastName"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.protocolNumber.label', default: 'Επώνυμο')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="title"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.date.label', default: 'Τίτλος')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="position"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.date.label', default: 'Θέση')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

    </tr>
    </thead>
    <tbody>

    <g:each in="${results}" status="i" var="signerInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <g:if test="${source == 'home'}">

                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}" onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                   ${signerInstance.firstName}
                </g:remoteLink></td>



                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}"
                                  onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.lastName}
                </g:remoteLink>
                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}"
                                  onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.title}
                </g:remoteLink></td>
                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}"
                                  onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.position}
                </g:remoteLink></td>

            </g:if>
            <g:elseif test="${source == 'map'}">

                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}" onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.firstName}
                </g:remoteLink></td>
                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}" onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.lastName}
                </g:remoteLink>
                <td><g:remoteLink controller="search" action="showSignerSigner"
                                  id="${signerInstance.id}" update="${i+1}" onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.title}
                </g:remoteLink></td>
                <td><g:remoteLink controller="search" action="showSigner"
                                  id="${signerInstance.id}" update="${i+1}" onComplete="slideTableRow('${i+1}')"
                                  params="['source': source]" style="display:block">
                    ${signerInstance.position}
                </g:remoteLink></td>

            </g:elseif>
            <g:else>

                <td><g:link controller="search" action="showSigner"
                            id="${signerInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${signerInstance.firstName}
                </g:link></td>
                <td><g:link controller="search" action="showSigner"
                            id="${signerInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${signerInstance.lastName}
                </g:link>
                <td><g:link controller="search" action="showSigner"
                            id="${signerInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${signerInstance.title}
                </g:link></td>
                <td><g:link controller="search" action="showSigner"
                            id="${signerInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${signerInstance.position}
                </g:link></td>

            </g:else>

        </tr>
        <tr >
            <td colspan="4" class="toSlide" id="${i+1}" ></td></tr>
    </g:each>
    </tbody>
</table>