# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#label_name', ->
  $.ajax(
    type: 'GET'
    url: '/choose_course/get_num'
    data: {
      label_name: $(this).val()
    }
  ).done (data) ->
    $('#num_area').html(data)
