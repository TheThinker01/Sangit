<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 02-05-2020
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Playlist</title>
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
        .options{
            color: #999999;
            margin: 0 10px;
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
<body><!-- TODO : This page is not showing the icons! Check -->
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
        <form method="post" action="/user/addPlaylist">
        <div>
        <fieldset class="form-group">
            <h4><label>Name</label></h4>
            <input type="text" name="name" class="form-control" required/>
        </fieldset>
        </div>
        <fieldset class="form-group">
            <h4>Share</h4>
            <h5>Do you want to share this playlist with other users?</h5>
            <div class="form-check m-4">
                <input class="form-check-input" type="radio" name="visibility" id="exampleRadios1" value="global" checked>
                <label class="form-check-label" for="exampleRadios1">
                    Yes
                </label>
            </div>
            <div class="form-check m-4">
                <input class="form-check-input" type="radio" name="visibility" id="exampleRadios2" value="local">
                <label class="form-check-label" for="exampleRadios2">
                    No
                </label>
            </div>
        </fieldset>
        <button type="submit" class="btn btn-success">Submit Details</button>
        </form>
        <div class="alert alert-success" style="margin-top: 20px">
            <h4>You can add songs to this playlist by clicking  <span class="options"><i class="fas fa-ellipsis-h"></i></span> at the footer</h4>
        </div>
    </div>
</div>
</body>
</html>
