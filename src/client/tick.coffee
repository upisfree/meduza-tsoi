mouse = require './mouse'
cache = require './cache'
r = require './renderer'

tick = ->
  g = r.graphics
  
  if mouse.isDown
    g.beginFill 0x000000
    g.drawCircle mouse.pos.curr.x, mouse.pos.curr.y, 10
    g.endFill()

    cache.mousePath.push mouse.pos.curr.x, mouse.pos.curr.y

  # draw sync
  if cache.syncPath.length % 2 is 0
    i = 0
    while i < cache.syncPath.length - 1
      if cache.syncPath[i] > 0 and cache.syncPath[i + 1] > 0
        g.beginFill 0x000000
        g.drawCircle +cache.syncPath[i], +cache.syncPath[i + 1], 10
        g.endFill()

      i += 2

  # update coordinates
  mouse.pos.prev.x = mouse.pos.curr.x
  mouse.pos.prev.y = mouse.pos.curr.y

  r.renderer.render r.stage

  requestAnimationFrame tick

# export
module.exports = tick