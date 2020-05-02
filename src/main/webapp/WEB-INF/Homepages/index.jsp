<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAO.MusicDeclaration" %>
<%@ page import="DAO.MusicInterface" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ListIterator" %>
<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 28-04-2020
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Sangit</title>
    <link rel="stylesheet" href="static/css/animate.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="https://kit.fontawesome.com/194687f623.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="static/js/main.js"></script>
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
                <form action="" method="post" id="search-form">
                    <span><i class="fas fa-search fa-xs"></i></span>
                    <input type="text" id="search-box" placeholder="Search Songs..." />
                </form>
            </div>
            <ul>
                <li class="li-search">
                    <a href="#"><i class="fas fa-search"></i></a>
                </li>
                <!-- <li class="li-notifications">
                    <a href="#"><i class="fas fa-bell"></i></a>
                </li> -->
                <li class="li-account">
                    <a href="#"><i class="fas fa-user"></i></a>
                    <ul class="account-dropdown">
                        <li>Playlists</li>
                        <li>Song Queue</li>
                        <li>Profile</li>
                        <div class="marker"></div>
                        <li>Logout</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="sidebar">
        <ul>
            <li>
                <a href="#" class="active">
                    <span class="icon"><i class="fas fa-music"></i></span>
                    <span class="title">Listen</span></a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-list-ul"></i></span>
                    <span class="title">Playlists</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fab fa-youtube"></i></span>
                    <span class="title">Videos</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-blog"></i></span>
                    <span class="title">My Account</span>
                </a>
            </li>
            <li class="admin-li">
                <a href="#">
                    <span class="icon"><i class="fas fa-shield-alt"></i></span>
                    <span class="title">Admin</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="main_container">
        <%
            MusicInterface mi = new MusicDeclaration();
            List musiclist;
            musiclist = mi.selectAllMusics();
            ListIterator it = null;
            if(musiclist!=null) {
               it = musiclist.listIterator();
            }
            pageContext.setAttribute("it",it);
        %>
        <c:forEach items="${it}" var="music">
            <div class="music-item">
                <li song="/music?path=${music.getMediapath()}" cover="/img?path=${music.getAlbumart()}" artist="${music.getArtist()}" rating="${music.getRating()}" style="display: none;"> ${music.getTitle()}</li>
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
    <div class="footer">
        <span class="audio-buttons" id="prev"><i class="fas fa-backward fa-2x"></i></span>
        <span class="audio-buttons" id="play"><i class="fab fa-google-play fa-3x"></i></span>
        <span class="audio-buttons" id="pause"><i class="fas fa-pause fa-3x"></i></span>
        <span class="audio-buttons" id="next"><i class="fas fa-forward fa-2x"></i></span>
        <span class="audio-buttons" id="options"><i class="fas fa-ellipsis-h fa-lg"></i></span>
        <span class="song-details">
            <span id="title"></span>
            <span id="artist"></span>
            <span id="progressbar">
                <span id="progress"></span>
            </span>
            </span>
        <span class="right" id="duration"></span>/
        <span class="right" id="maxduration"></span>
        <span class="audio-buttons right" id="nmute"><i class="fas fa-volume-up fa-2x"></i></span>
        <span class="audio-buttons right" id="mute"><i class="fas fa-volume-mute fa-2x"></i></span>
        <span><input type="range" max="10" min="0" value="5" id="volume" class="slider"></span>
        <span class="audio-buttons right" id="shuffle"><i class="fas fa-random fa-2x"></i></span>
        <span class="audio-buttons right" id="repeat"><i class="fas fa-retweet fa-2x"></i></span>

    </div>

    <div class="song-queue" style="display:none;">
        <ul id="playlist">
            <%
                List musiclist2 = mi.selectAllMusics();
                ListIterator it2 = null;
                if(musiclist2!=null) {
                    it2= musiclist2.listIterator();
                }
                pageContext.setAttribute("it2",it2);
            %>
            <c:forEach items="${it2}" var="music2">
                <li song="/music?path=${music2.getMediapath()}" cover="/img?path=${music2.getAlbumart()}" artist="${music2.getArtist()}" rating="${music2.getRating()}" style="display: none;"> ${music2.getTitle()}</li>
            </c:forEach>

<%--            <li song="Halsey - Bad At Love.mp3" cover="img/sddefault.jpg" artist="Halsey" rating="2" style="display: none;">Bad At Love</li>--%>
<%--            <li song="Halsey - You should be sad.mp3" cover="img/sddefault.jpg" artist="Halsey" rating="4" style="display: none;">You should be sad</li>--%>
<%--            <li song="Kina - get you the moon (ft. Snow).mp3" cover="img/kina.jpg" artist="Kina" rating="3" style="display: none;">Get you the moon</li>--%>
<%--            <li song="Halsey - Bad At Love.mp3" cover="img/index.jpg" artist="Powfu" rating="5" style="display: none;">Deathbed</li>--%>
<%--            <li song="I Just Wanna Shine.mp3" cover="img/sddefault4.jpg" artist="Fitz" rating="5" style="display: none;">I just wanna shine</li>--%>


        </ul>
    </div>


</body>

</html>