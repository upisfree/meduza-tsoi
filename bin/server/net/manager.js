var COMMANDS, manager, path, ping;

COMMANDS = require('../commands');

ping = require('./getPing');

path = require('./path');

manager = function(socket, data) {
  var array, command, values;
  array = data.split(',');
  command = +array[0];
  values = array.slice(1);
  switch (command) {
    case COMMANDS.PING:
      return ping(array);
    case COMMANDS.PATH:
      return path(values);
  }
};

module.exports = manager;
