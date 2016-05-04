elem = require './getElement'

initCanvas = ->
  canvas = elem.byTag('canvas')[0]

  canvas.width = window.innerWidth
  canvas.height = window.innerHeight

window.onresize = ->
  initCanvas()

# export
module.exports = initCanvas