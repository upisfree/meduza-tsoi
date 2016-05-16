var COMMANDS, manager, path, pong;

COMMANDS = require('../commands');

pong = require('./pong');

path = require('./path');

manager = function(data, socket) {
  var array, command, values;
  array = data.split(',');
  command = +array[0];
  values = array.slice(1);
  switch (command) {
    case COMMANDS.PONG:
      return pong(values[0], socket);
    case COMMANDS.PATH:
      return path(values);
  }
};

module.exports = manager;
