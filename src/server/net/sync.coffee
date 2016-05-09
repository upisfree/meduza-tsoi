COMMANDS = require '../commands'
cache = require '../cache'

sendSync = (socket) ->
  command = [COMMANDS.SYNC]
  path = cache.mousePath

  data = command.concat(path).join(',')

  socket.send data

  if cache.mousePath.length > 25
    cache.mousePath = []

# export
module.exports = sendSync