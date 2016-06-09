WebSocketServer = require('ws').Server
config = require './config'
tmp = require './tmp'
manager = require './net/manager'
fullSync = require './net/full'

ws =
  init: ->
    server = new WebSocketServer
      port: config.ws.port

    server.on 'connection', (socket) ->
      console.log "#{server.clients.length} clients, new: ip:#{socket._socket.remoteAddress}"

      socket._color = '0x000000'

      fullSync socket

      socket.on 'message', (data, flags) ->
        manager data, socket

      socket.on 'close', (code, message) ->
        console.log "#{server.clients.length} clients, client quit, bye!"

    ws.server = server

# export
module.exports = ws