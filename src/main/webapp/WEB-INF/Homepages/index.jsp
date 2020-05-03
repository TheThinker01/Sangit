<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Bean.Playlist" %>
<%@ page import="Bean.User" %>
<%@ page import="DAO.MusicDeclaration" %>
<%@ page import="DAO.MusicInterface" %>
<%@ page import="DAO.PlaylistDeclaration" %>
<%@ page import="DAO.PlaylistInterface" %>
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


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="static/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="static/css/animate.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="https://kit.fontawesome.com/194687f623.js" crossorigin="anonymous"></script>
    <script src="static/js/jquery-confirm.min.js"></script>

<%--    <script src="static/js/main.js"></script>--%>
</head>

<body>
<%PlaylistInterface pi = new PlaylistDeclaration();
    User u = (User)request.getSession().getAttribute("loggedIn");
    pageContext.setAttribute("user",u);
%>
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
                        <li><span><a style="all: unset" href="#">Playlists</a></span></li>
                        <li><a style="all: unset" href="#">Song Queue</a></li>
                        <li><a style="all: unset" href="/updateProfile">Profile</a></li>
                        <div class="marker"></div>
                        <li><a style="all: unset" href="/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="sidebar">
        <ul>
            <li>
                <a href="#" class="active listen">
                    <span class="icon"><i class="fas fa-music"></i></span>
                    <span class="title">Listen</span></a>
            </li>
            <li>
                <a href="#" class="playlists">
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

    <div class="main_container container1">
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
    <div class="main_container container2">
        <h2>This Weeks Top 10 Songs:</h2>
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
                <li songid ="${music2.getId()}" song="/music?path=${music2.getMediapath()}" cover="/img?path=${music2.getAlbumart()}" artist="${music2.getArtist()}" rating="${music2.getRating()}" style="display: none;"> ${music2.getTitle()}</li>
            </c:forEach>

<%--            <li song="Halsey - Bad At Love.mp3" cover="img/sddefault.jpg" artist="Halsey" rating="2" style="display: none;">Bad At Love</li>--%>
<%--            <li song="Halsey - You should be sad.mp3" cover="img/sddefault.jpg" artist="Halsey" rating="4" style="display: none;">You should be sad</li>--%>
<%--            <li song="Kina - get you the moon (ft. Snow).mp3" cover="img/kina.jpg" artist="Kina" rating="3" style="display: none;">Get you the moon</li>--%>
<%--            <li song="Halsey - Bad At Love.mp3" cover="img/index.jpg" artist="Powfu" rating="5" style="display: none;">Deathbed</li>--%>
<%--            <li song="I Just Wanna Shine.mp3" cover="img/sddefault4.jpg" artist="Fitz" rating="5" style="display: none;">I just wanna shine</li>--%>


        </ul>
    </div>
