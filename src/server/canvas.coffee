Canvas = require 'canvas'
config = require './config'

canvas =
  init: ->
    can = new Canvas config.size.width, config.size.height
    ctx = can.getContext '2d'

    canvas.canvas = can
    canvas.ctx = ctx

# export
module.exports = canvas