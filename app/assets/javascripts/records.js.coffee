# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

time = 0
interval = 1
total_time = 40

start = () ->
    time = setInterval ( ->
        update_watch() 
        save_record()
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
        .on 'click', -> 
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

    $('#show-info')
        .click ->
            if $('.help-block').is(':visible')
                $('#show-info').addClass('btn-info')
                $('.help-block').hide()
            else
                $('#show-info').removeClass('btn-info')
                $('.help-block').show()

save_record = ->
    #minute = $('.minute').text()
    minute = $('.second').text()
    teacher = $('#teacher-selector .btn-inverse:first').text()
    student = $('#student-selector .btn-inverse:first').text()
    grouping = $('#grouping-selector .btn-inverse:first').text()
    topic = $('#topic-selector .btn-inverse:first').text()
    notes = $('#notes').val()
    $.post(
        "/recording_sheets/1/records"
        { record: {minute: minute, teacher: teacher, student: student, grouping: grouping, topic: topic, notes: notes }}
        (record) ->
            update_table record
        "json")

update_table = (record) ->
    $('#results tbody')
        .append("<tr><td>#{record.minute}</td><td>#{record.teacher}#{record.student}#{record.grouping}#{record.topic}</td><td>#{record.notes}</td></tr>")
