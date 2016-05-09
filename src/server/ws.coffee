WebSocketServer = require('ws').Server
manager = require './net/manager'
firstSync = require './net/first'

ws =
  init: ->
    server = new WebSocketServer
      port: 4070

    server.on 'connection', (socket) ->
      console.log 'client connected'

      firstSync socket

      socket.on 'message', (data, flags) ->
        manager socket, data

    ws.server = server

# export
module.exports = ws