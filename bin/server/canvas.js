var Canvas, canvas, config;

Canvas = require('canvas');

config = require('./config');

canvas = {
  init: function() {
    var can, ctx;
    can = new Canvas(config.size.width, config.size.height);
    ctx = can.getContext('2d');
    canvas.canvas = can;
    return canvas.ctx = ctx;
  }
};

module.exports = canvas;
