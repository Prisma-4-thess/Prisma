<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="namegrk"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.ada.label', default: 'Όνομα')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="dimos"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.protocolNumber.label', default: 'Δήμος')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="address"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.date.label', default: 'Διεύθυνση')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>


    </tr>
    </thead>
    <tbody>

    <g:each in="${results}" status="i" var="geoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  style="display:block">
                    ${geoInstance.namegrk}
                </g:remoteLink></td>



                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  style="display:block">
                    ${geoInstance.dimos}
                </g:remoteLink>
                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  style="display:block">
                    ${geoInstance.address}
                </g:remoteLink></td>
        </tr>
        <tr>
            <td colspan="3" class="toSlide" id="${"showGeo".concat((i + 1).toString())}"></td></tr>
    </g:each>
    </tbody>
</table>