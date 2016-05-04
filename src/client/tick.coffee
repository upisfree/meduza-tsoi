mouse = require './mouse'
getContext = require './utils/getContext'

ctx = getContext()

tick = ->
  if mouse.isDown
    ctx.lineTo mouse.pos.curr.x, mouse.pos.curr.y
    ctx.moveTo mouse.pos.prev.x, mouse.pos.prev.y
    ctx.stroke()

  mouse.pos.prev.x = mouse.pos.curr.x
  mouse.pos.prev.y = mouse.pos.curr.y

  requestAnimationFrame tick

# export
module.exports = tick