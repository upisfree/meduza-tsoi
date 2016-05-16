var cache, ping;

cache = require('../cache');

ping = function(socket) {
  cache.pingTime = Date.now();
  return socket.send(cache.pingTime.toString());
};

module.exports = ping;
