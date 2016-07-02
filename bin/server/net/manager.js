var COMMANDS, color, manager, path, ping;

COMMANDS = require('../commands');

ping = require('./ping');

path = require('./path');

color = require('./color');

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
    case COMMANDS.COLOR:
      return color(values, socket);
  }
};

module.exports = manager;
