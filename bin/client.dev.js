(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var config;

config = {
  ws: {
    address: 'localhost',
    port: 4070
  },
  size: {
    width: 1024,
    height: 640
  },
  period: {
    ping: 2000,
    fullSync: 5000
  },
  backgroundColor: 0xffffff
};

module.exports = config;


},{}],2:[function(require,module,exports){
var initCanvas, mouse, net, tick, tmp;

tmp = require('./tmp');

mouse = require('./mouse');

tick = require('./tick');

net = require('./net');

initCanvas = require('./utils/initCanvas');

mouse.init();

initCanvas();

tmp.currentColor = '#' + (Math.random() * 0xFFFFFF << 0).toString(16);

ctx.fillStyle = tmp.currentColor;

ctx.strokeStyle = tmp.currentColor;

ctx.lineJoin = "round";

ctx.lineWidth = 5;

requestAnimationFrame(tick);


},{"./mouse":3,"./net":4,"./tick":5,"./tmp":6,"./utils/initCanvas":7}],3:[function(require,module,exports){
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
    return tmp.mousePath.push([e.clientX, e.clientY]);
  },
  onmouseup: function() {
    mouse.isDown = false;
    return tmp.mousePath = [];
  },
  onmousemove: function(e) {
    if (mouse.isDown) {
      tmp.mousePath.push([e.clientX, e.clientY]);
      if (tmp.mousePath.length > 24) {
        return tmp.mousePath.splice(0, 1);
      }
    }
  },
  isDown: false
};

module.exports = mouse;


},{"./tmp":6}],4:[function(require,module,exports){



},{}],5:[function(require,module,exports){
var f, mouse, tick, tmp;

mouse = require('./mouse');

tmp = require('./tmp');

f = function(t, e) {
  return [t[0] + (e[0] - t[0]) / 2, t[1] + (e[1] - t[1]) / 2];
};

tick = function() {
  var e, i, j, len, n, ref;
  if (tmp.mousePath.length === 1) {
    ctx.beginPath();
    ctx.arc(tmp.mousePath[0][0], tmp.mousePath[0][1], 5, 0, 2 * Math.PI, false);
    ctx.fill();
  } else if (tmp.mousePath.length > 1) {
    n = tmp.mousePath[0];
    ctx.beginPath();
    ctx.moveTo(n[0], n[1]);
    ref = tmp.mousePath;
    for (j = 0, len = ref.length; j < len; j++) {
      i = ref[j];
      e = f(n, i);
      ctx.quadraticCurveTo(n[0], n[1], e[0], e[1]);
    }
    ctx.stroke();
  }
  return requestAnimationFrame(tick);
};

module.exports = tick;


},{"./mouse":3,"./tmp":6}],6:[function(require,module,exports){
var tmp;

tmp = {
  mousePath: [],
  syncPath: [],
  ping: 0,
  currentColor: 0x000000
};

module.exports = tmp;


},{}],7:[function(require,module,exports){
var config, initCanvas;

config = require('../config');

initCanvas = function() {
  var canvas;
  canvas = document.getElementsByTagName('canvas')[0];
  canvas.width = config.size.width;
  canvas.height = config.size.height;
  return window.ctx = canvas.getContext('2d');
};

window.onresize = function() {
  return initCanvas();
};

module.exports = initCanvas;


},{"../config":1}]},{},[2]);
