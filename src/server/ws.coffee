WebSocketServer = require('ws').Server
manager = require './net/manager'

ws =
  init: ->
    server = new WebSocketServer
      port: 4070

    server.on 'connection', (socket) ->
      console.log 'client connected'

      socket.on 'message', (data, flags) ->
        manager socket, data

    ws.server = server

# export
module.exports = ws