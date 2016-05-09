WebSocketServer = require('ws').Server
config = require './config'
manager = require './net/manager'
firstSync = require './net/first'

ws =
  init: ->
    server = new WebSocketServer
      port: config.ws.port

    server.on 'connection', (socket) ->
      console.log "#{server.clients.length} clients, new: ip:#{socket._socket.remoteAddress}"

      firstSync socket

      socket.on 'message', (data, flags) ->
        manager socket, data

      socket.on 'close', (code, message) ->
        console.log "#{server.clients.length} clients, client quit, bye!"

    ws.server = server

# export
module.exports = ws