WebSocketServer = require('ws').Server
config = require './config'
tmp = require './tmp'
manager = require './net/manager'
fullSync = require './net/full'
ping = require './net/ping'
generateId = require './utils/generateId'

ws =
  init: ->
    server = new WebSocketServer
      port: config.ws.port

    server.on 'connection', (socket) ->
      socket._id = generateId 8
      tmp.clients[socket._id] = socket

      console.log "#{server.clients.length} clients, new: ip:#{socket._socket.remoteAddress}"

      ping socket
      socket._pingInterval = setInterval ->
        console.log 'new ping'
        ping socket
      , config.period.ping

      fullSync socket

      socket.on 'message', (data, flags) ->
        manager data, socket

      socket.on 'close', (code, message) ->
        clearInterval socket._fullSyncInterval
        clearInterval socket._syncInterval
        
        delete tmp.clients[socket._id]

        console.log "#{server.clients.length} clients, client quit, bye!"

    ws.server = server

# export
module.exports = ws