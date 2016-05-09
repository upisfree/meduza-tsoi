var COMMANDS, getPath, manager, ping;

COMMANDS = require('../commands');

ping = require('./ping');

getPath = require('./path');

manager = function(socket, data) {
  var array, command, values;
  array = data.split(',');
  command = +array[0];
  values = array.slice(1);
  switch (command) {
    case COMMANDS.PING:
      return ping(values);
    case COMMANDS.PATH:
      return getPath(values);
  }
};

module.exports = manager;
