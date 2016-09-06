function fileChange(reader) {
    return function(ev) {
	var target = ev.target;
	var files = target.files;
	var file = files[0];
	reader.readAsDataURL(file);
    }
}

function fileLoad(reader, display_id) {
    return function(ev) {
	$('#js-user_avatar_display').css('background-image', 'url(' + reader.result + ')');
    }
}

$(window).on("load", function() {
    var image = document.getElementById('js-user_avatar_form');
    var reader = new FileReader();
    if(image){
	image.addEventListener('change', fileChange(reader), false);
	reader.addEventListener('load', fileLoad(reader, '#js-user_avatar_display'), false);
    }
});

