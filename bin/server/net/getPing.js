var cache, ping;

cache = require('../cache');

ping = function(value) {
  return console.log(Date.now() - value);
};

module.exports = ping;
