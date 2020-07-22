$(function() {
  $('.ProductShow__images--image').hover(
    function() {
      if ($(this).hasClass('active')) {
      } else {
        $('.ProductShow__images--image').removeClass('active');
        $(this).addClass('active');
        $('.ProductShow__imageTop').attr({'src': $(this).attr('src')});
      }
    }, function() {
    }
  );
});