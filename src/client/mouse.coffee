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

    tmp.mousePath = []
  onmousemove: (e) ->
    if mouse.isDown
      tmp.mousePath.push [e.clientX, e.clientY]

      if tmp.mousePath.length > 24
        tmp.mousePath.splice 0, 1
  isDown: false

# export
module.exports = mouse