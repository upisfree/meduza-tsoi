var config, fullSync, interval, sync;

config = require('../config');

fullSync = require('./full');

sync = require('./sync');

interval = function(socket) {
  clearInterval(socket._fullSyncInterval);
  clearInterval(socket._syncInterval);
  socket._fullSyncInterval = setInterval(function() {
    return fullSync(socket);
  }, config.period.fullSync);
  return socket._syncInterval = setInterval(function() {
    return sync(socket);
  }, socket._ping);
};

module.exports = interval;
