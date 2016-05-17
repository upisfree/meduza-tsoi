COMMANDS = require '../commands'
canvas = require '../canvas'
WebSocket = require 'ws'

# полная синхронизация
full = (socket) ->
  command = COMMANDS.FULL_SYNC
  base64 = canvas.canvas.toDataURL (err, png) ->
    data = [command, png].join ','

    if socket.readyState is WebSocket.OPEN
      socket.send data

# export
module.exports = full