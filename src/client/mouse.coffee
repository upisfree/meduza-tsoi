mouse =
  init: ->
    window.onmousedown = mouse.onmousedown
    window.onmouseup = mouse.onmouseup
    window.onmousemove = mouse.onmousemove
  onmousedown: ->
    mouse.isDown = true
  onmouseup: ->
    mouse.isDown = false
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