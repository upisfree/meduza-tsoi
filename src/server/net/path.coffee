cache = require '../cache'
canvas = require '../canvas'

getPath = (path) ->
  cache.mousePath.push path

  ctx = canvas.ctx

  for v, k in path by 2
    if path[k] > 0 and path[k + 1] > 0
      ctx.beginPath()
      ctx.arc parseInt(path[k], 10), parseInt(path[k + 1], 10), 10, 0, 2 * Math.PI, false
      ctx.fillStyle = '#000000'
      ctx.fill()
      ctx.closePath()

# export
module.exports = getPath