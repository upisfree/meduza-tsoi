COMMANDS = require '../commands'
WebSocket = require 'ws'

# шлём пинг
ping = (socket) ->
  socket._pingSendTime = Date.now()
  socket._pingSendData = 'random data here'
  
  if socket.readyState is WebSocket.OPEN
    socket.send "#{COMMANDS.PING},#{socket._pingSendData}"

# export
module.exports = ping