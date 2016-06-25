mouse = require './mouse'
tmp = require './tmp'

tick = ->
  requestAnimationFrame tick

# export
module.exports = tick