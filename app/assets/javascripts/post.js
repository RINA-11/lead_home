/*global $*/
// まずBを非表示にする
$('#post_city_id > option[data-id]').wrap('<span>');
 
$('#post_prefecture_id').change(function () {
  // Aが変更されるときに一度非表示にする
  $('#post_city_id > option[data-id]').wrap('<span>');
  // Aのvalueに対応するBのdata-idのoptionを表示する
  $("#post_city_id option[data-id='"+ $('#post_prefecture_id').val() +"']").unwrap();
});