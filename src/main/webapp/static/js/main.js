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
    // $('.music-item-hover .pause').hide();
    $('.container1').hide();
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
    })


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



    // Submit Songs Search on Enter
    $('.li-search').keyup(function(e) {
        if (e.which == 13)
            $('#search-form').submit();
    })



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

    function initAudio(element) {

        var song = element.attr('song');
        // song = song.replace(/\\/g, "/" );
        // console.log(song);
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
});