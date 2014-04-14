<div class="nav nav-left">
    <ul>
        <li class="active"><a>Προτεινομενες Θεσεις</a></li>
    </ul>
</div>

<div class="clear"></div>

<div id="suggestionButtons">
    <table id="one-column-emphasis">
        <g:each status="i" in="${geo}" var="item">
            <g:if test="${(i % 2) == 0}">
                <tr>
            </g:if>
            <td><input class="suggestionButton" type="button"
                       value="${item.namegrk}"
                       onClick="updateFields('${item.namegrk}', ${item.latitude}, ${item.longitude}, '${item.address}')"/>
            </td>
            <g:if test="${(i % 2) != 0}">
                </tr>
            </g:if>
        </g:each>

    </table>
</div>

