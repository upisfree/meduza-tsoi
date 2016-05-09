var WebSocketServer, config, firstSync, manager, ws;

WebSocketServer = require('ws').Server;

config = require('./config');

manager = require('./net/manager');

firstSync = require('./net/first');

ws = {
  init: function() {
    var server;
    server = new WebSocketServer({
      port: config.ws.port
    });
    server.on('connection', function(socket) {
      console.log(server.clients.length + " clients, new: ip:" + socket._socket.remoteAddress);
      firstSync(socket);
      socket.on('message', function(data, flags) {
        return manager(socket, data);
      });
      return socket.on('close', function(code, message) {
        return console.log(server.clients.length + " clients, client quit, bye!");
      });
    });
    return ws.server = server;
  }
};

module.exports = ws;
