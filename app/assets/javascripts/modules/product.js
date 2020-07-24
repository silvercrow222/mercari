$(function(){
  var cameraPosition = function() {
    if ($('#image-box-1').children('.item-image').length == 4 || $('#image-box-1').children('.item-image').length == 9) {
      $('.camera').css('top', '-95px').css('left', '574px');
    } else {
      $('.camera').css('top', '64px').css('left', '-78px');
    };
  };

  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  $('#img-file').change(function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#image-box__container').css('display', 'none')   
      }
      fileReader.onloadend = function() {
        var fileIndex = [1,2,3,4,5,6,7,8,9,10];
        lastIndex = $('.item-image:last').data('index');
        fileIndex.splice(0, lastIndex);
        var src = fileReader.result
        var html= `<div class='item-image' data-index="${fileIndex[0]}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="120" height="120" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete js-remove'>削除</div>
                    </div>
                  </div>`
        $('#image-box__container').before(html);
        $('#image-box__container').attr('data-index', fileIndex[0] + 1)
        cameraPosition();
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });

  var dropArea = document.getElementById("image-box-1");
window.onload = function(e){
  dropArea.addEventListener("dragover", function(e){
    e.preventDefault();
    $(this).children('#image-box__container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
  },false);
  dropArea.addEventListener("dragleave", function(e){
    e.preventDefault();
    $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
  },false);
  dropArea.addEventListener("drop", function(e) {
    e.preventDefault();
    $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
    var files = e.dataTransfer.files;
    $.each(files, function(i,file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + i + 1
      fileReader.readAsDataURL(file);
      if (num==10){
        $('#image-box__container').css('display', 'none')   
      }
      fileReader.onload = function() {
        var fileIndex = [1,2,3,4,5,6,7,8,9,10];
        lastIndex = $('.item-image:last').data('index');
        fileIndex.splice(0, lastIndex);
        var src = fileReader.result
        var html =`<div class='item-image' data-index="${fileIndex[0]}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="120" height="120" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
      $('#image-box__container').before(html);
      $('#image-box__container').attr('data-index', fileIndex[0] + 1)
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
    })
  })
}

  window.onload = function() {
    cameraPosition();
    $('.hidden-destroy').each(function(index) {
      var i = index
      if ($('#boxcheck')[0].innerText.includes(i)) {
        $(`#product_images_attributes_${i}__destroy`)[0].checked = true;
      };
    });
  }

  $(document).on("click", '.item-image__operetion--delete', function(){
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')
    if(file_field.files.length==1){
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      $.each(file_field.files, function(i,input){
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      file_field.files = dataBox.files
    }
    target_image.remove()
    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
    const targetIndex = $(this).parent().parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    cameraPosition();
  });

  $('.btn1').on('click', function (e) {
    if (document.getElementById('child_category_edit').value == "---") {
      e.preventDefault();
      $('.error-message').removeClass("error-message-hidden");
      $("html,body").animate({scrollTop:$('#about').offset().top});
    }
    if (document.getElementById('grandchild_category_edit').value == "---") {
      e.preventDefault();
      $('.error-message').removeClass("error-message-hidden");
      $("html,body").animate({scrollTop:$('#about').offset().top});
    }
    if (document.getElementById('child_category').value == "---") {
      e.preventDefault();
      $('.error-message').removeClass("error-message-hidden");
      $("html,body").animate({scrollTop:$('#about').offset().top});
    }
    if (document.getElementById('grandchild_category').value == "---") {
      e.preventDefault();
      $('.error-message').removeClass("error-message-hidden");
      $("html,body").animate({scrollTop:$('#about').offset().top});
    }
  });

  $('.display-none').hide();

  var check = []
  var url = `${$('#form1').attr('action')}?`
  $('.item-image__operetion--delete').on('click', function() {
    i = $(this).parent().parent().data('index');
    $('.hidden-destroy').each(function(index, Element) {
      if (index == i) {
        $(this).prop('checked', true);
        check.push(index);
        dataFirst = `boxcheck%5B%5D=${index}`
        data = `&boxcheck%5B%5D=${index}`
        if (url.slice(-1) == "?") {
          url += dataFirst
        } else {
          url += data
        }
        $('#form1').attr('action', url)
      };
    });
  });
});