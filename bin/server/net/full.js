var COMMANDS, WebSocket, canvas, full;

COMMANDS = require('../commands');

canvas = require('../canvas');

WebSocket = require('ws');

full = function(socket) {
  var base64, command;
  command = COMMANDS.FULL_SYNC;
  return base64 = canvas.canvas.toDataURL(function(err, png) {
    var data;
    data = [command, png].join(',');
    if (socket.readyState === WebSocket.OPEN) {
      return socket.send(data);
    }
  });
};

module.exports = full;
