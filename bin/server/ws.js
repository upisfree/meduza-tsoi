var WebSocketServer, config, firstSync, manager, sendPing, ws;

WebSocketServer = require('ws').Server;

config = require('./config');

manager = require('./net/manager');

firstSync = require('./net/first');

sendPing = require('./net/sendPing');

ws = {
  init: function() {
    var server;
    server = new WebSocketServer({
      port: config.ws.port,
      perMessageDeflate: false
    });
    server.on('connection', function(socket) {
      console.log(server.clients.length + " clients, new: ip:" + socket._socket.remoteAddress);
      socket.send(Date.now().toString());
      socket.on('message', function(data, flags) {
        return console.log((Date.now() - parseInt(data)) + ' ms');
      });
      return socket.on('close', function(code, message) {
        return console.log(server.clients.length + " clients, client quit, bye!");
      });
    });
    return ws.server = server;
  }
};

module.exports = ws;
