var cache, canvas, getPath;

cache = require('../cache');

canvas = require('../canvas');

getPath = function(path) {
  var ctx, i, k, len, results, v;
  cache.mousePath.push(path);
  ctx = canvas.ctx;
  results = [];
  for (k = i = 0, len = path.length; i < len; k = i += 3) {
    v = path[k];
    if (path[k] && path[k + 1] > 0 && path[k + 2] > 0) {
      ctx.beginPath();
      ctx.arc(parseInt(path[k + 1], 10), parseInt(path[k + 2], 10), 10, 0, 2 * Math.PI, false);
      ctx.fillStyle = path[k].replace('0x', '#');
      ctx.fill();
      results.push(ctx.closePath());
    } else {
      results.push(void 0);
    }
  }
  return results;
};

module.exports = getPath;
