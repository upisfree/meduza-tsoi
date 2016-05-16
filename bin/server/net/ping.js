var COMMANDS, ping;

COMMANDS = require('../commands');

ping = function(socket) {
  socket._pingSendTime = Date.now();
  socket._pingSendData = 'random data here';
  return socket.send(COMMANDS.PING + "," + socket._pingSendData);
};

module.exports = ping;
