<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="label"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.ada.label', default: 'Τύπος')}"
                                   params="['offset': offset, 'source': source, 'timeStamp': timeStamp]"/>

    </tr>
    </thead>
    <tbody>

    <g:each in="${results}" status="i" var="typeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <g:if test="${source == 'home'}">

                <td><g:remoteLink controller="search" action="showType"
                                  id="${typeInstance.id}" update="${"showType".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showType".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${typeInstance.label}
                </g:remoteLink></td>


            </g:if>
            <g:elseif test="${source == 'map'}">

                <td><g:remoteLink controller="search" action="showType"
                                  id="${typeInstance.id}" update="${"showType".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showType".concat((i + 1).toString())}')"
                                  params="['source': source]" style="display:block">
                    ${typeInstance.label}
                </g:remoteLink></td>


            </g:elseif>
            <g:else>

                <td><g:link controller="search" action="showType"
                            id="${typeInstance.id}" params="['source': source]"
                            style="display:block" target="_blank">
                    ${typeInstance.label}
                </g:link></td>

            </g:else>

        </tr>
        <tr>
            <td colspan="1" class="toSlide" id="${"showType".concat((i + 1).toString())}"></td></tr>
    </g:each>
    </tbody>
</table>