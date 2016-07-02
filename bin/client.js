(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var COMMANDS;

COMMANDS = {
  PING: 0,
  PONG: 1,
  PATH: 2,
  SYNC: 3,
  COLOR: 4
};

module.exports = COMMANDS;


},{}],2:[function(require,module,exports){
var config;

config = {
  ws: {
    address: 'localhost',
    port: 4070
  },
  size: {
    width: 4096,
    height: 480
  },
  period: {
    ping: 2000
  },
  backgroundColor: 0xffffff,
  lineWidth: 2
};

module.exports = config;


},{}],3:[function(require,module,exports){
var debug;

debug = {
  setPing: function(ping) {
    return debug.id('ping').textContent = "ping: " + ping + " ms";
  },
  setColor: function(color) {
    return debug.id('color').innerHTML = "color: <span style=\"color: " + color + "\">" + color + "</span>";
  },
  setOffsetX: function(x) {
    return debug.id('x-offset').textContent = "x offset: " + x + " px";
  },
  setOffsetY: function(y) {
    return debug.id('y-offset').textContent = "y offset: " + y + " px";
  },
  id: function(id) {
    return document.getElementById(id);
  }
};

module.exports = debug;


},{}],4:[function(require,module,exports){
var initCanvas, mouse, net, tick, tmp;

tmp = require('./tmp');

mouse = require('./mouse');

tick = require('./tick');

net = require('./net');

initCanvas = require('./utils/initCanvas');

mouse.init();

initCanvas();

requestAnimationFrame(tick);

setTimeout(function() {
  return net.init();
}, 750);


},{"./mouse":5,"./net":6,"./tick":14,"./tmp":15,"./utils/initCanvas":16}],5:[function(require,module,exports){
var mouse, tmp;

tmp = require('./tmp');

mouse = {
  init: function() {
    window.onmousedown = mouse.onmousedown;
    window.onmouseup = mouse.onmouseup;
    return window.onmousemove = mouse.onmousemove;
  },
  onmousedown: function(e) {
    mouse.isDown = true;
    console.log(e);
    return tmp.mousePath.push([e.pageX, e.pageY]);
  },
  onmouseup: function() {
    mouse.isDown = false;
    tmp.netPath.push(tmp.mousePath);
    return tmp.mousePath = [];
  },
  onmousemove: function(e) {
    var p;
    if (mouse.isDown) {
      p = tmp.mousePath;
      ctx.beginPath();
      ctx.moveTo(p[p.length - 1][0], p[p.length - 1][1]);
      ctx.lineTo(e.pageX, e.pageY);
      ctx.stroke();
      return p.push([e.pageX, e.pageY]);
    }
  },
  isDown: false
};

module.exports = mouse;


},{"./tmp":15}],6:[function(require,module,exports){
var changeColor, config, manager, net, ping, tmp;

config = require('./config');

tmp = require('./tmp');

manager = require('./net/manager');

ping = require('./net/ping');

changeColor = require('./net/color');

net = {
  init: function() {
    var socket;
    socket = new WebSocket("ws://" + config.ws.address + ":" + config.ws.port);
    socket.onopen = net.onopen;
    socket.onclose = net.onclose;
    socket.onmessage = net.onmessage;
    socket.onerror = net.onerror;
    net.socket = socket;
    return net.send = net.socket.send;
  },
  onopen: function() {
    console.log('connected to the server');
    ping(net.socket);
    return tmp.pingInterval = setInterval(function() {
      ping(net.socket);
      return changeColor(net.socket);
    }, config.period.ping);
  },
  onclose: function(e) {
    clearInterval(tmp.syncInterval);
    if (e.wasClean) {
      console.log('clean close');
    } else {
      console.log('dirty close');
    }
    return console.log("code: " + event.code + ", reason: " + event.reason);
  },
  onmessage: function(e) {
    return manager(e.data, net.socket);
  },
  onerror: function(e) {
    clearInterval(tmp.syncInterval);
    alert('error, see console');
    return console.log(e);
  },
  socket: null,
  send: null
};

module.exports = net;


},{"./config":2,"./net/color":7,"./net/manager":9,"./net/ping":11,"./tmp":15}],7:[function(require,module,exports){
var COMMANDS, color, debug, tmp;

COMMANDS = require('../commands');

tmp = require('../tmp');

debug = require('../debug');

color = function(socket) {
  tmp.currentColor = '#' + (Math.random() * 0xFFFFFF << 0).toString(16);
  ctx.strokeStyle = tmp.currentColor;
  debug.setColor(tmp.currentColor);
  return socket.send(COMMANDS.COLOR + "," + tmp.currentColor);
};

module.exports = color;


},{"../commands":1,"../debug":3,"../tmp":15}],8:[function(require,module,exports){
var debug, interval, path, tmp;

tmp = require('../tmp');

path = require('./path');

debug = require('../debug');

interval = function(socket) {
  clearInterval(tmp.syncInterval);
  debug.setPing(tmp.ping);
  return tmp.syncInterval = setInterval(function() {
    return path(socket);
  }, tmp.ping);
};

module.exports = interval;


},{"../debug":3,"../tmp":15,"./path":10}],9:[function(require,module,exports){
var COMMANDS, manager, pong, sync, tmp;

COMMANDS = require('../commands');

pong = require('./pong');

sync = require('./sync');

tmp = require('../tmp');

manager = function(data, socket) {
  var array, command, values;
  array = data.split(',');
  command = +array[0];
  values = array.slice(1).filter(function(n) {
    return n.length !== 0;
  });
  switch (command) {
    case COMMANDS.PONG:
      return pong(values[0], socket);
    case COMMANDS.SYNC:
      return sync(data);
  }
};

module.exports = manager;


},{"../commands":1,"../tmp":15,"./pong":12,"./sync":13}],10:[function(require,module,exports){
var COMMANDS, sendPath, tmp;

COMMANDS = require('../commands');

tmp = require('../tmp');

sendPath = function(socket) {
  var command, data, path;
  command = [COMMANDS.PATH];
  path = tmp.netPath;
  data = command.concat(path);
  socket.send(data);
  return tmp.netPath = [];
};

module.exports = sendPath;


},{"../commands":1,"../tmp":15}],11:[function(require,module,exports){
var COMMANDS, ping, tmp;

COMMANDS = require('../commands');

tmp = require('../tmp');

ping = function(socket) {
  tmp.pingSendTime = Date.now();
  tmp.pingSendData = 'random data here';
  return socket.send(COMMANDS.PING + "," + tmp.pingSendData);
};

module.exports = ping;


},{"../commands":1,"../tmp":15}],12:[function(require,module,exports){
var COMMANDS, interval, pong, tmp;

COMMANDS = require('../commands');

tmp = require('../tmp');

interval = require('./interval');

pong = function(data, socket) {
  if (data === tmp.pingSendData) {
    tmp.ping = 80;
    return interval(socket);
  } else {
    return console.log('pong error');
  }
};

module.exports = pong;


},{"../commands":1,"../tmp":15,"./interval":8}],13:[function(require,module,exports){
var sync, tmp;

tmp = require('../tmp');

sync = function(data) {
  return tmp.syncData = data.slice(2);
};

module.exports = sync;


},{"../tmp":15}],14:[function(require,module,exports){
var mouse, tick, tmp;

mouse = require('./mouse');

tmp = require('./tmp');

tick = function() {
  var image;
  if (tmp.syncData.length > 0) {
    image = new Image();
    image.onload = function() {
      return ctx.drawImage(image, 0, 0);
    };
    image.src = tmp.syncData;
    tmp.syncData = '';
  }
  return requestAnimationFrame(tick);
};

module.exports = tick;


},{"./mouse":5,"./tmp":15}],15:[function(require,module,exports){
var tmp;

tmp = {
  mousePath: [],
  netPath: [],
  syncData: '',
  ping: 0,
  currentColor: 0x000000
};

module.exports = tmp;


},{}],16:[function(require,module,exports){
var config, initCanvas;

config = require('../config');

initCanvas = function() {
  var canvas;
  canvas = document.getElementsByTagName('canvas')[0];
  canvas.width = config.size.width;
  canvas.height = config.size.height;
  window.ctx = canvas.getContext('2d');
  ctx.lineJoin = 'round';
  return ctx.lineWidth = config.lineWidth;
};

window.onresize = function() {
  return initCanvas();
};

module.exports = initCanvas;


},{"../config":2}]},{},[4]);
