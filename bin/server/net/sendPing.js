var cache, ping;

cache = require('../cache');

ping = function(socket) {
  cache.pingTime = Date.now();
  return socket.send('00000000000000000000000000000000000000000000000000000000000000000');
};

module.exports = ping;
