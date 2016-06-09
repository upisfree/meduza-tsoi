WebSocket = require 'ws'
COMMANDS = require '../commands'
canvas = require '../canvas'
tmp = require '../tmp'

# синхронизация путей
sync = (socket) ->
  canvas.canvas.toDataURL 'image/png', (err, url) ->
    if socket.readyState is WebSocket.OPEN
      socket.send COMMANDS.SYNC + ',' + url

      # transparent

# export
module.exports = sync