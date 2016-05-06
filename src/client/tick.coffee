mouse = require './mouse'
cache = require './cache'
getContext = require './utils/getContext'

ctx = getContext()

tick = ->
  if mouse.isDown
    ctx.lineTo mouse.pos.curr.x, mouse.pos.curr.y
    ctx.moveTo mouse.pos.prev.x, mouse.pos.prev.y
    ctx.stroke()

    cache.mousePath.push mouse.pos.curr.x, mouse.pos.curr.y

  # draw sync
  for v, k in cache.syncPath by 2
    ctx.fillRect cache.syncPath[k - 1], cache.syncPath[k + 1], 2, 2

  mouse.pos.prev.x = mouse.pos.curr.x
  mouse.pos.prev.y = mouse.pos.curr.y

  requestAnimationFrame tick

# export
module.exports = tick