var WebSocketServer, config, fullSync, manager, tmp, ws;

WebSocketServer = require('ws').Server;

config = require('./config');

tmp = require('./tmp');

manager = require('./net/manager');

fullSync = require('./net/full');

ws = {
  init: function() {
    var server;
    server = new WebSocketServer({
      port: config.ws.port
    });
    server.on('connection', function(socket) {
      console.log(server.clients.length + " clients, new: ip:" + socket._socket.remoteAddress);
      socket._color = '0x000000';
      fullSync(socket);
      socket.on('message', function(data, flags) {
        return manager(data, socket);
      });
      return socket.on('close', function(code, message) {
        return console.log(server.clients.length + " clients, client quit, bye!");
      });
    });
    return ws.server = server;
  }
};

module.exports = ws;
