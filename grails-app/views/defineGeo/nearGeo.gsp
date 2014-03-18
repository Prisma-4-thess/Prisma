<div class="nav nav-left">
	<ul>
		<li class="active"><a>Προτεινομενες Θεσεις </a></li>
	</ul>
</div>
<div class="clear"></div>

<g:each in="${geo}">
	<input type="button" value="${it.namegrk}"
		onClick="updateFields('${it.namegrk}',${it.latitude},${it.longitude},'${it.address}')" />
	<br />
</g:each>

