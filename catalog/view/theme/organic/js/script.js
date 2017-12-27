$(document).ready(function(){
    (function ($) {

        var bxSlider = jQuery.fn.bxSlider;
        var $window = $(window);

        jQuery.fn.bxSlider = function () {

            var slider = bxSlider.apply(this, arguments);

            if (!this.length || !arguments[0].mouseDrag) {
                return slider;
            }

            var posX;
            var $viewport = this.parents('.bx-viewport');

            $viewport
                .on('dragstart', dragHandler)
                .on('mousedown', mouseDownHandler);

            function dragHandler(e) {
                e.preventDefault();
            }

            function mouseDownHandler(e) {

                posX = e.pageX;

                $window.on('mousemove.bxSlider', mouseMoveHandler);
            }

            function mouseMoveHandler(e) {

                if (posX < e.pageX) {
                    slider.goToPrevSlide();
                } else {
                    slider.goToNextSlide();
                }

                $window.off('mousemove.bxSlider');
            }

            return slider;
        };

    })(jQuery);
	$('.bxslider').bxSlider({
		pager: false,
        controls:false,
        auto: true,
        pause: 10000,
        speed: 1500,
        mouseDrag: true,
        prevText: '\t&lt;',
        nextText: '\&gt;',
        onSliderLoad: function(){
            $(".bxslider").css("visibility", "visible");
        }
	});
    $(".fancybox").fancybox();
	var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 4,
        spaceBetween: 30,
        loop: true
    });
    if($(window).width() < 901) {
        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true
        });
    } else {
        // change functionality for larger screens
    }
	$('.bxslider-3').bxSlider({
		pager: false,
        prevText: '\t&lt;',
        nextText: '\&gt;',
	});


	function heightDetect() {
		$(".main-slider-wrap .bx-viewport, .bxslider li, .cert-bg").css("height", $(window).height()-84);
	};
	heightDetect();
	$(window).resize(function() {
		heightDetect();
	});

    // Hinge effect popup
    $('a.hinge').magnificPopup({
        mainClass: 'mfp-with-fade',
        removalDelay: 1000, //delay removal by X to allow out-animation
        callbacks: {
            beforeClose: function() {
                this.content.addClass('hinge');
            },
            close: function() {
                this.content.removeClass('hinge');
            }
        },
        midClick: true
    });
    $('.inline-popups').magnificPopup({
        delegate: 'a',
        removalDelay: 500, //delay removal by X to allow out-animation
        callbacks: {
            beforeOpen: function() {
                this.st.mainClass = this.st.el.attr('data-effect');
            }
        },
        midClick: true // allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source.
    });
    $( ".toggle-category" ).mouseover(function(e) {
        event.preventDefault();
        $('.left-menu-wrapper').toggleClass( "active" );
        $('.main-slider-wrap').toggleClass( "active" );
        $(this).toggleClass('hiden');
    });
    $('#menu .close').click(function(){
        $('#toggle').click();
    });
    $('.v-hide-m .close').click(function(){
        $('.v-hide-m').toggle("slide");
    });
    $( ".left-menu-wrapper ul li span" ).click(function(e) {
        event.preventDefault();
        $(this).next('ul').slideToggle();
    });
    $( ".left-menu-wrapper .toggle-category span" ).click(function(e) {
        event.preventDefault();
        $('.left-menu-wrapper .v-hide-m').toggle();
    });
    $('.v-money-block').hover(function (e) {
        $(this).children('.v-money-block-tooltip').slideToggle();
    });
    $('#toggle').click(function(e){
        event.preventDefault();
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $('body').removeClass('move');
        } else {
            $(this).addClass('active');
            $('body').addClass('move');
            $('html,body').animate({scrollTop: 0},300)
            ulHeight = $('#menu ul').height();
            $('#menu').css('paddingTop',$(window).height()/2-ulHeight/2);
            /*logoL = $('#head .logo').offset().left;
            logoT = $('#head .logo').offset().top;
            $('.submenu .logo').css({top:logoT,left:logoL-87})*/
        }
    });
    $('#menu btn-log').click(function(){
        $('#toggle').click();
    });
    $('.btn-reg').click(function(){
        $('.tab-pane-reg').addClass('active');
        $('.tab-pane-log').removeClass('active');
    });
    $('.btn-log').click(function(){
        $('.tab-pane-log').addClass('active');
        $('.tab-pane-reg').removeClass('active');
    });

    if ($('#map').get(0)) {
        ymaps.ready(function() {
            var myMap = new ymaps.Map("map", {
                center: [55.670632, 37.680040],
                zoom: 11,
                type: 'yandex#map',
                flying: true,
                behaviors: ["drag", "scrollZoom"]
            });
            myMap.controls.add("zoomControl");
            myMap.controls.add("typeSelector");
            myMap.geoObjects.add(new ymaps.Placemark([55.659622, 37.747738], {
                "metaType": "Point",
                "iconContent": "",
                "balloonContent": "г. Москва ул.Перерва 43"
            }, {
                iconLayout: 'default#image',
                iconImageHref: 'image/marker.png',
                iconImageSize: [61, 61],
                iconImageOffset: [-15, -60]
            }));
            myMap.geoObjects.add(new ymaps.Placemark([55.670021, 37.552480], {
                "metaType": "Point",
                "iconContent": "",
                "balloonContent": "г. Москва, Бизнес-центр «Черемушки», ул. Профсоюзная 56, офис 05Д "
            }, {
                iconLayout: 'default#image',
                iconImageHref: 'image/marker.png',
                iconImageSize: [61, 61],
                iconImageOffset: [-15, -60]
            }));
        });
    }
    $('.page-inside-sidebar').stickySidebar({
        topSpacing: -50,
        bottomSpacing: 0
    });
});