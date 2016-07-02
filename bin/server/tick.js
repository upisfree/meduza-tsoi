var canvas, prettyBytes, tick, tmp;

prettyBytes = require('pretty-bytes');

tmp = require('./tmp');

canvas = require('./canvas');

tick = function() {
  var ctx, i, j, k, len, len1, p, path, ref, v;
  ctx = canvas.ctx;
  ref = tmp.paths;
  for (i = 0, len = ref.length; i < len; i++) {
    path = ref[i];
    p = path[0];
    for (k = j = 0, len1 = p.length; j < len1; k = j += 2) {
      v = p[k];
      if (p[k] > 0 && p[k + 1] > 0 && p[k + 2] > 0 && p[k + 3] > 0) {
        ctx.beginPath();
        ctx.moveTo(parseInt(p[k], 10), parseInt(p[k + 1], 10));
        ctx.lineTo(parseInt(p[k + 2], 10), parseInt(p[k + 3], 10));
        ctx.strokeStyle = path[1];
        ctx.stroke();
        ctx.closePath();
      }
    }
  }
  tmp.paths = [];
  return canvas.canvas.toDataURL('image/jpg', function(err, url) {
    var m;
    if (err) {
      console.log(err);
    }
    m = process.memoryUsage();
    console.log(prettyBytes(m.heapUsed));
    return tmp.canvasBase64 = url;
  });
};

module.exports = tick;
