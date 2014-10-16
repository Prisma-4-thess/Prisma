<table id="one-column-emphasis" class="search_table">
%{--<tr>
    <th><g:if test="${source == "map"}">
    <%--<g:link mapping="rootUrl">←</g:link>
        --%>
    </g:if> <g:elseif test="${source == "home"}">
        <g:remoteLink onComplete="hideDecisionShowResults();">←</g:remoteLink>
    </g:elseif> <g:else>

    </g:else></th>
</tr>--}%
    <g:if test="${dec2}">

        <g:each in="${dec2}">
            <tr>
                <th><font color="red"><g:message code="search.showDecision.hasBeenCorrected"/>
                </font>%{--<g:if test="${source == 'home'}">
                    <g:remoteLink controller="search" action="showDecision" id="${it.id}"
                                  update="decision" onComplete="hideResultsShowDecision();"
                                  params="['source': source]">--}%
                ${it.ada}
                %{--                    </g:remoteLink>
                                </g:if> <g:else>
                                    <g:remoteLink controller="search" action="showDecision" id="${it.id}"
                                                  update="decision" params="['source': source]">
                                        ${it.ada}
                                    </g:remoteLink>
                                </g:else>--}%
                </th>
            </tr>
        </g:each>

    </g:if>
    <tr>
        <th><g:message code="decision.ada.label"/>
        <th>
        <th>
            ${decision.ada}

        <th>
    </tr>
    <g:if test="${decision.protocolNumber}">
        <tr>
            <td><g:message code="decision.protocolNumber.label"/>
            <td>
            <td>
                ${decision.protocolNumber}

            <td>
        </tr>
    </g:if>
    <tr>
        <td><g:message code="decision.subject.label"/>
        <td>
        <td>
            ${decision.subject}

        <td>
    </tr>
    <tr>
        <td><g:message code="decision.date.label"/>
        <td>
        <td>
            <g:formatDate date="${decision.date}"/>

        <td>
    </tr>
    <tr>
        <td><g:message code="type.label"/>
        <td>
        <td>
            ${decision.type}

        <td>
    </tr>
    <tr>
        <td><g:message code="tag.label"/>
        <td>
        <td><g:each in="${decision.tags}">
            ${it.label}<br>
        </g:each>
        <td>
    </tr>
    <tr>
        <td><g:message code="organization.label"/>
        <td>
        <td>
            ${org}

        <td>
    </tr>
    <tr>
        <td><g:message code="unit.label"/>
        <td>
        <td>
            ${decision.unit}

        <td>
    </tr>
    <tr>
        <td><g:message code="signer.label"/>
        <td>
        <td>
            ${decision.signer}

        <td>
    </tr>
    <g:each in="${ext}">
        <tr>
            <td>
                ${it.extra.label}

            <td>
            <td>
                ${it.value}

            <td>
        </tr>
    </g:each>
    <g:if test="${decision.decisionToCorrect}">
        <tr>
            <td><g:message code="search.showDecision.corrects"/>
            <td>
            <td>
                ${decision.decisionToCorrect}

            <td>
        </tr>
    </g:if>

    <tr>
        <td><g:message code="signer.position.label" /></td>
        <td>
        <td><g:if test="${decision.geo}">
            <g:link controller="map" action="show_geo"
                    id="${decision.geo.id}" target="_blank">
                ${decision.geo}
            </g:link>
        </g:if> <g:else>
            <g:link controller="defineGeo" action="index"
                    params="['decisionId': decision.id, 'decisionName': decision.ada]"
                    target="_blank">
                <g:message code="search.showDecision.addGeo"/>
            </g:link>
        </g:else>
        <td></td>
    </tr>

    <tr>
        <td><a href="${decision.documentUrl}" target="_blank"><g:message code="search.showDecision.seePdf"/></a></td>
    </tr>
    <g:if test="${relDec}">
        <tr>
            <td><g:remoteLink action="showRelated"
                              onComplete="slideTableRow('${decision.id.toString().concat("related")}')"
                              params="['decisionId': decision.id]"
                              update="${decision.id.toString().concat("related")}"><g:message
                        code="relativeDecision.label"/></g:remoteLink>
            </td>
        </tr>
    </g:if>
    <g:if test="${simDec}">
        <tr>
            <td><g:remoteLink action="showSimilar"
                              onComplete="slideTableRow('${decision.id.toString().concat("similar")}')"
                              params="['decisionId': decision.id]"
                              update="${decision.id.toString().concat("similar")}"><g:message
                        code="similar.label"/></g:remoteLink>
            </td>
        </tr>
    </g:if>
%{-- <tr>
     <th><g:if test="${source == "map"}">
     <%--<g:link mapping="rootUrl">←</g:link>
         --%>
     </g:if> <g:elseif test="${source == "home"}">
         <g:remoteLink onComplete="hideDecisionShowResults();">←</g:remoteLink>
     </g:elseif> <g:else>

     </g:else></th>
 </tr>--}%
</table>

<div class="toSlide" id="${decision.id.toString().concat("related")}"></div>

<div class="toSlide" id="${decision.id.toString().concat("similar")}"></div>

<div id="${decision.id.toString().concat("comments")}" style="display: none;">
    <g:remoteLink controller="search" action="blog" id="${decision.ada}"
                  update="blog">enable blog</g:remoteLink>
    <div id="blog" class="blog">
        <p><g:message code="search.shoDecision.commentsOff"/></p>
    </div>
</div>
