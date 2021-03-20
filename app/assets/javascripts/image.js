/*global $*/

$(document).on("turbolinks:load", function() {
  $("#img_1").on("change", function(e) {
    // 1枚だけ表示する
    var file = e.target.files[0];

    // ファイルリーダー作成
    var fileReader = new FileReader();
    fileReader.onload = function() {
      // Data URIを取得
      var dataUri = this.result;

      // div要素に表示
      $("#img-form_1").empty();
      $("#img-form_1").append($("<img>").attr({
        src: dataUri,
        class: "image-preview",
        title: file.name
      }));
    }
    // ファイルをData URIとして読み込む
    fileReader.readAsDataURL(file);
  });
});

$(document).on("turbolinks:load", function() {
  $("#img_2").on("change", function(e) {
    var file = e.target.files[0];

    var fileReader = new FileReader();
    fileReader.onload = function() {
      var dataUri = this.result;

      $("#img-form_2").empty();
      $("#img-form_2").append($("<img>").attr({
        src: dataUri,
        class: "image-preview",
        title: file.name
      }));
    }
    fileReader.readAsDataURL(file);
  });
});

$(document).on("turbolinks:load", function() {
  $("#img_3").on("change", function(e) {
    var file = e.target.files[0];

    var fileReader = new FileReader();
    fileReader.onload = function() {
      var dataUri = this.result;

      $("#img-form_3").empty();
      $("#img-form_3").append($("<img>").attr({
        src: dataUri,
        class: "image-preview",
        title: file.name
      }));
    }
    fileReader.readAsDataURL(file);
  });
});

$(document).on("turbolinks:load", function() {
  $("#img_4").on("change", function(e) {
    var file = e.target.files[0];

    var fileReader = new FileReader();
    fileReader.onload = function() {
      var dataUri = this.result;

      $("#img-form_4").empty();
      $("#img-form_4").append($("<img>").attr({
        src: dataUri,
        class: "image-preview",
        title: file.name
      }));
    }
    fileReader.readAsDataURL(file);
  });
});

$(document).on("turbolinks:load", function() {
  $("#img_5").on("change", function(e) {
    var file = e.target.files[0];

    var fileReader = new FileReader();
    fileReader.onload = function() {
      var dataUri = this.result;

      $("#img-form_5").empty();
      $("#img-form_5").append($("<img>").attr({
        src: dataUri,
        class: "image-preview",
        title: file.name
      }));
    }
    fileReader.readAsDataURL(file);
  });
});