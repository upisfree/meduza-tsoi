mouse = require './mouse'
tmp = require './tmp'

tick = ->
  if tmp.syncData.length > 0
    image = new Image()
    image.onload = ->
      ctx.drawImage image, 0, 0

    image.src = tmp.syncData

    tmp.syncData = ''

  requestAnimationFrame tick

# export
module.exports = tick