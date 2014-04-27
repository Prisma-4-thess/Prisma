<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="label"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.ada.label', default: 'Τύπος')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

    </tr>
    </thead>
    <tbody>

    <g:each in="${results}" status="i" var="typeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


                <td><g:remoteLink controller="search" action="showType"
                                  id="${typeInstance.id}" update="${"showType".concat((i + 1).toString())}"
                                  onComplete="slideTableRow('${"showType".concat((i + 1).toString())}')"
                                  style="display:block">
                    ${typeInstance.label}
                </g:remoteLink></td>

        </tr>
        <tr>
            <td colspan="1" class="toSlide" id="${"showType".concat((i + 1).toString())}"></td></tr>
    </g:each>
    </tbody>
</table>