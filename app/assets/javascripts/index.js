$(document).ready(function(){
	$('.form_auth_close').click(function(){
		$('.pop-up-auth').fadeOut();
	});


	$('.div_button_auth_header').click(function(){
		$('.pop-up-auth').fadeIn();
	});
});