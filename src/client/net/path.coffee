COMMANDS = require '../commands'
tmp = require '../tmp'

sendPath = (socket) ->
  command = [COMMANDS.PATH]
  path = tmp.mousePath

  data = command.concat path

  socket.send data

  tmp.mousePath = []

# export
module.exports = sendPath