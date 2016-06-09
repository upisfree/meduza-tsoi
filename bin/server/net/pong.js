var COMMANDS, interval, pong;

COMMANDS = require('../commands');

interval = require('./interval');

pong = function(data, socket) {
  if (data === socket._pingSendData) {
    socket._ping = Date.now() - socket._pingSendTime;
    socket.send(COMMANDS.PONG + "," + socket._ping);
    return interval(socket);
  } else {
    return console.log('ping error');
  }
};

module.exports = pong;
