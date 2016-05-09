COMMANDS = require '../commands'
cache = require '../cache'

sendPath = (net) ->
  setInterval ->
    command = [COMMANDS.PATH]
    path = cache.mousePath

    data = command.concat path

    net.socket.send data

    cache.mousePath = []
  , 30

# export
module.exports = sendPath