$(document).ready(function () {

    var length = $('#left').height() - $('.event-show-side-bar').height() + $('#left').offset().top;

    $(window).scroll(function () {

        var scroll = $(this).scrollTop();
        var height = $('.event-show-side-bar').height() + 'px';

        if (scroll < $('#left').offset().top) {

            $('.event-show-side-bar').css({
                'position': 'absolute',
                'top': '0'
            });

        } else if (scroll > length) {

            $('.event-show-side-bar').css({
                'position': 'absolute',
                'bottom': '0',
                'top': 'auto'
            });

        } else {

            $('.event-show-side-bar').css({
                'position': 'fixed',
                'top': '0',
                'height': height
            });
        }
    });
});