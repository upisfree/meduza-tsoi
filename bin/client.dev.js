(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var cache;

cache = {
  mousePath: [],
  syncPath: [],
  currentColor: 0x000000
};

module.exports = cache;


},{}],2:[function(require,module,exports){
var COMMANDS;

COMMANDS = {
  PING: 0,
  PATH: 1,
  SYNC: 2,
  FIRST_SYNC: 3
};

module.exports = COMMANDS;


},{}],3:[function(require,module,exports){
var config;

config = {
  ws: {
    address: '81.23.204.151',
    port: 4070
  },
  size: {
    width: 1024,
    height: 640
  },
  backgroundColor: 0xffffff
};

module.exports = config;


},{}],4:[function(require,module,exports){
var cache, mouse, net, renderer, tick;

cache = require('./cache');

mouse = require('./mouse');

tick = require('./tick');

net = require('./net');

renderer = require('./renderer');

mouse.init();

net.init();

renderer.init();

if (Math.random() > 0.5) {
  cache.currentColor = '0x' + (Math.random() * 0xFFFFFF << 0).toString(16);
} else {
  cache.currentColor = '0xffffff';
}

tick();


},{"./cache":1,"./mouse":5,"./net":6,"./renderer":12,"./tick":13}],5:[function(require,module,exports){
var mouse;

mouse = {
  init: function() {
    window.onmousedown = mouse.onmousedown;
    window.onmouseup = mouse.onmouseup;
    return window.onmousemove = mouse.onmousemove;
  },
  onmousedown: function() {
    return mouse.isDown = true;
  },
  onmouseup: function() {
    return mouse.isDown = false;
  },
  onmousemove: function(e) {
    mouse.pos.curr.x = e.clientX;
    return mouse.pos.curr.y = e.clientY;
  },
  pos: {
    curr: {
      x: 0,
      y: 0
    }
  },
  isDown: false
};

module.exports = mouse;


},{}],6:[function(require,module,exports){
var config, manager, net, sendPath;

config = require('./config');

manager = require('./net/manager');

sendPath = require('./net/path');

net = {
  init: function() {
    var socket;
    socket = new WebSocket("ws://" + config.ws.address + ":" + config.ws.port);
    socket.onopen = net.onopen;
    socket.onclose = net.onclose;
    socket.onmessage = net.onmessage;
    socket.onerror = net.onerror;
    socket.addEventListener('ping', function(data, flags) {
      return console.log(data, flags);
    });
    net.socket = socket;
    return net.send = net.socket.send;
  },
  onopen: function() {
    console.log('connected to the server');
    return sendPath(net);
  },
  onclose: function(e) {
    if (e.wasClean) {
      console.log('clean close');
    } else {
      console.log('dirty close');
    }
    return console.log("code: " + event.code + ", reason: " + event.reason);
  },
  onmessage: function(e) {
    return manager(e.data);
  },
  onerror: function(e) {
    alert('error, see console');
    return console.log(e);
  },
  socket: null,
  send: null
};

module.exports = net;


},{"./config":3,"./net/manager":8,"./net/path":9}],7:[function(require,module,exports){
var first, renderer;

renderer = require('../renderer');

first = function(data) {
  var baseTexture, image, sprite, texture;
  image = new Image();
  image.src = data[1] + ',' + data[2];
  baseTexture = new PIXI.BaseTexture(image);
  texture = new PIXI.Texture(baseTexture);
  sprite = new PIXI.Sprite(texture);
  renderer.stage.addChild(sprite);
  return renderer.stage.children.sort(function() {
    return 1;
  });
};

module.exports = first;


},{"../renderer":12}],8:[function(require,module,exports){
var COMMANDS, firstSync, manager, ping, sync;

COMMANDS = require('../commands');

ping = require('./ping');

sync = require('./sync');

firstSync = require('./first');

manager = function(data) {
  var array, command, values;
  array = data.split(',');
  command = +array[0];
  values = array.slice(1).filter(function(n) {
    return n.length !== 0;
  });
  switch (command) {
    case COMMANDS.PING:
      return ping(values);
    case COMMANDS.SYNC:
      return sync(values);
    case COMMANDS.FIRST_SYNC:
      return firstSync(array);
  }
};

module.exports = manager;


},{"../commands":2,"./first":7,"./ping":10,"./sync":11}],9:[function(require,module,exports){
var COMMANDS, cache, sendPath;

COMMANDS = require('../commands');

cache = require('../cache');

sendPath = function(net) {
  return setInterval(function() {
    var command, data, path;
    command = [COMMANDS.PATH];
    path = cache.mousePath;
    data = command.concat(path);
    net.socket.send(data);
    return cache.mousePath = [];
  }, 30);
};

module.exports = sendPath;


},{"../cache":1,"../commands":2}],10:[function(require,module,exports){
var ping;

ping = function() {
  return console.log('ping command');
};

module.exports = ping;


},{}],11:[function(require,module,exports){
var cache, sync;

cache = require('../cache');

sync = function(data) {
  return cache.syncPath = data;
};

module.exports = sync;


},{"../cache":1}],12:[function(require,module,exports){
var config, renderer;

config = require('./config');

renderer = {
  init: function() {
    var graphics, r, stage;
    r = PIXI.autoDetectRenderer(config.size.width, config.size.height, {
      antialias: true,
      backgroundColor: config.backgroundColor
    });
    document.body.appendChild(r.view);
    stage = new PIXI.Container();
    graphics = new PIXI.Graphics();
    stage.addChild(graphics);
    renderer.renderer = r;
    renderer.stage = stage;
    return renderer.graphics = graphics;
  }
};

module.exports = renderer;


},{"./config":3}],13:[function(require,module,exports){
var cache, mouse, r, tick;

mouse = require('./mouse');

cache = require('./cache');

r = require('./renderer');

tick = function() {
  var g, i, k, len, ref, v;
  g = r.graphics;
  if (mouse.isDown) {
    g.beginFill(cache.currentColor);
    g.drawCircle(mouse.pos.curr.x, mouse.pos.curr.y, 10);
    g.endFill();
    cache.mousePath.push(cache.currentColor, mouse.pos.curr.x, mouse.pos.curr.y);
  }
  if (cache.syncPath.length % 3 === 0) {
    ref = cache.syncPath;
    for (k = i = 0, len = ref.length; i < len; k = i += 3) {
      v = ref[k];
      if (cache.syncPath[k] && cache.syncPath[k + 1] > 0 && cache.syncPath[k + 2] > 0) {
        g.beginFill(cache.syncPath[k]);
        g.drawCircle(+cache.syncPath[k + 1], +cache.syncPath[k + 2], 10);
        g.endFill();
      }
    }
  }
  r.renderer.render(r.stage);
  return requestAnimationFrame(tick);
};

module.exports = tick;


},{"./cache":1,"./mouse":5,"./renderer":12}]},{},[4]);
