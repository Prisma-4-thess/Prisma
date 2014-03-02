<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Search</title>
<g:javascript library="jquery"/>
</head>
<body>
  <div class="body">
  <g:remoteLink controller="search" action="ada"
                update="mainContent">ada search</g:remoteLink><br/>
  <g:remoteLink controller="search" action="sub"
                update="mainContent">subject  search</g:remoteLink><br/>
   <g:remoteLink controller="search" action="signer"
                update="mainContent">signer  search</g:remoteLink><br/>
     <g:remoteLink controller="search" action="prot"
                update="mainContent">protocol  search</g:remoteLink><br/>
      <g:remoteLink controller="search" action="tag"
                update="mainContent">tag  search</g:remoteLink><br/>
                <div id="mainContent" style='float: right; width: 80%; min-height: 500px; background-color: #c0ffc0;'>
            <p>tha allazei dinamika i morfi tou search</p>
        </div>
  </div>
</body>
</html>