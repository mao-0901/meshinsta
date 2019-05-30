$(document).on('turbolinks:load', function() {
	console.log('hogeeeeeeeeeee')
	$(".like").click(function(event){
		event.preventDefault();
		$(this).css("color", "gray")
	});
	$(".dislike").click(function(event){
		event.preventDefault();
		$(this).css("color", "pink")
	});
});