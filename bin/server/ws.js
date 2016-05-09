var WebSocketServer, manager, ws;

WebSocketServer = require('ws').Server;

manager = require('./net/manager');

ws = {
  init: function() {
    var server;
    server = new WebSocketServer({
      port: 4070
    });
    server.on('connection', function(socket) {
      console.log('client connected');
      return socket.on('message', function(data, flags) {
        return manager(socket, data);
      });
    });
    return ws.server = server;
  }
};

module.exports = ws;
