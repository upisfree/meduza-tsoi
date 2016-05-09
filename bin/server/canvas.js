var Canvas, canvas;

Canvas = require('canvas');

canvas = {
  init: function() {
    var can, ctx;
    can = new Canvas(1024, 640);
    ctx = can.getContext('2d');
    canvas.canvas = can;
    return canvas.ctx = ctx;
  }
};

module.exports = canvas;
