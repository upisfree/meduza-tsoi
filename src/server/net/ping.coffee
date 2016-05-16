COMMANDS = require '../commands'

# шлём пинг
ping = (socket) ->
  socket._pingSendTime = Date.now()
  socket._pingSendData = 'random data here'

  socket.send "#{COMMANDS.PING},#{socket._pingSendData}"

# export
module.exports = ping