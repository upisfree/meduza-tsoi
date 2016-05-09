Canvas = require 'canvas'

canvas =
  init: ->
    can = new Canvas 1024, 640
    ctx = can.getContext '2d'

    canvas.canvas = can
    canvas.ctx = ctx

  # ctx.strokeStyle = 'rgba(0,0,0,0.5)';
  # ctx.beginPath();
  # ctx.lineTo(50, 102);
  # ctx.lineTo(50 + te.width, 102);
  # ctx.stroke()

  # console.log('<img src="' + canvas.toDataURL() + '" />');

# export
module.exports = canvas