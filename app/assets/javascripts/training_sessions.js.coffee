$(document).on 'ready page:load', ->

   $('#training_session_started_at').datetimepicker
    format: "DD/MM/YY HH:mm"
    extraFormats: [ "DD/MM/YY HH:mm" ]
    locale: "fr"
    sideBySide: true
    stepping: 15
    minDate: moment().subtract(1, 'days')