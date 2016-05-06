elem = require './getElement'

initCanvas = ->
  canvas = elem.byTag('canvas')[0]

  canvas.width = 1024 # window.innerWidth
  canvas.height = 640 # window.innerHeight

window.onresize = ->
  initCanvas()

# export
module.exports = initCanvas