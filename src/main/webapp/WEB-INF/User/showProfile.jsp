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
    <link href="/static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Noto+Sans+JP:300,500,900&display=swap');
        @import url('https://fonts.googleapis.com/css?family=Gotu&display=swap&subset=devanagari');
        * {
            margin: 0;
            list-style: none;
            padding: 0;
            text-decoration: none;
            box-sizing: border-box;
            font-family: 'Noto Sans JP', sans-serif;
        }
        body{
            height: 100%;
            background-color: #e1ecf2;
        }
        .wrapper{

            height: 100%;
            margin-top: 60px;
        }
        .main_container{
            padding:50px 50px;
        }
        label{
            font-size: 18px;
            font-weight: bolder;
        }

        .wrapper .top_navbar {
            width: calc(100% - 20px);
            height: 60px;
            display: flex;
            position: fixed;
            top: 0px;
            left: 10px;
            z-index: 999;
        }

        .wrapper .top_navbar .hamburger {
            width: 70px;
            height: 100%;
            background: #2e4ead;
            padding: 15px 17px;
            border-top-left-radius: 20px;

            cursor: pointer;
        }

        .wrapper .top_navbar .hamburger .icon {
            color: #a9bbf1;
        }

        .wrapper .top_navbar .hamburger div {
            width: 35px;
            height: 4px;
            background: #92a6e2;
            margin: 5px 0;
            border-radius: 5px;
        }

        .wrapper .top_navbar .top_menu {
            width: calc(100% - 70px);
            height: 100%;
            background: #fff;
            border-top-right-radius: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        }

        .wrapper .top_navbar .top_menu .logo {
            color: #2e4ead;
            font-size: 30px;
            font-weight: 800;
            letter-spacing: 3px;
            font-family: 'Gotu', sans-serif;
        }


        .wrapper .top_navbar .top_menu ul {
            margin-top: 10px;
            display: flex;
            justify-content: center;
        }

        .wrapper .top_navbar .top_menu ul li a {
            display: block;
            margin: 0 10px;
            width: 35px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            border: 1px solid #2e4ead;
            border-radius: 50%;
            color: #2e4ead;
            padding: 6px;
        }

        .wrapper .top_navbar .top_menu ul li a:hover {
            background: #4360b5;
            color: #fff;
        }

    </style>
</head>
<body>
<div class="wrapper">
    <div class="top_navbar">
        <div class="hamburger">
            <!-- <div></div>
            <div></div>
            <div></div> -->
            <i class="fas fa-headphones-alt fa-2x icon"></i>
        </div>
        <div class="top_menu">
            <div class="logo">संगीत</div>

            <ul>
                <li class="li-account">
                    <a href="/"><i class="fas fa-home"></i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="container main_container">
    <form method="post" action="/updateProfile?id=${st.getId()}" enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-6">
        <fieldset class="form-group">
            <label>Name</label>
            <input type="text" name="name" value="${st.getName()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
<%--            <label>Category</label>--%>
            <input type="hidden" name="category" value="${st.getCategory()}" class="form-control" required/>
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
            <label>Username</label>
            <input type="text" name="username" value="${st.getUsername()}" class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Password</label>
            <input class="form-control" type="password" placeholder="Re enter your password"   name="password" required/>
        </fieldset>
            </div>
            <div class="col-lg-6">
        <fieldset class="form-group">
            <label>Image</label><br/>
            <img src="/img?path=${st.getphotopath()}" class="img-thumbnail"  alt="Your Profile Photo">
            <input type="file" name="photo" value="${st.getphotopath()}" class="form-control" />
        </fieldset>
            </div>
        </div>
        <button type="submit" class="btn btn-success">Update Details</button>
    </form>
</div>
</div>
</body>
</html>
