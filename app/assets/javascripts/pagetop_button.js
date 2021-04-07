/*global $*/

$(document).on("turbolinks:load",function () {
  var appear = false;
  var page_top = $(".fa-caret-square-up");
  $(window).scroll(function () {
    if ($(this).scrollTop() > 500) { 
      if (appear == false) {
        appear = true;
        page_top.stop().animate({
          "right": "30px" //右から30pxの位置に
        }, 500); //0.3秒かけて現れる
      }
    } else {
      if (appear) {
        appear = false;
        page_top.stop().animate({
          "right": "-50px" //右から-50pxの位置に
        }, 500); //0.3秒かけて隠れる
      }
    }
  });
  
  $(".fa-caret-square-up").click(function(){
    var time = 500;
    var href= $(this).attr("href");
    var target = $(href == "#" ? "html" : href);
    var distance = target.offset().top;
    $("html, body").animate({scrollTop:distance}, time, "swing");
    return false;
  });
});
