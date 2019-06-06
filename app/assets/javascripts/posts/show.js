$(document).on('turbolinks:load', function() {
	$(".like").click(function(event){
		event.preventDefault();
		$(this).css("color", "gray")
		$(this).data('post-id');
		$.ajax({
			url:'/api/v1/likes',
      type:'POST'
		})
	});

	$(".dislike").click(function(event){
		event.preventDefault();
		$(this).css("color", "pink");
		$(this).data('post-id');
		$.ajax({
			url:'/api/v1/likes',
			type:'POST'
		})
	});

	//console.log($('a.dislike').data('post-id'));
	//console.log($('a.like').data('post-id'));
});