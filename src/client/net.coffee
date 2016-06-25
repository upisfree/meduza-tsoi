# первое число массива — это команда
config = require './config'
tmp = require './tmp'
manager = require './net/manager'
ping = require './net/ping'

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

    ping net.socket
    tmp.pingInterval = setInterval ->
      ping net.socket
    , config.period.ping
  onclose: (e) ->
    clearInterval tmp.syncInterval

    if e.wasClean
      console.log 'clean close'
    else
      console.log 'dirty close'

    console.log "code: #{event.code}, reason: #{event.reason}"
  onmessage: (e) ->
    # console.log e.data
    manager e.data, net.socket
  onerror: (e) ->
    clearInterval tmp.syncInterval
  
    alert 'error, see console'
    console.log e
  socket: null
  send: null

# export
module.exports = net