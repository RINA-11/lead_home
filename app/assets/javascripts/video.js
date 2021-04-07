/*global $*/

$(document).on("turbolinks:load", function() {
  $("#video").on("change", function(e) {
    // 1枚だけ表示する
    var file = e.target.files[0];

    // ファイルリーダー作成
    var fileReader = new FileReader();
    fileReader.onload = function() {
      // Data URIを取得
      var dataUri = this.result;

      // div要素に表示
      $("#video-form").empty();
      $("#video-form").append($("<video>").attr({
        src: dataUri,
        class: "video-preview img-responsive",
        muted: "true",
        playsinline: "true",
        controls: "true",
        controlslist: "nodownload",
        disablePictureInPicture: "true",
        title: file.name
      }));
    }
    // ファイルをData URIとして読み込む
    fileReader.readAsDataURL(file);
  });
});

/*
$(document).on("turbolinks:load", function() {
  $fileField = $("#video")

  $($fileField).on("change", $fileField, function(e) {

      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#video-form");

      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($("<video>").attr({
            src: e.target.result,
            class: "video-preview",
            autoplay: "autoplay",
            loop: "loop",
            playsinline: "true",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });
*/