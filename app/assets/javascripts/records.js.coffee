# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

time = 0
interval = 1
total_time = 40

start = () ->
    time = setInterval ( ->
        update_watch() 
    ), 1000

stop = () ->
    clearTimeout(time)

update_watch = () -> 
    minute = parseInt $('.minute').text()
    second = parseInt $('.second').text()

    if second == 59
        minute++
        second = 0
    else 
        second++

    $('.minute').text(minute)
    $('.second').text(second)
    if minute > 0 and !(minute % interval) and second == 0
        progress = 100 / total_time * minute
        progress = Math.round progress
        $('#progress-bar .bar').css('width',progress+'%')

$ ->     
    $('.actionable .btn')
        .live 'click', -> 
            if $(this).hasClass('btn-inverse')
            then $(this).removeClass('btn-inverse')
            else $(this).addClass('btn-inverse')

    $('#start-stopwatch')
        .click ->
            start()
            $('#pause-stopwatch').show()
            $('#start-stopwatch').hide()

    $('#pause-stopwatch')
        .click ->
            stop()
            $('#start-stopwatch').show()
            $('#pause-stopwatch').hide()
