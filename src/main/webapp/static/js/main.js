// Jquery Goes here 
$(document).ready(function() {

    // Initial Settings
    var audio;
    $('#pause').hide();
    $('#mute').hide();
    $('.account-dropdown').hide();
    $('.search').hide();
    var repeat = 0;

    // On Dropdowns and Popups
    $(".hamburger").click(function() {
        $(".wrapper").toggleClass("collapse");
    });


    $('.li-account').click(function() {
        $('.account-dropdown').toggle();
    });

    $('.li-search').click(function() {
        $('.search').toggle();
    })


    // Submit Songs Search on Enter 
    $('.li-search').keyup(function(e) {
        if (e.which == 13)
            $('#search-form').submit();
    })

    initAudio($('#playlist li:first-child'));

    // Managing the song queue
    var queue = $('ul#playlist li').toArray();

    // shuffleArray(queue);
    console.log(queue);


    // Auto Play Next
    var index = 1; // First Element will be played by default
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



    // $('#add-song').click(function() {

    // });

    // Audio Jqueries

    function initAudio(element) {

        var song = element.attr('song');
        var title = element.text();
        var cover = element.attr('cover');
        var artist = element.attr('artist');

        // Create a New Audio Object
        audio = new Audio('static/media/' + song);

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