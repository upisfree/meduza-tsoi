var COMMANDS, canvas, first;

COMMANDS = require('../commands');

canvas = require('../canvas');

first = function(socket) {
  var base64, command;
  command = COMMANDS.FIRST_SYNC;
  return base64 = canvas.canvas.toDataURL(function(err, png) {
    var data;
    data = [command, png].join(',');
    return socket.send(data);
  });
};

module.exports = first;
