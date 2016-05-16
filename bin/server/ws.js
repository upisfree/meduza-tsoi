var WebSocketServer, config, firstSync, manager, ping, ws;

WebSocketServer = require('ws').Server;

config = require('./config');

manager = require('./net/manager');

firstSync = require('./net/first');

ping = require('./net/ping');

ws = {
  init: function() {
    var server;
    server = new WebSocketServer({
      port: config.ws.port,
      perMessageDeflate: false
    });
    server.on('connection', function(socket) {
      console.log(server.clients.length + " clients, new: ip:" + socket._socket.remoteAddress);
      setInterval(function() {
        return ping(socket);
      }, 100);
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
