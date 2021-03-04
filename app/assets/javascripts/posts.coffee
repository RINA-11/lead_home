###global $###

# まずBを非表示にする
$('#city_id > option[data-id]').wrap '<span>'
$('#post_prefecture_id').change ->
  # Aが変更されるときに一度非表示にする
  $('#city_id > option[data-id]').wrap '<span>'
  # Aのvalueに対応するBのdata-idのoptionを表示する
  $('#city_id option[data-id=\'' + $('#post_prefecture_id').val() + '\']').unwrap()
  return