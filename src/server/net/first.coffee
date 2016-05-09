COMMANDS = require '../commands'
canvas = require '../canvas'

first = (socket) ->
  command = COMMANDS.FIRST_SYNC
  base64 = canvas.canvas.toDataURL (err, png) ->
    data = [command, png].join ','

    socket.send data

# export
module.exports = first