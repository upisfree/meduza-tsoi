WebSocketServer = require('ws').Server
config = require './config'
manager = require './net/manager'
firstSync = require './net/first'
sendPing = require './net/sendPing'

ws =
  init: ->
    server = new WebSocketServer
      port: config.ws.port
      perMessageDeflate: false

    server.on 'connection', (socket) ->
      console.log "#{server.clients.length} clients, new: ip:#{socket._socket.remoteAddress}"

      socket.send Date.now().toString()
      # sendPing socket

      # firstSync socket

      socket.on 'message', (data, flags) ->
        console.log (Date.now() - parseInt(data)) + ' ms'
        # console.log Date.now() - data
        # manager socket, data

      socket.on 'close', (code, message) ->
        console.log "#{server.clients.length} clients, client quit, bye!"

    ws.server = server

# export
module.exports = ws