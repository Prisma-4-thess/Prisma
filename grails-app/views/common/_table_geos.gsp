<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="namegrk"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.ada.label', default: 'Όνομα')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="dimos"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.protocolNumber.label', default: 'Δήμος')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="address"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.date.label', default: 'Διεύθυνση')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>


    </tr>
    </thead>
    <tbody>

    <g:each in="${results}" status="i" var="geoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <g:if test="${source == 'home'}">

                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${geoInstance.namegrk}
                </g:remoteLink></td>



                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${geoInstance.dimos}
                </g:remoteLink>
                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${geoInstance.address}
                </g:remoteLink></td>

            </g:if>
            <g:elseif test="${source == 'map'}">

                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${geoInstance.namegrk}
                </g:remoteLink></td>
                <td><g:remoteLink controller="search" action="showGeo"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${geoInstance.address}
                </g:remoteLink>
                <td><g:remoteLink controller="search" action="showGeoSigner"
                                  id="${geoInstance.id}" update="${"showGeo".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showGeo".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${geoInstance.dimos}
                </g:remoteLink></td>

            </g:elseif>
            <g:else>

                <td><g:link controller="search" action="showGeo"
                            id="${geoInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${geoInstance.namegrk}
                </g:link></td>
                <td><g:link controller="search" action="showGeo"
                            id="${geoInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${geoInstance.address}
                </g:link>
                <td><g:link controller="search" action="showGeo"
                            id="${geoInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${geoInstance.dimos}
                </g:link></td>

            </g:else>

        </tr>
        <tr>
            <td colspan="3" class="toSlide" id="${"showGeo".concat((i + 1).toString())}"></td></tr>
    </g:each>
    </tbody>
</table>