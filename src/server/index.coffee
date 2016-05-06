manager = require './net/manager'
sendSync = require './net/sync'
WebSocketServer = require('ws').Server
wss = new WebSocketServer { port: 4070 }

wss.on 'connection', (ws) ->
  console.log 'client connected'

  ws.on 'message', (data) ->
    manager ws, data



# TODO: отдельный setInterval для каждого клиента в зависимости от пинга




setInterval ->
  wss.clients.forEach (socket) ->
    sendSync socket
, 30