tmp = require '../tmp'
canvas = require '../canvas'

getPath = (path) ->
  tmp.mousePath.push path

  ctx = canvas.ctx

  for v, k in path by 3
    if path[k] and path[k + 1] > 0 and path[k + 2] > 0
      ctx.beginPath()
      ctx.arc parseInt(path[k + 1], 10), parseInt(path[k + 2], 10), 10, 0, 2 * Math.PI, false
      ctx.fillStyle = path[k].replace '0x', '#'
      ctx.fill()
      ctx.closePath()

# export
module.exports = getPath