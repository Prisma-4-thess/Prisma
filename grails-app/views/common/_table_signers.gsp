<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="firstName"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'signer.firstName.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="lastName"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'signer.lastName.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="title"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'signer.title.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="position"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'signer.position.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

    </tr>
    </thead>
    <tbody>

    <g:each in="${results}" status="i" var="signerInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:remoteLink controller="search" action="showSigner"
                              id="${signerInstance.id}" update="${"showSigner".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showSigner".concat((i + 1).toString())}')"
                              style="display:block">
                ${signerInstance.firstName}
            </g:remoteLink></td>



            <td><g:remoteLink controller="search" action="showSigner"
                              id="${signerInstance.id}" update="${"showSigner".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showSigner".concat((i + 1).toString())}')"
                              style="display:block">
                ${signerInstance.lastName}
            </g:remoteLink>
            <td><g:remoteLink controller="search" action="showSigner"
                              id="${signerInstance.id}" update="${"showSigner".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showSigner".concat((i + 1).toString())}')"
                              style="display:block">
                ${signerInstance.title}
            </g:remoteLink></td>
            <td><g:remoteLink controller="search" action="showSigner"
                              id="${signerInstance.id}" update="${"showSigner".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showSigner".concat((i + 1).toString())}')"
                              style="display:block">
                ${signerInstance.position}
            </g:remoteLink></td>

        </tr>
        <tr>
            <td colspan="4" class="toSlide" id="${"showSigner".concat((i + 1).toString())}"></td></tr>
    </g:each>
    </tbody>
</table>