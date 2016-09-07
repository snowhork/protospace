function prototype_fileChange(reader) {
    return function(ev) {
	var target = ev.target;
	var files = target.files;
	var file = files[0];
	reader.readAsDataURL(file);
    }
}

function prototype_fileLoad(reader, display_id) {
    return function(ev) {
	$(display_id).attr('src', reader.result);
    }
}

$(window).on("load", function() {
    var image_names = ['main', 'sub1', 'sub2', 'sub3'];
    $.each(image_names, function(index, elem) {
	var image = document.getElementById('js-' + elem + '_image_form');
	var reader = new FileReader();
	if(image) {
	    image.addEventListener('change', prototype_fileChange(reader), false);
	    reader.addEventListener('load', prototype_fileLoad(reader, '#js-' + elem + '_image_display'), false);
	}
    });

    $('#js-image_upload_plus').on('click', function() {
	$('#js-image_upload_plus').hide();
	$('#js-image_upload_added').show();
    });
});
