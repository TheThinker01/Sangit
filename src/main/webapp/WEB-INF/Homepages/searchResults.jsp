
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Sangit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.0.0-beta/css/bootstrap.min.css" >
    <script src="/webjars/jquery/3.2.1/jquery.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="/webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="/static/css/jquery-confirm.min.css"> <!--For the popups -->
    <link rel="stylesheet" href="/static/css/animate.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <%--    <script src="https://kit.fontawesome.com/194687f623.js" crossorigin="anonymous"></script>--%>
    <link href="/static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <script src="/static/js/jquery-confirm.min.js"></script>
    <link rel=icon href="/static/img/favicon-32x32.png">
    <%--    <script src="static/js/main.js"></script>--%>
</head>

<body>
<div class="wrapper">
    <div class="top_navbar">
        <div class="hamburger">
            <!-- <div></div>
            <div></div>
            <div></div> -->
            <img height="40px" width="40px" src="/static/img/entertainment.png">
        </div>
        <div class="top_menu">
            <div class="logo">संगीत</div>
            <div class="search">
                <form action="" method="post" id="search-form">
                    <span><i class="fas fa-search fa-xs"></i></span>
                    <input type="text" id="search-box" placeholder="Search Songs..." />
                </form>
            </div>
            <ul style="margin-top: 10px">
                <li class="li-search">
                    <a href="#"><i class="fas fa-search"></i></a>
                </li>
                <!-- <li class="li-notifications">
                    <a href="#"><i class="fas fa-bell"></i></a>
                </li> -->
                <li class="li-account">
                    <a href="#"><i class="fas fa-user"></i></a>
                    <ul class="account-dropdown">
                        <%if(u!=null)
                        {%>
                        <li><span><a style="all: unset" class="playlists">Playlists</a></span></li>
                        <li><a style="all: unset" class="queue" >Song Queue</a></li>
                        <li><a style="all: unset" href="/updateProfile">Profile</a></li>
                        <div class="marker"></div>
                        <li><a style="all: unset"  href="#" data-toggle="modal" data-target="#logoutModal" >Logout</a></li>
                        <%}
                        else{
                        %>
                        <li><a style="all: unset" href="/login">Login</a></li>
                        <hr>
                        <li><a style="all: unset" href="/addUser">Register</a></li>
                        <% } %>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="sidebar">
        <ul>
            <li>
                <a  class="active listen"><span class="icon"><i class="fas fa-music"></i></span><span class="title">Listen</span></a>
            </li>
            <li>
                <a  class="playlists">
                    <span class="icon"><i class="fas fa-list-ul"></i></span><span class="title">My Playlists</span></a>
            </li>
            <li>
                <a  class="queue">
                    <span class="icon"><i class="fas fa-folder-plus"></i></span><span class="title">My Queue</span>
                </a>
            </li>
            <li>
                <a href="/updateProfile">
                    <span class="icon"><i class="fas fa-user-circle"></i></span><span class="title">My Account</span>
                </a>
            </li>

            <li class="issue-li">
                <a href="/user/addIssue">
                    <span class="icon"><i class="fas fa-exclamation-triangle"></i></span><span class="title">Report Issue</span>
                </a>
            </li>

            <li class="admin-li">
                <a href="/admin">
                    <span class="icon"><i class="fas fa-shield-alt"></i></span><span class="title">Admin</span>
                </a>
            </li>

            <li class="issue-li">
                <a href="/welcome">
                    <span class="icon"><i class="fas fa-podcast"></i></span><span class="title">Music Provider</span>
                </a>
            </li>
        </ul>

    </div>
    <div class="main_container container1">
        <h2 style="display: block">Songs matching your search...</h2>
        <div class="music-row">
            <c:forEach items="${it}" var="music">
                <div class="music-item">
                    <li songid ="${music.getId()}" song="/music?path=${music.getMediapath()}" cover="/img?path=${music.getAlbumart()}" artist="${music.getArtist()}" rating="${music.getRating()}" style="display: none;"> ${music.getTitle()}</li>
                    <div class="music-item-body">
                        <div class="music-item-hover">
                            <span class="ratings music-overlay-buttons"><i class="fas fa-star fa-xs"></i><i class="far fa-star fa-xs"></i></span>
                            <span class="play music-overlay-buttons"><i class="fab fa-google-play fa-3x"></i></span>
                            <span class="pause music-overlay-buttons"><i class="fas fa-pause fa-3x"></i></span>
                            <span class="add-to-queue music-overlay-buttons" id="${music.getId()}" ><i class="fas fa-plus-circle fa-xs"></i></span>
                            <span class="rate music-overlay-buttons"><i class="far fa-edit fa-xs"></i></span>
                        </div>
                    </div>
                    <div class="music-item-text">
                        <div class="title"></div>
                        <div class="artist"></div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
