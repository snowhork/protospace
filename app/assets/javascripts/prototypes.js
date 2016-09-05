function fileChange(reader) {
    return function(ev) {
	var target = ev.target;
	var files = target.files;
	var file = files[0]
	reader.readAsDataURL(file);
	console.log(reader)
    }
}

function fileLoad(reader, display_id) {
    return function(ev) {
	console.log(display_id)
	$(display_id).css('background-image', "url(" + reader.result + ")")
    }
}

$(window).on("load", function() {
    var main_image = document.getElementById('js-main_image_form')
    var sub1_image = document.getElementById('js-sub1_image_form')
    var sub2_image = document.getElementById('js-sub2_image_form')

    var main_reader = new FileReader();
    var sub1_reader = new FileReader();
    var sub2_reader = new FileReader();

    main_image.addEventListener('change', fileChange(main_reader), false)
    sub1_image.addEventListener('change', fileChange(sub1_reader), false)
    sub2_image.addEventListener('change', fileChange(sub2_reader), false)

    main_reader.addEventListener('load', fileLoad(main_reader, '#js-main_image_display'), false)
    sub1_reader.addEventListener('load', fileLoad(sub1_reader, '#js-sub1_image_display'), false)
    sub2_reader.addEventListener('load', fileLoad(sub2_reader, '#js-sub2_image_display'), false)
});
