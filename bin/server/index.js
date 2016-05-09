var canvas, sendSync, ws;

ws = require('./ws');

canvas = require('./canvas');

sendSync = require('./net/sync');

ws.init();

canvas.init();

console.log('Ok, started.');

setInterval(function() {
  return ws.server.clients.forEach(function(socket) {
    return sendSync(socket);
  });
}, 30);
