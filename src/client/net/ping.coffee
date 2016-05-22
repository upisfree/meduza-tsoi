COMMANDS = require '../commands'
tmp = require '../tmp'

# шлём пинг
ping = (socket) ->
  tmp.pingSendTime = Date.now()
  tmp.pingSendData = 'random data here'

  socket.send "#{COMMANDS.PING},#{tmp.pingSendData}"

# export
module.exports = ping