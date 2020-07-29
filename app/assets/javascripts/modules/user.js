$(function() {
  $('.LinkList__main--list').hover(
    function() {
      $(this).children('.greater').css('opacity', '1').animate({paddingRight: '3px'}, 100);
    },
    function() {
      $(this).children('.greater').css('opacity', '0.4').animate({paddingRight: '5px'}, 100);
    }
  );
  $('.LinkList__config--list').hover(
    function() {
      $(this).children('.greater').css('opacity', '1').animate({paddingRight: '3px'}, 100);
    },
    function() {
      $(this).children('.greater').css('opacity', '0.4').animate({paddingRight: '5px'}, 100);
    }
  );

  $('.UserData__info__notice').on('click', function() {
    if ($(this).hasClass('noticeActive')) {
    } else {
      $('.UserData__info__notice').removeClass('noticeActive');
      $(this).addClass('noticeActive');
    };
  });
});