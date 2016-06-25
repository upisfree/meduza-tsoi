tmp = require '../tmp'
canvas = require '../canvas'
sync = require './sync'

path = (path, socket) ->
  ctx = canvas.ctx

  for v, k in path by 2
    if path[k] > 0 and path[k + 1] > 0 and path[k + 2] > 0 and path[k + 3] > 0
      ctx.beginPath()
      ctx.moveTo parseInt(path[k], 10), parseInt(path[k + 1], 10)
      ctx.lineTo parseInt(path[k + 2], 10), parseInt(path[k + 3], 10)
      ctx.fillStyle = socket._color.replace '0x', '#'
      ctx.stroke()
      ctx.closePath()

  # шлём пути
  sync socket

# export
module.exports = path