user_fileChange = (reader) ->
  return (ev) ->
    target = ev.target
    file = target.files[0]
    reader.readAsDataURL(file)
    return

user_fileLoad = (reader, display_id) ->
  return (ev) ->
    	$('#js-user_avatar_display').css('background-image', 'url(' + reader.result + ')')

$ ->
  image = document.getElementById('js-user_avatar_form')
  reader = new FileReader()
  if(image)
    image.addEventListener('change', user_fileChange(reader), false)
    reader.addEventListener('load', user_fileLoad(reader, '#js-user_avatar_display'), false)
