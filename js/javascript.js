// Answer checking function

$(".answer-button").click(function () {

    var answer = $(this).attr('value');

    $(".answer-button").css('border', '1px solid white');

    $(this).css('border', '2px solid red');

    $("#info").css('display', 'inline');
    $("#info").html("<h3> Final answer, - <b>"+answer+" </b>?</h3> <button class='finalanswer-button' id='yes'> Yes </button><button class='finalanswer-button' id='no'> No </button>");


    $("#no").click(function () {
        $("#info").css('display', 'none');
        $(".answer-button").css('border', '1px solid white');
    })

    $("#yes").click(function () {
        clearInterval(countdownTimer);
        $.ajax({
            type: 'POST',
            url: 'game/check',
            data: {
                answer: answer
            },
            success: function (data) {

                var ob = jQuery.parseJSON(data);

                switch (ob) {

                case true:
                    $("#wrapper").html("<div id='answer-summary'><h1>Correct answer! </h1> <a class='button info-btn' href='game'> Next question </a><a href='game/gameoversummary' class='button info-btn'> Finish the game ! </a></div>");
                    $('#footer').html('');
                    break;

                case false:
                   window.location.href = 'game/gameoversummary';
                    break;

                case 'Answered':
                    window.location.href = 'game';
                case 'timeover':
                    window.location.href = 'game/gameoversummary';
                    break;
                case 'refreshed':
                    window.location.href = '/';
                    break;
                }

            }
        });
    });
})

//FiftyFifty helper function

$("#FiftyFifty").click(function (event) {
    $("#FiftyFifty").remove();

    var FiftyFifty = $(this).attr('value');

    $.ajax({
        type: 'POST',
        url: '/game/helpers',
        async: false,
        data: {
            help: FiftyFifty
        },

        success: function (data) {

            var obj = jQuery.parseJSON(data);

            var answer1 = obj[0];
            var answer2 = obj[1];
            
            $.each($(".answer-button"), function (index, string) {
                var value = $(this).val();

                if (value != answer1 && value != answer2) {
                    $(this).hide("explode", "slow", function () {
                        $(this).remove();
                    });

                }

            })
        }
    });
})

//Call helper function 

$("#Call").click(function (event) {

    var Call = $(this).attr('value');
    $("#Call").remove();

    $("#info").html('');
    $("#info").css('display', 'none');

    $.ajax({
        type: 'POST',
        url: '/game/helpers',
        async: false,
        data: {
            help: Call
        },
        success: function (data) {
            var message = jQuery.parseJSON(data);

            $("#info").html("<h3>"+message+"</h3>");
            $("#info").show('drop', 'slow');

        }
    });
})

//Vote helper function

$("#Vote").click(function (event) {

    var Vote = $(this).attr('value');
    $("#Vote").remove();

    $("#info").html('');
    $("#info").css('display', 'none');

    $.ajax({
        type: 'POST',
        url: '/game/helpers',
        async: false,
        data: {
            help: Vote
        },
        success: function (data) {

            var message = jQuery.parseJSON(data);

            $("#info").append("<h3>Vote results:</h3>");
            
            $.each(message, function (index, value) {

                $("#info").append(index + " - " + value + "% , ");

            });

            $("#info").show('drop', 'slow');

        }
    });
})

//Countdown clock function

var seconds = 15

function secondPassed() {

    var minutes = Math.round((seconds - 30) / 60);
    var remainingSeconds = seconds % 60;

    if (remainingSeconds < 10) {
        remainingSeconds = "0" + remainingSeconds;
    }
    document.getElementById('countdown').innerHTML = minutes + ":" + remainingSeconds;
    if (seconds <= 5) {
        $('#countdown').css("color", "red");

    }
    
    if (seconds == 0) 
    {
        clearInterval(countdownTimer);
         $.ajax({
            type: 'POST',
            url: 'game/check',
            data:{
                answer: 'Gameover-timeover'
            },
            success: function (data) {
                window.location.href = 'game/gameoversummary';
            }
        })
     
    } 
    else 
    {
        seconds--;
    }

}

var countdownTimer = setInterval('secondPassed()', 1000);

