var canvas, config, tick, ws;

config = require('./config');

ws = require('./ws');

canvas = require('./canvas');

tick = require('./tick');

ws.init();

canvas.init();

setInterval(tick, config.tickPeriod);

console.log('Ok, started.');
