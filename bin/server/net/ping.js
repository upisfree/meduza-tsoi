var COMMANDS, WebSocket, ping;

COMMANDS = require('../commands');

WebSocket = require('ws');

ping = function(data, socket) {
  if (socket.readyState === WebSocket.OPEN) {
    return socket.send(COMMANDS.PONG + "," + data);
  }
};

module.exports = ping;
