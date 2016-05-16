COMMANDS = require '../commands'

# принимаем понг, считаем пинг, отсылаем его обратно и перезапускает setInterval клиента
pong = (data, socket) ->
  if data is socket._pingSendData
    socket._ping = Date.now() - socket._pingSendTime
    socket.send "#{COMMANDS.PONG},#{socket._ping}"

    console.log socket._ping

    # clearInterval -> setInterval
  else
    console.log 'ping error'

# export
module.exports = pong