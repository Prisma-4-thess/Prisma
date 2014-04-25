<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 4/23/14
  Time: 4:49 PM
--%>
<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a>Αποφασεις</a></li>

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
        <li class="active"><a>Υπογραφοντες</a></li>

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
        <li class="active"><a>Τυποι Αποφασεων</a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        <ul>
            <g:each in="${types}">
                <li>
                    <g:link controller="search" action="showType" id="${it.id}">${it}</g:link>
                </li>

            </g:each>
        </ul>
    </div></div>

<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a>Γεωγραφικες Θεσεις</a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        <ul>
            <g:each in="${geos}">
                <li>
                    <g:link controller="search" action="showGeo" id="${it.id}" >${it}</g:link>
                </li>

            </g:each>
        </ul>
    </div></div>

<div class="clear"></div>