var COMMANDS, WebSocket, sync, tmp;

WebSocket = require('ws');

COMMANDS = require('../commands');

tmp = require('../tmp');

sync = function(socket) {
  if (socket.readyState === WebSocket.OPEN) {
    return socket.send(COMMANDS.SYNC + ',' + tmp.canvasBase64);
  }
};

module.exports = sync;
