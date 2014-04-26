<%--
  Created by IntelliJ IDEA.
  User: giannis
  Date: 23/4/2014
  Time: 4:56 μμ
--%>

<table>
    <thead>
    <tr>
        <g:sortableColumn property="label"
                          title="${message(code: 'organization.label.label', default: 'Label')}"/>
    </tr>
    </thead>
<tbody>
<g:each in="${sortedOrgazizations}" status="i"  var="sortedOrgan">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
    <td>
    ${sortedOrgan} <g:remoteLink action="addToList" update="organizationsList" params="[chosenOrgan:sortedOrgan]">
        <g:img dir="images" file="plus.png" style="cursor:pointer; width: 25px; float: right;" />
    </g:remoteLink>
    </td>
    </tr>
</g:each>
</tbody>
</table>


