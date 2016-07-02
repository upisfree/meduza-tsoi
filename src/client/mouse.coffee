tmp = require './tmp'

mouse =
  init: ->
    window.onmousedown = mouse.onmousedown
    window.onmouseup = mouse.onmouseup
    window.onmousemove = mouse.onmousemove
  onmousedown: (e) ->
    mouse.isDown = true

    console.log e

    tmp.mousePath.push [e.pageX, e.pageY]
  onmouseup: ->
    mouse.isDown = false

    tmp.netPath.push tmp.mousePath
    tmp.mousePath = []
  onmousemove: (e) ->
    if mouse.isDown
      # MOVE TO TICK.COFFEE
      p = tmp.mousePath
      
      ctx.beginPath()
      ctx.moveTo p[p.length - 1][0], p[p.length - 1][1]
      ctx.lineTo e.pageX, e.pageY
      ctx.stroke()

      p.push [e.pageX, e.pageY]
  isDown: false

# export
module.exports = mouse