COMMANDS = require '../commands'
WebSocket = require 'ws'

# принимаем пинг и шлём понг
ping = (data, socket) ->
  if socket.readyState is WebSocket.OPEN
    socket.send "#{COMMANDS.PONG},#{data}"

# export
module.exports = ping