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

  $('.UserData__notice').on('click', function() {
    if ($(this).hasClass('rightActtive')) {
    } else {
      $('.UserData__notice').removeClass('rightActive');
      $(this).addClass('rightActive');
    };
  });
});