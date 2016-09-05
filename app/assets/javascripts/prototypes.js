var reader = new FileReader();

$(window).on("load", function() {
    var main_image = document.getElementById('js-main_image_form');
    main_image.addEventListener('change', function(ev) {
	var target = ev.target;
	var files = target.files;
	var file = files[0];

	reader.readAsDataURL(file);
    } ,false);
    reader.addEventListener('load', function() {
	$('#js-main_image_display').css('background-image', "url(" + reader.result + ")")
    }, false);
});
