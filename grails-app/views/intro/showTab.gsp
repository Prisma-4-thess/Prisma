<div class="pagination">
    <g:each in="${firstChar}">
        <g:remoteLink controller="intro" action="show" id="${it}"
                      update="organizations">
            ${it}
        </g:remoteLink>
    </g:each>
</div>
<div id="organizations"></div>