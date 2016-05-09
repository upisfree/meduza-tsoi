var WebSocketServer, manager, sendSync, wss;

manager = require('./net/manager');

sendSync = require('./net/sync');

WebSocketServer = require('ws').Server;

wss = new WebSocketServer({
  port: 4070
});

wss.on('connection', function(ws) {
  console.log('client connected');
  return ws.on('message', function(data, flags) {
    return manager(ws, data);
  });
});

setInterval(function() {
  return wss.clients.forEach(function(socket) {
    return sendSync(socket);
  });
}, 30);
