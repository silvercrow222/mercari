$(function() {
  //画像にマウスを乗せたら発動
  $('.photo').hover(function() {
    $('.photo').addClass('photoActive');
    $('.photoActive').removeClass('photo');
  // //ここにはマウスを離したときの動作を記述
  }, function() {
    $('.photoActive').removeClass('photoActive');
  });
});
$(function() {
  //画像にマウスを乗せたら発動
  $('.photoActive').hover(function() {
    $('.photoActive').addClass('photo');
    $('.photo').removeclass('photoActive');
  // //ここにはマウスを離したときの動作を記述
  }, function() {
    $('.photo').removeClass('photo');
  });
});