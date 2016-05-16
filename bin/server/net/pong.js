var COMMANDS, pong;

COMMANDS = require('../commands');

pong = function(data, socket) {
  if (data === socket._pingSendData) {
    socket._ping = Date.now() - socket._pingSendTime;
    socket.send(COMMANDS.PONG + "," + socket._ping);
    return console.log(socket._ping);
  } else {
    return console.log('ping error');
  }
};

module.exports = pong;
