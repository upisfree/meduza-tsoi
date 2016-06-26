tmp = require './tmp'

mouse =
  init: ->
    window.onmousedown = mouse.onmousedown
    window.onmouseup = mouse.onmouseup
    window.onmousemove = mouse.onmousemove
  onmousedown: (e) ->
    mouse.isDown = true

    tmp.mousePath.push [e.clientX, e.clientY]
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
      ctx.lineTo e.clientX, e.clientY
      ctx.stroke()

      p.push [e.clientX, e.clientY]
  isDown: false

# export
module.exports = mouse