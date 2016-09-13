prototype_fileChange = (reader) ->
  return (ev) ->
    target = ev.target
    file = target.files[0]
    reader.readAsDataURL file
    return

prototype_fileLoad = (reader, display_id) ->
  return (ev) ->
    $(display_id).attr 'src', reader.result
    return

$ ->
  $('#js-image_upload_plus').on 'click', ->
    $('#js-image_upload_plus').hide()
    $('#js-image_upload_added').show()

  image_names = ['main', 'sub1', 'sub2', 'sub3']
  for i, elem of image_names
    image = document.getElementById 'js-' + elem + '_image_form'
    reader = new FileReader()
    if image
      image.addEventListener('change', prototype_fileChange(reader), false)
      reader.addEventListener('load', prototype_fileLoad(reader, '#js-' + elem + '_image_display'), false)
