WebSocket = require 'ws'
COMMANDS = require '../commands'
tmp = require '../tmp'

# синхронизация путей
sync = (socket) ->
  command = [COMMANDS.SYNC]
  path = tmp.mousePath

  data = command.concat(path).join(',')

  # if data.length > 0 # не слать пустоту

  if socket.readyState is WebSocket.OPEN
    socket.send data

  if tmp.mousePath.length > 25
    tmp.mousePath = []

# export
module.exports = sync