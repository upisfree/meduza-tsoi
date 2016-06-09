tmp = require '../tmp'
canvas = require '../canvas'
sync = require './sync'

path = (path, socket) ->
  ctx = canvas.ctx

  for v, k in path by 3
    if path[k] and path[k + 1] > 0
      ctx.beginPath()
      ctx.arc parseInt(path[k], 10), parseInt(path[k + 1], 10), 10, 0, 2 * Math.PI, false
      ctx.fillStyle = socket._color.replace '0x', '#'
      ctx.fill()
      ctx.closePath()

  # шлём пути
  sync socket

# export
module.exports = path