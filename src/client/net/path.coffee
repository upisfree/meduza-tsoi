COMMANDS = require '../commands'
tmp = require '../tmp'

sendPath = (socket) ->
  command = [COMMANDS.PATH]
  path = tmp.netPath

  data = command.concat path

  socket.send data

  tmp.netPath = []

# export
module.exports = sendPath