</div>

    <script>
        // Jquery Goes here
        $(document).ready(function() {


            ////////// Initial Settings

            initAudio($('#playlist li:first-child'));

            // Managing the song queue
            var queue = $('ul#playlist li').toArray();

            // shuffleArray(queue);
            console.log(queue);

            // Auto Play Next index
            var index = 1; // First Element will be played by default

            var audio;
            $('#pause').hide();
            $('#mute').hide();
            $('.account-dropdown').hide();
            $('.search').hide();
            $('.music-item-hover').hide();
            $('.music-item-hover .pause').hide();
            $('.container2').hide();
            var repeat = 0;

            // $('music-item-hover').hide();

            ////////// On Dropdowns and Popups and glowups

            $(".hamburger").click(function() {
                $(".wrapper").toggleClass("collapse");
            });


            $('.li-account').click(function() {
                $('.account-dropdown').toggle();
            });

            $('.li-search').click(function() {
                $('.search').toggle();
            });

            $('.sidebar .listen').click(function () {
                $('.container2').hide();
                $('.container1').show();
                $('.sidebar a').removeClass("active");
                $(this).addClass("active");
            });

            $('.sidebar .playlists').click(function () {
                $('.container2').show();
                $('.container1').hide();
                $('.sidebar a').removeClass("active");
                $(this).addClass("active");
            });

            ////// Music Items Overlay Functions

            $('.music-item-body').hover(function() {
                // e here points to music-item-body
                // we check if e's first child is a div or not and only then update the first child
                // so that we dont fall into a repeated loop of selecting first childs i.e span, then icons etc
                // // Then we toggle it
                // var target = $(e.target);
                // if (jQuery(target.children()[0]).is("div"))
                //     target = target.children()[0];
                // // console.log(target);
                // target = jQuery(target);
                // // target.setAttribute('style', 'display:block');
                // target.toggle();
                // console.log(target);

                $(this).find('div').toggle();

            });

            // For Highlighting the buttons on overlay
            $('.music-item-hover .music-overlay-buttons').on('mouseenter', function() {
                // console.log(e);
                // var target = jQuery(e.currentTarget);
                // $(target).css('opacity', '1');
                $(this).css('opacity', '1');
            });

            $('.music-item-hover .music-overlay-buttons').on('mouseleave', function(e) {
                // console.log('loll');
                // var target = jQuery(e.traget);
                $(this).css('opacity', '0.75');
            });

            // Add song to queue button
            $('.add-to-queue').click(function(e) {
                e = jQuery(e.target);
                var x = e.parents().eq(3);
                var y = x.find('li');
                var name = y.text();
                console.log(queue);
                queue.push(y[0]);
                console.log(queue);
                UpdateDomQueue();
                alert('Song " ' + name + ' " was added to the end of your song queue');

            });

            // Pressing the play button
            $('.music-item-hover .play').click(function() {
                // First make all pause buttons disappear and play buttons appear
                $('.music-item-hover .play').show();
                $('.music-item-hover .pause').hide();
                audio.pause();

                // Then carry on with operation
                var x = $(this).parents().eq(2);
                var y = x.find('li');
                var name = y.text();
                // TODO -> COMPLETE THIS
                console.log(y);
                queue.unshift(y[0]);
                console.log(queue);
                index = 0;
                var e = jQuery(queue[index]);
                initAudio(e);
                audio.play();
                $('#play').hide();
                $('#pause').show();
                showDuration();
                UpdateDomQueue();
                alert('Song " ' + name + ' " is now playing');

                // Finally make play button disappear for this element
                // and pause appear
                $(this).toggle();
                $(this).next().toggle();
            });

            // Clicking on Pause button on the overlay
            $('.music-item-hover .pause').click(function() {
                audio.pause();
                $('.music-item-hover .play').show();
                $('.music-item-hover .pause').hide();
                $('#play').show();
                $('#pause').hide();
            });

            // Clicking on the add review button
            $('.music-item-hover .rate').click(function() {
                var music_id=$(this).parents().eq(2).find('li').attr('songid');
                $.confirm({
                    title: 'Rate this song!',
                    content: ''+
                        '<form action="/addRating" class="formName" method="post">' +
                        '<div class="form-group">'+
                        '<input type="hidden" name="musicid" value="'+music_id+'">'+
                        '<h5>Enter Rating(0-5)</h5>'+
                        '<label class="radio-inline m-1"><input type="radio" class="name" name="rating" value="0" >0</label>'+
                        '<label class="radio-inline m-1"><input type="radio" class="name" name="rating" value="1" >1</label>'+
                        '<label class="radio-inline m-1"><input type="radio" class="name"  name="rating" value="2" >2</label>'+
                        '<label class="radio-inline m-1"><input type="radio" class="name"  name="rating" value="3" >3</label>'+
                        '<label class="radio-inline m-1"><input type="radio" class="name"  name="rating" value="4" >4</label>'+
                        '<label class="radio-inline m-1"><input type="radio" class="name"  name="rating" value="5" checked>5</label>'+
                        '</div>' +
                        '</form>',
                    buttons: {
                        formSubmit: {
                            text: 'Submit',
                            btnClass: 'btn-blue',
                            action: function () {
                                var name = this.$content.find('.name').val();
                                console.log(name);
                                $.alert('Song Rated');
                                this.$content.find('form').submit();
                                }

                        },
                        cancel: function () {
                            //close
                        },
                    },
                    onContentReady: function () {
                        // bind to events
                        var jc = this;
                        this.$content.find('form').on('submit', function (e) {
                            // if the user submits the form by pressing enter in the field.

                            // reference the button and click it
                        });
                    }
                });

            });

            // Submit Songs Search on Enter
            $('.li-search').keyup(function(e) {
                if (e.which == 13)
                    $('#search-form').submit();
            })


            // Auto continue next song
            $(audio).bind('ended', function() {
                var e = jQuery(queue[index]);
                if (index != (queue.length - 1)) {
                    index += 1;
                    initAudio(e);
                    audio.play();
                    $('#play').hide();
                    $('#pause').show();
                    showDuration();
                } else if (repeat == 1) {
                    index = 0;
                    initAudio(e);
                    audio.play();
                    $('#play').hide();
                    $('#pause').show();
                    showDuration();
                }
            });



            // getRatings();

            // console.log($('.ratings'));
            // Generate ratings for each songs from the ratings parameter
            $('.ratings').each(function(index) {
                var m = jQuery($('.ratings')[index]);
                var x = m.parents().eq(2);
                // console.log(x);
                var y = x.find('li');
                // console.log(y);
                var rating = y.attr('rating');
                // console.log(rating);
                m.html(" ");
                for (var i = 0; i < rating; i++) {
                    m.append('<i class = "fas fa-star fa-xs" > </i>');
                }
                for (var i = rating; i < 5; i++) {
                    m.append('<i class = "far fa-star fa-xs" > </i>');
                }
            });

            // Generate The artist name and title for each tab  and the background image
            $('.music-item').each(function(index) {
                var m = jQuery($('.music-item')[index]);
                var x = m.find('li');

                var img = x.attr('cover');
                // console.log(img);
                img = img.replace(/\\/g, "/" );

                var title = x.text();
                var artist = x.attr('artist');
                // console.log(img);
                var l = m.find('.music-item-body');
                l.css('background', 'url("' + img + '") no-repeat');
                // console.log(l);
                // get title
                var p = m.find('.title');
                p.text(title);
                var q = m.find('.artist');
                q.text(artist);

                // console.log(title);
            });

            // Audio Jqueries
            var song_id;
            function initAudio(element) {

                var song = element.attr('song');
                // song = song.replace(/\\/g, "/" );
                // console.log(song);
                song_id = element.attr('songid')
                var title = element.text();
                var cover = element.attr('cover');
                var artist = element.attr('artist');

                // Create a New Audio Object
                audio = new Audio(song);

                if (!audio.currentTime) {
                    $('#duration').html('0.00');
                }

                $('#artist').text(artist);
                $('#title').text(title);

                $('#playlist li').removeClass('active');
                element.addClass('active');

            }


            // Play Button
            $('#play').click(function() {
                audio.play();
                $('#play').hide();
                $('#pause').show();
                $('#duration').fadeIn(400);
                showDuration();
            });


            // Pause Button
            $('#pause').click(function() {
                audio.pause();
                $('#pause').hide();
                $('#play').show();

                // Also make all pause buttons disappear and play buttons appear
                $('.music-item-hover .play').show();
                $('.music-item-hover .pause').hide();
            });

            // Next Button
            $('#next').click(function() {
                audio.pause();
                var next = $('#playlist li.active').next();
                if (next.length == 0) {
                    next = $('#playlist li:first-child');
                }
                initAudio(next);
                audio.play();
                $('#play').hide();
                $('#pause').show();
                showDuration();
            });

            // Prev button
            $('#prev').click(function() {
                audio.pause();
                var prev = $('#playlist li.active').prev();
                if (prev.length == 0) {
                    prev = $('#playlist li:last-child');
                }
                initAudio(prev);
                audio.play();
                $('#play').hide();
                $('#pause').show();
                showDuration();
            });

            // Volume Control
            $('#volume').change(function() {
                audio.volume = parseFloat(this.value / 10);
                if (audio.volume == 0) {
                    $('#nmute').hide();
                    $('#mute').show();
                } else {
                    $('#mute').hide();
                    $('#nmute').show();
                }
            });

            // Mute Button
            $('#nmute').click(function() {
                audio.volume = 0;
                $('#volume').value = 0;
                $('#nmute').hide();
                $('#mute').show();
            });

            // Un mute button
            $('#mute').click(function() {
                audio.volume = 0.5;
                $('#volume').value = 0.5;
                $('#mute').hide();
                $('#nmute').show();
            });

            // Shuffle Button
            // First shuffle the queue randomly and then changes the stored list in the page
            $('#shuffle').click(function() {
                audio.pause();
                shuffleArray(queue);
                UpdateDomQueue();
                index = 0;
                var e = jQuery(queue[index]);
                initAudio(e);
                audio.play();
                $('#play').hide();
                $('#pause').show();
                showDuration();
            });


            // Repeat Button
            $('#repeat').click(function() {
                if (repeat == 1) {
                    repeat = 0;
                    $('#repeat').css('color', '#fff');
                } else {
                    repeat = 1;
                    $('#repeat').css('color', 'aquamarine')

                }
            });


            // Time Duration
            function showDuration() {

                $(audio).bind('timeupdate', function() {
                    //Get hours and minutes
                    var s = parseInt(audio.currentTime % 60);
                    var m = parseInt((audio.currentTime / 60) % 60);
                    //Add 0 if seconds less than 10
                    if (s < 10) {
                        s = '0' + s;
                    }
                    showMaxDuration();
                    $('#duration').html(m + '.' + s);
                    var value = 0;
                    if (audio.currentTime > 0) {
                        value = Math.floor((100 / audio.duration) * audio.currentTime);
                    }
                    $('#progress').css('width', value + '%');
                });



            }

            // Time max length
            function showMaxDuration() {
                var s = parseInt(audio.duration % 60);
                var m = parseInt((audio.duration / 60) % 60);
                //Add 0 if seconds less than 10
                if (s < 10) {
                    s = '0' + s;
                }
                $('#maxduration').html(m + '.' + s);
            }

            // Miscellaneous Functions
            function shuffleArray(array) {
                for (var i = array.length - 1; i > 0; i--) {
                    var j = Math.floor(Math.random() * (i + 1));
                    var temp = array[i];
                    array[i] = array[j];
                    array[j] = temp;
                }
            }

            function UpdateDomQueue() {
                $('#playlist').html(" ");
                $('#playlist').html(queue);
            }

            // Add to playlists
            $('#options').click(function () {

                $.confirm({
                    title: 'Add Song to Playlist!',
                    content: '' +


                        <%
                        if(u!=null)
                            {
                            List res = pi.selectByUser(u);
                                if(res.isEmpty())
                                    {
                                        %>

                                        '<h3>You have no Playlist. <a href="/user/addPlaylist">Click here</a> to Create One</h3>'+
                                    <%
                                    }
                                else
                                    {
                                        %>
                                        '<form action="/user/addSongToPlaylist" class="formName" method="post">' +
                                        '<div class="form-group">' +
                                        '<input type="hidden" name="musicid" value="'+song_id+'">'+
                                        <%
                                        ListIterator listIterator = res.listIterator();
                                        while(listIterator.hasNext())
                                            {
                                                Bean.Playlist p = (Playlist) listIterator.next();
                                                pageContext.setAttribute("p",p);
                                                System.out.println(p.getName());
                                        %>

                                        '<input class="name" type="checkbox" name="playlist" value="${p.getId()}" />'+
                                        '<label for="playlist" class="m-1">${p.name}</label><br>'+
                                        <%
                                            }
                                        %>
                                        '<h5 class="m-2"><a href="/user/addPlaylist">Add</a> another playlist</h5>'+
                                        <%
                                     }
                        }
                        else{
                            %>
                        '<h3><a href="/login">Login</a> to continue</h3>'+
                        <%
                        }
                        %>

                        '</div>' +
                        '</form>',
                    buttons: {
                        formSubmit: {
                            text: 'Submit',
                            btnClass: 'btn-blue',
                            action: function () {
                                var name = this.$content.find('.name').val();
                                if(!name){
                                    $.alert('Click On the Links To Proceed');
                                    return false;
                                }
                                else{
                                    $.alert('Song added to playlist: '+name);
                                    this.$content.find('form').submit();
                                }
                            }
                        },
                        cancel: function () {
                            //close
                        },
                    },
                    onContentReady: function () {
                        // bind to events
                        var jc = this;
                        this.$content.find('form').on('submit', function (e) {
                            // if the user submits the form by pressing enter in the field.

                             // reference the button and click it
                        });
                    }
                });
            });

        });
    </script>
</body>

</html>