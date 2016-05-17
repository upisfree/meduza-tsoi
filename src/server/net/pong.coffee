COMMANDS = require '../commands'
interval = require './interval'

# принимаем понг, считаем пинг, отсылаем его обратно и перезапускает setInterval клиента
pong = (data, socket) ->
  if data is socket._pingSendData
    socket._ping = Date.now() - socket._pingSendTime
    socket.send "#{COMMANDS.PONG},#{socket._ping}"

    interval socket
  else
    console.log 'ping error'

# export
module.exports = pong