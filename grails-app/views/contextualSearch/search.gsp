<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 4/23/14
  Time: 4:49 PM
--%>

<div class="nav nav-left">
    <ul>
        <li class="active"><a>Αποφασεις</a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">
        <g:each in="${decisions}">
            ${it.subject}
            <br/>
            <br/>
        </g:each>
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
        <g:each in="${signers}">
            ${it}
            <br/>
        </g:each>
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
        <g:each in="${types}">
            ${it}
            <br/>
        </g:each>
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
        <g:each in="${geos}">
            ${it}
            <br/>
        </g:each>
    </div></div>

<div class="clear"></div>