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
    <link rel="stylesheet" href="/static/css/animate.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="https://kit.fontawesome.com/194687f623.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/static/js/main.js"></script>
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
        <div class="item">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aut sapiente adipisci nemo atque eligendi reprehenderit minima blanditiis eum quae aspernatur!
        </div>
        <div class="item">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aut sapiente adipisci nemo atque eligendi reprehenderit minima blanditiis eum quae aspernatur!
        </div>
        <div class="item">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aut sapiente adipisci nemo atque eligendi reprehenderit minima blanditiis eum quae aspernatur!
        </div>
        <div class="item">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aut sapiente adipisci nemo atque eligendi reprehenderit minima blanditiis eum quae aspernatur!
        </div>
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
            <li song="Halsey - Bad At Love.mp3" cover="cover1.jpg" artist="Halsey">Bad At Love</li>
            <li song="Halsey - You should be sad.mp3" cover="cover2.jpg" artist="Halsey">You Should Be sad</li>
            <li song="Kina - get you the moon (ft. Snow).mp3" cover="cover3.jpg" artist="Kina">Get you the moon</li>

        </ul>
    </div>

</div>

</body>

</html>