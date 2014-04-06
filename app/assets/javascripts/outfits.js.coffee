# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change","#outfit_show", ->
	show_data = {show_id : $('#outfit_show').val()}
	console.log show_data
	$.get "/shows/get_episodes.json", show_data , (data) ->
		$('#episodes').removeClass('hide')
		console.log $('#outfit_episode_id').html()
		$('#outfit_episode_id').html('')
		$.each data, (i, obj) ->
			$('#outfit_episode_id').append "<option id='"+obj.id+"'>"+obj.name+"</option>"