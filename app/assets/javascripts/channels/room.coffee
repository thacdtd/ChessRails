App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log "abc"

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #console.log data['message']
    $('#chat_messages').append data['message']
    $('#div_chat_content').animate
      scrollTop: $('#div_chat_content').prop('scrollHeight')

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ""
    event.preventDefault()
  $('#div_chat_content').animate
    scrollTop: $('#div_chat_content').prop('scrollHeight')

