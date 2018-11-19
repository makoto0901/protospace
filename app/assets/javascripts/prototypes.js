$(document).on('turbolinks:load', function(){
  $('input[type="file"]').on('change', function(e){
    var file = e.target.files[0];
    if (!file.type.match('image.*')) {
      alert("画像ファイルを指定してください。");
      return;
    }

    var frameWidth = $(this).width();
    var frameHeight = $(this).height();
    var preview = $(this).prev('img')[0];
    var reader = new FileReader();
    reader.onload = function(evt){
      preview.src = reader.result;
      preview.width = frameWidth;
      preview.height = frameHeight;
      preview.onload = function(){
        console.log("Load complete");
      };
    }

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = "";
    }

  });
});
