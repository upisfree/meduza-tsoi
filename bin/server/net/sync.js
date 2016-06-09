var COMMANDS, WebSocket, canvas, sync, tmp;

WebSocket = require('ws');

COMMANDS = require('../commands');

canvas = require('../canvas');

tmp = require('../tmp');

sync = function(socket) {
  return canvas.canvas.toDataURL('image/png', function(err, url) {
    if (socket.readyState === WebSocket.OPEN) {
      return socket.send(COMMANDS.SYNC + ',' + url);
    }
  });
};

module.exports = sync;
