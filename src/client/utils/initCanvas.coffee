config = require '../config'

initCanvas = ->
  canvas = document.getElementsByTagName('canvas')[0]

  canvas.width = config.size.width
  canvas.height = config.size.height

  window.ctx = canvas.getContext '2d' # оптимизация — зачем при каждом тике вызывать контекст?

window.onresize = ->
  initCanvas()

# export
module.exports = initCanvas