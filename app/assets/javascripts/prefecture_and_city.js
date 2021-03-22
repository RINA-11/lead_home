/*global $*/
    
$(document).on("turbolinks:load",function () {
// まず市区町村を非表示にする
  $("#city_id > option[data-id]").wrap("<span>");
   
  $("#post_prefecture_id").change(function () {
    // 都道府県が変更されるときに一度非表示にする
    $("#city_id > option[data-id]").wrap("<span>");
    // 都道府県のvalueに対応する市区町村のdata-idのoptionを表示する
    $("#city_id option[data-id='"+ $('#post_prefecture_id').val() +"']").unwrap();
  });
});

$(document).on("turbolinks:load",function () {
// まず市区町村を非表示にする
  $("#city_id > option[data-id]").wrap("<span>");
   
  $("#prefecture_id").change(function () {
    // 都道府県が変更されるときに一度非表示にする
    $("#city_id > option[data-id]").wrap("<span>");
    // 都道府県のvalueに対応する市区町村のdata-idのoptionを表示する
    $("#city_id option[data-id='"+ $('#prefecture_id').val() +"']").unwrap();
  });
});