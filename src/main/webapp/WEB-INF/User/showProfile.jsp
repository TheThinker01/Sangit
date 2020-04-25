<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 25-04-2020
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Profile</title>
    <%@include file="../common/commonlinks.jsp"%>
</head>
<body>

<div class="container">
    <form method="post" action="/updateProfile?id=${st.getId()}" enctype="multipart/form-data">
        <fieldset class="form-group">
            <label>Name</label>
            <input type="text" name="name" value="${st.getName()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Category</label>
            <input type="text" name="category" value="${st.getCategory()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Email</label>
            <input type="text" name="email" value="${st.getEmail()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Mobile No.</label>
            <input type="text" name="mobile_num" value="${st.getMobile_num()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Image</label>
            <img src="/img?path=${st.getphotopath()}" alt="Your Profile Photo">
            <input type="file" name="photo" value="${st.getphotopath()}" class="form-control" />
        </fieldset>
        <fieldset class="form-group">
            <label>Username</label>
            <input type="text" name="username" value="${st.getUsername()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Password</label>
            <input class="form-control" type="password" value="${st.getPassword()}" name="password" required/>
        </fieldset>
        <button type="submit" class="btn btn-success">Update Details</button>
    </form>
</div>

</body>
</html>
