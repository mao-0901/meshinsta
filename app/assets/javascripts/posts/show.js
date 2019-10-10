$(document).on('turbolinks:load', function() {
	console.log('reloaded1111')
	$('#posts-show').on("click", ".like", function (event) {
		// clickってなんぞ？？
		console.log('like clicked')
		event.preventDefault();
		var $this = $(this)
		// this ってなんぞ？？
		var postId = $(this).data('post-id');
		$.ajax({
			url:'/api/v1/posts/' + postId + '/likes' ,
			type:'POST',
		}).done(function() {
			console.log('liked')
			$this.addClass("dislike").removeClass("like")
		})
		// .done(function(){
		// console.log('==========')
		// 	$(this).addClass("dislike").removeClass("like")
		// });
	});

	$('#posts-show').on("click", ".dislike", function (event) {
		console.log('dislike clicked')
		event.preventDefault();
		var $this = $(this)
		var postId = $(this).data('post-id');
		$.ajax({
			url:'/api/v1/posts/' + postId + '/likes',
			type:'DELETE'
		})
		.done(function(){
			console.log('disliked')
			$this.addClass("like").removeClass("dislike")
		})
	});

// console.log($('.dislike').done(function(){
// 	$(this).addClass(".like").removeClass(".dislike")}));
// console.log($('.like').done(function(){
// 		$(this).addClass(".dislike").removeClass(".like")}));
//console.log($('a.like').data('post-id'));


// var number = 7
// '/posts/' + number
// #{} はrubyの書き方
});