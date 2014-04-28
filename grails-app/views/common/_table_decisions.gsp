<table id="one-column-emphasis" class="search_table">
    <thead>
    <tr>

        <util:remoteSortableColumn property="ada"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.ada.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <th><g:message code="decision.subject.label" default="Θέμα"/></th>

        <util:remoteSortableColumn property="protocolNumber"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.protocolNumber.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <util:remoteSortableColumn property="date"
                                   update="one-column-emphasis" action="sort"
                                   title="${message(code: 'decision.date.label')}"
                                   params="['offset': offset, 'timeStamp': timeStamp]"/>

        <th><g:message code="unit.label.label"/></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${results}" status="i" var="decisionInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:remoteLink controller="search" action="showDecision"
                              id="${decisionInstance.id}" update="${"showDecision".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showDecision".concat((i + 1).toString())}')"
                              style="display:block">
                ${decisionInstance.ada}
            </g:remoteLink></td>
            <td><g:remoteLink controller="search" action="showDecision"
                              id="${decisionInstance.id}" update="${"showDecision".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showDecision".concat((i + 1).toString())}')"
                              style="display:block">
                ${decisionInstance.subject.take(85)}<g:if
                        test="${decisionInstance.subject.length() > 85}">...</g:if>
            </g:remoteLink>
            <td><g:remoteLink controller="search" action="showDecision"
                              id="${decisionInstance.id}" update="${"showDecision".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showDecision".concat((i + 1).toString())}')"
                              style="display:block">
                ${decisionInstance.protocolNumber}
            </g:remoteLink></td>
            <td><g:remoteLink controller="search" action="showDecision"
                              id="${decisionInstance.id}" update="${"showDecision".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showDecision".concat((i + 1).toString())}')"
                              style="display:block">
                <g:formatDate date="${decisionInstance.date}"/>
            </g:remoteLink></td>
            <td><g:remoteLink controller="search" action="showDecision"
                              id="${decisionInstance.id}" update="${"showDecision".concat((i + 1).toString())}"
                              onComplete="slideTableRow('${"showDecision".concat((i + 1).toString())}')"
                              style="display:block">
                ${decisionInstance.unit}
            </g:remoteLink></td>

        </tr>
        <tr>
            <td colspan="5" class="toSlide" id="${"showDecision".concat((i + 1).toString())}"></td></tr>
    </g:each>
    </tbody>
</table>