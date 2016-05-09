var COMMANDS, WebSocket, cache, sendSync;

WebSocket = require('ws');

COMMANDS = require('../commands');

cache = require('../cache');

sendSync = function(socket) {
  var command, data, path;
  command = [COMMANDS.SYNC];
  path = cache.mousePath;
  data = command.concat(path).join(',');
  if (socket.readyState === WebSocket.OPEN) {
    socket.send(data);
  }
  if (cache.mousePath.length > 25) {
    return cache.mousePath = [];
  }
};

module.exports = sendSync;
