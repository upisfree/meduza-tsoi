var path, sync, tmp;

tmp = require('../tmp');

sync = require('./sync');

path = function(path, socket) {
  tmp.paths.push([path, socket._color]);
  return sync(socket);
};

module.exports = path;
