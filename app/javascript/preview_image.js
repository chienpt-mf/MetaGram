$(document).ready(function () {
  function readURL(input) {
    if (input.files) {
      [...input.files].forEach(function (imageFile){
        var reader = new FileReader();
        reader.onload = function(e) {
          if($(".preview-images").children().length < 5) {
            $(".preview-images").append($('<img class="card-img-top" src="' + e.target.result + '">')).addClass("size-pre-img");
          }
          else if($(".preview-images").children().length == 5){
            $(".preview-images").append($('<img class="card-img-top" src="' + e.target.result + '">').attr("hidden", true)).addClass("size-pre-img");
            $(".preview-images").append('<div class="subcount">+ </div>');
          }
          else{
            $(".preview-images").append($('<img class="card-img-top" src="' + e.target.result + '">').attr("hidden", true)).addClass("size-pre-img");
            subcount = $(".preview-images").children().length - 6
            $(".subcount").text("+" + subcount);
            console.log(subcount);
          }
        }
        reader.readAsDataURL(imageFile);
      })
    }
  }

  $("#img-source").change(function() {
    readURL(this);
  });
});
