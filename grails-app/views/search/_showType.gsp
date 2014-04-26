<ul>
    <li>
        <label>Πλήθος Αποφάσεων:</label> <span>${typeDecisions}</span>
    </li>
    <li>
        <label>Επιπλέον χαρακτηριστικά:</label>
        <g:each in="${type.extras}">${it.label}, </g:each>

    </li>
</ul>