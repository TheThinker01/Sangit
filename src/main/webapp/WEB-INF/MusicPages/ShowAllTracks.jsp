<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 18-05-2020
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show all Music Tracks</title>
    <%@include file="../common/commonlinks.jsp"%>
<%--    <script src="https://kit.fontawesome.com/194687f623.js" crossorigin="anonymous"></script>--%>
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
            padding:50px 20px;
            margin-left: 50px;
            margin-right: 50px;
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


        .wrapper .top_navbar .top_menu .search {
            color: #999;
            border: 1.5px solid #92a6e2;
            padding: 5px 5px;
            border-radius: 10px;
            transition: all 0.3 ease-in;
        }

        .wrapper .top_navbar .top_menu #search-box {
            margin-left: 5px;
            border: none;
            color: #999;
            font-weight: 300;
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
        .infotext{
            padding: 10px;
            padding-left: 20px;
            border-top-left-radius: 10px;
            border: 2px solid #1696ff;
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
            <div class="search">
                <form action="/showAllMusic" method="post" id="search-form">
                    <span><i class="fas fa-search fa-xs"></i></span>
                    <input type="text" id="search-box" placeholder="Search by Title" name="search"/>
                    <span class="input-group-append">
                        <button class="btn btn-info" type="submit">Go</button>
                    </span>
                </form>
            </div>
            <ul>
                <li class="li-account">
                    <a href="/"><i class="fas fa-home"></i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="container main_container">
        <div class="alert-primary mb0 infotext"> <h3>${message}</h3> </div>
        <table class="table table-hover ">
            <thead class="thead">
            <tr>

                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Artist</th>
                <th scope="col">Album Art</th>
                <th scope="col">Track</th>
                <th scope="col">Duration</th>
                <%--            <th scope="col">--%>
                <%--                <form method="post" action="/admin/ShowAllUsers">--%>
                <%--                    <div class="input-group">--%>
                <%--                        <input type="text" class="form-control" placeholder="Search By Name" name="search" style="width: 75px;">--%>
                <%--                        <div class="input-group-append">--%>
                <%--                            <button class="btn btn-success" type="submit">Go</button>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </form>--%>
                <%--            </th>--%>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${it}" var="st">
                <tr>
                        <%--            name, String password, String email, String mobile_num,String category,String photopath ,String username--%>
                    <th scope="row">${st.getId()}</th>
                    <td>${st.getTitle()}</td>
                    <td>${st.getArtist()}</td>
                    <td><a href="/img?path=${st.getAlbumart()}"><img src="/img?path=${st.getAlbumart()}" alt="Album Art" height="75px" width="75px" class="img-thumbnail"></a></td>
                            <td><a href="/music?path=${st.getMediapath()}">Click Here for Song</a></td>
                    <td ><a class="delete" href="/admin/DeleteMusic?id=${st.getId()}">Delete</a></td>
                </tr>
            </c:forEach>

            <tr></tr>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>

