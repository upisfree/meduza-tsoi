COMMANDS = require '../commands'
cache = require '../cache'
interval = require './interval'

pong =
  send: (data, socket) -> # приняли пинг, отослали понг с теми же данными
    socket.send "#{COMMANDS.PONG},#{data}"
  get: (data, socket) -> # приняли время пинга, поставили его, перезапустили setInterval
    cache.ping = data

    interval socket

# export
module.exports = pong