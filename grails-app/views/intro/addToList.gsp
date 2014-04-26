<%--
  Created by IntelliJ IDEA.
  User: giannis
  Date: 24/4/2014
  Time: 5:17 μμ
--%>
<hr>
<g:each in="${organizationsList}">
    ${it} <g:remoteLink action="removeFromList" update="organizationsList" params="[chosenOrganToDelete:it]">
    <g:img dir="images" file="minus.png" style="cursor:pointer; width: 25px; float: right;" />
</g:remoteLink>
 </g:each>