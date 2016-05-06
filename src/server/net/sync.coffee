COMMANDS = require '../commands'
cache = require '../cache'

sendSync = (socket) ->
  command = new Uint16Array [COMMANDS.SYNC]
  
  length = 0
  for i in cache.mousePath
    length += i.length

  path = new Uint16Array length
  for i in cache.mousePath
    path.set i

  data = new Uint16Array command.length + path.length
  data.set command
  data.set path, command.length

  socket.send data

  if cache.mousePath.length > 100
    cache.mousePath = []

# export
module.exports = sendSync