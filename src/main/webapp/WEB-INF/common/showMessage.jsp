<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 26-03-2020
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The Site Says..</title>
    <%@include file="../common/commonlinks.jsp"%>


</head>
<body>
    <div class="container">
        <div class="alert alert-${mtype}" role="alert">
            <h4 class="alert-heading">${heading}</h4>
            <p>${message}</p>
            <hr>
            <p class="mb-0"><button class="btn btn-primary">HOME</button></p>
        </div>
    </div>

</body>
</html>
