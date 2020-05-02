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
<style>
    .container{
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
    .message{
        width: 50vw;
    }
</style>

</head>
<body>
    <div class="container">
        <div class="alert alert-${mtype} message" role="alert">
            <h4 class="alert-heading">${heading}</h4>
            <p>${message}</p>
            <hr>
            <p class="mb-0"><button class="btn btn-primary">HOME</button></p>
        </div>
    </div>

</body>
</html>
