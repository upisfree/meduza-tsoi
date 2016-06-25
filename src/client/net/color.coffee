COMMANDS = require '../commands'
tmp = require '../tmp'

color = (socket) ->
  tmp.currentColor = '#' + (Math.random() * 0xFFFFFF << 0).toString(16)

  ctx.strokeStyle = tmp.currentColor

  socket.send "#{COMMANDS.COLOR},#{tmp.currentColor}"

# export
module.exports = color