<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 4/23/14
  Time: 4:49 PM
--%>
<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="contextualsearch.decisions.tab" /></a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        <g:render template="/common/decision_list" model="['results': decisions]"/>
        %{--<g:each in="${decisions}">
            ${it.subject}
            <br/>
            <br/>

        </g:each>--}%
    </div></div>

<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="contextualsearch.signers.tab" /></a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        %{--     <g:each in="${signers}">
                 ${it}
                 <br/>
             </g:each>--}%
        <g:render template="/common/signer_list" model="['results': signers]"/>

    </div></div>

<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="contextualsearch.types.tab" /></a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        %{--<ul>
            <g:each in="${types}">
                <li>
                    <g:link controller="search" action="showType" id="${it.id}">${it}</g:link>
                </li>

            </g:each>
        </ul>--}%
        <g:render template="/common/type_list" model="['results': types]"/>
    </div></div>

<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="contextualsearch.geos.tab" /></a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        %{--<ul>
            <g:each in="${geos}">
                <li>
                    <g:link controller="search" action="showGeo" id="${it.id}" >${it}</g:link>
                </li>

            </g:each>
        </ul>--}%
        <g:render template="/common/geo_list" model="['results': geos]"/>
    </div></div>

<div class="clear"></div>