COMMANDS = require '../commands'
cache = require '../cache'

sendPath = (socket) ->
  command = [COMMANDS.PATH]
  path = cache.mousePath

  data = command.concat path

  socket.send data

  cache.mousePath = []

# export
module.exports = sendPath