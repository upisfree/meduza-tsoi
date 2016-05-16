var cache, ping;

cache = require('../cache');

ping = function(value) {
  return console.log(Date.now() - cache.pingTime, value);
};

module.exports = ping;
