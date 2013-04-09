# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->     
    $('select')
        .on 'change', ->
            position = $(this).attr('position')
            data = $('select[position='+position+']').serialize();
            $.getJSON(
                '/dashboard/batch',
                 data, (response)->
                    drawChart response, position
                 )

