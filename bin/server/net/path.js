var cache, getPath;

cache = require('../cache');

getPath = function(path) {
  return cache.mousePath.push(path);
};

module.exports = getPath;
