var COMMANDS, manager, path, ping;

COMMANDS = require('../commands');

ping = require('./ping');

path = require('./path');

manager = function(data, socket) {
  var array, command, values;
  array = data.split(',');
  command = +array[0];
  values = array.slice(1);
  switch (command) {
    case COMMANDS.PING:
      return ping(values, socket);
    case COMMANDS.PATH:
      return path(values, socket);
  }
};

module.exports = manager;
