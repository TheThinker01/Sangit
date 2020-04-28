<%@ page import="Bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show all students</title>
    <%@include file="../common/commonlinks.jsp"%>
    <style>
        .update,.delete{
            border-radius:10px ;
            padding: 5px;
        }
        .update{
            border: thin solid green;
        }
        .delete{
            border: thin solid red;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="alert-primary mb0"> <h3>${message}</h3> </div>
    <table class="table table-hover ">
        <thead class="thead">
        <tr>

            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Mobile Number</th>
            <th scope="col">Category</th>
            <th scope="col">Photo</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">
                <form method="post" action="/admin/ShowAllUsers">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search By Name" name="search" style="width: 75px;">
                        <div class="input-group-append">
                            <button class="btn btn-success" type="submit">Go</button>
                        </div>
                    </div>
                </form>
            </th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${it}" var="st">
            <tr>
                    <%--            name, String password, String email, String mobile_num,String category,String photopath ,String username--%>
                <th scope="row">${st.getId()}</th>
                <td>${st.getName()}</td>
                <td>${st.getEmail()}</td>
                <td>${st.getMobile_num()}</td>
                <td>${st.getCategory()}</td>
                        <td><a href="/img?path=${st.getphotopath()}"><img src="/img?path=${st.getphotopath()}" alt="Your Profile Photo" height="75px" width="75px" class="img-thumbnail"></a></td>
                <td>${st.getUsername()}</td>
                <td><%String pass;
                    User x = (User)pageContext.getAttribute("st");
                    String password = x.getPassword();
                    pass = password.substring(0,password.length()/5);
                    pass +="...";
                    pageContext.setAttribute("pass",pass);
                    %>${pass}</td>
                <td ><a class="update" href="/updateProfile?id=${st.getId()}" >Update</a></td>
                <td ><a class="delete" href="/admin/DeleteUser?id=${st.getId()}">Delete</a></td>
            </tr>
        </c:forEach>

        <tr></tr>
        </tbody>
    </table>
</div>
</body>
</html>