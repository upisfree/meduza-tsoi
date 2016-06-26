WebSocket = require 'ws'
COMMANDS = require '../commands'
tmp = require '../tmp'

# синхронизация путей
sync = (socket) ->
  if socket.readyState is WebSocket.OPEN
    socket.send COMMANDS.SYNC + ',' + tmp.mousePath.join()

# export
module.exports = sync