COMMANDS = require '../commands'
cache = require '../cache'

pong =
  send: (data, socket) -> # приняли пинг, отослали понг с теми же данными
    socket.send "#{COMMANDS.PONG},#{data}"
  get: (data) -> # приняли время пинга, поставили его, перезапустили setInterval
    cache.ping = data

    console.log cache.ping

# export
module.exports = pong