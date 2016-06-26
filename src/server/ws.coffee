WebSocketServer = require('ws').Server
config = require './config'
tmp = require './tmp'
manager = require './net/manager'

ws =
  init: ->
    server = new WebSocketServer
      port: config.ws.port

    server.on 'connection', (socket) ->
      console.log "#{server.clients.length} clients, new: ip:#{socket._socket.remoteAddress}"

      socket._color = config.defaultColor

      socket.on 'message', (data, flags) ->
        manager data, socket

      socket.on 'close', (code, message) ->
        console.log "#{server.clients.length} clients, client quit, bye!"

    ws.server = server

# export
module.exports = ws