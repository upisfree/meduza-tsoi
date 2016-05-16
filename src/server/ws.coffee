WebSocketServer = require('ws').Server
config = require './config'
manager = require './net/manager'
firstSync = require './net/first'
ping = require './net/ping'

ws =
  init: ->
    server = new WebSocketServer
      port: config.ws.port
      perMessageDeflate: false

    server.on 'connection', (socket) ->
      console.log "#{server.clients.length} clients, new: ip:#{socket._socket.remoteAddress}"

      setInterval ->
        ping socket
      , 100

      # firstSync socket

      socket.on 'message', (data, flags) ->
        manager data, socket

      socket.on 'close', (code, message) ->
        console.log "#{server.clients.length} clients, client quit, bye!"

    ws.server = server

# export
module.exports = ws