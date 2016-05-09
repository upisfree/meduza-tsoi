Canvas = require 'canvas'

canvas =
  init: ->
    can = new Canvas 1024, 640
    ctx = can.getContext '2d'

    canvas.canvas = can
    canvas.ctx = ctx

# export
module.exports = canvas