getContext = require './utils/getContext'

ctx = getContext()

mouse =
  init: ->
    window.onmousedown = mouse.onmousedown
    window.onmouseup = mouse.onmouseup
    window.onmousemove = mouse.onmousemove

    ctx.strokeStyle = 'black'
    ctx.lineWidth = 1
    # ctx.lineJoin = ctx.lineCap = 'round'
  onmousedown: ->
    mouse.isDown = true

    ctx.beginPath()
  onmouseup: ->
    mouse.isDown = false

    ctx.closePath()
  onmousemove: (e) ->
    mouse.pos.prev.x = mouse.pos.curr.x
    mouse.pos.prev.y = mouse.pos.curr.y
    mouse.pos.curr.x = e.clientX
    mouse.pos.curr.y = e.clientY
  pos:
    curr:
      x: 0
      y: 0
    prev:
      x: 0
      y: 0
  isDown: false

# export
module.exports = mouse