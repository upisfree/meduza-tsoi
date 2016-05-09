ws = require './ws'
canvas = require './canvas'
sendSync = require './net/sync'

ws.init()
# canvas.init()

# TODO: отдельный setInterval для каждого клиента в зависимости от пинга
setInterval ->
  ws.server.clients.forEach (socket) ->
    sendSync socket
, 30