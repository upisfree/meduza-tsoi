COMMANDS = require '../commands'
cache = require '../cache'

sendPath = (net) ->
  setInterval ->
    command = new Uint16Array [COMMANDS.PATH]
    path = new Uint16Array cache.mousePath

    data = new Uint16Array command.length + path.length
    data.set command
    data.set path, command.length

    net.socket.send data

    cache.mousePath = []
  , 30

# export
module.exports = sendPath