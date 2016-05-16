# первое число массива — это команда
config = require './config'
manager = require './net/manager'
sendPath = require './net/path'

net =
  init: ->
    socket = new WebSocket "ws://#{config.ws.address}:#{config.ws.port}"

    socket.onopen = net.onopen
    socket.onclose = net.onclose
    socket.onmessage = net.onmessage
    socket.onerror = net.onerror

    net.socket = socket
    net.send = net.socket.send
  onopen: ->
    console.log 'connected to the server'

    # sendPath net

    # ping.send()
  onclose: (e) ->
    if e.wasClean
      console.log 'clean close'
    else
      console.log 'dirty close'

    console.log "code: #{event.code}, reason: #{event.reason}"
  onmessage: (e) ->
    manager e.data, net.socket
  onerror: (e) ->
    alert 'error, see console'
    console.log e
  socket: null
  send: null

# export
module.exports = net