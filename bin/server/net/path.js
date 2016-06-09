var canvas, path, sync, tmp;

tmp = require('../tmp');

canvas = require('../canvas');

sync = require('./sync');

path = function(path, socket) {
  var ctx, i, k, len, v;
  ctx = canvas.ctx;
  for (k = i = 0, len = path.length; i < len; k = i += 3) {
    v = path[k];
    if (path[k] && path[k + 1] > 0) {
      ctx.beginPath();
      ctx.arc(parseInt(path[k], 10), parseInt(path[k + 1], 10), 10, 0, 2 * Math.PI, false);
      ctx.fillStyle = socket._color.replace('0x', '#');
      ctx.fill();
      ctx.closePath();
    }
  }
  return sync(socket);
};

module.exports = path;
