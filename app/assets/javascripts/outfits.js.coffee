# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change","#outfit_show", ->
	show_data = {show_id : $('#outfit_show').val()}
	$.get "/shows/get_episodes.json", show_data , (data) ->
		$('#episodes').removeClass('hide')
		$('#outfit_episode_id').html('')
		$.each data, (key, value) ->
      $('#outfit_episode_id').append "<optgroup label='Season " +key+"'></optgroup>"
      $.each value, (i,obj) ->
        $('#outfit_episode_id').append "<option id='"+obj.id+"'>"+obj.number+" - "+obj.name+"</option>"

$(document).on "change","#outfit_show", ->
	show_data = {show_id : $('#outfit_show').val()}
	$.get "/shows/get_actors.json", show_data , (data) ->
		$('#actors').removeClass('hide')
		$('#outfit_actor_id').html('')
		$.each data, (i, value) ->
			$('#outfit_actor_id').append "<option id='"+value.id+"'>"+value.name+" - "+value.role+"</option>"