<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 25-04-2020
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="../common/commonlinks.jsp"%>
</head>
<body>

<div class="container">
    <form method="post" action="/login" >
        <input type="hidden" name="category" value="user" />
        <fieldset class="form-group">
            <label>Username</label>
            <input type="text" name="username"  class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required/>
        </fieldset>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>
</body>
</html>
