mouse = require './mouse'
tmp = require './tmp'
r = require './renderer'

tick = ->
  g = r.graphics
  
  if mouse.isDown
    g.beginFill tmp.currentColor
    g.drawCircle mouse.pos.curr.x, mouse.pos.curr.y, 10
    g.endFill()

    tmp.mousePath.push tmp.currentColor, mouse.pos.curr.x, mouse.pos.curr.y

  # draw sync
  if tmp.syncPath.length % 3 is 0
    for v, k in tmp.syncPath by 3
      if tmp.syncPath[k] and tmp.syncPath[k + 1] > 0 and tmp.syncPath[k + 2] > 0
        g.beginFill tmp.syncPath[k]
        g.drawCircle +tmp.syncPath[k + 1], +tmp.syncPath[k + 2], 10
        g.endFill()

  r.renderer.render r.stage

  requestAnimationFrame tick

# export
module.exports = tick