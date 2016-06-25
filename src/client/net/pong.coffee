COMMANDS = require '../commands'
tmp = require '../tmp'
interval = require './interval'

# принимаем понг, считаем пинг, перезапускаем setInterval
pong = (data, socket) ->
  if data is tmp.pingSendData
    tmp.ping = Date.now() - tmp.pingSendTime
    # tmp.ping = 80

    interval socket
  else
    console.log 'pong error'

# export
module.exports = pong