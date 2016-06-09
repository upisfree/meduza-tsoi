mouse = require './mouse'
tmp = require './tmp'

f = (t, e) ->
  return [t[0] + (e[0] - t[0]) / 2, t[1] + (e[1] - t[1]) / 2]

tick = ->
  if tmp.mousePath.length is 1
    ctx.beginPath()
    ctx.arc tmp.mousePath[0][0], tmp.mousePath[0][1], 5, 0, 2 * Math.PI, false
    ctx.fill()

    # tmp.mousePath = []
  else if tmp.mousePath.length > 1
    # ctx.beginPath()

    # for v, k in tmp.mousePath
    #   if tmp.mousePath[k - 1]
    #     ctx.moveTo tmp.mousePath[k - 1][0], tmp.mousePath[k - 1][1]
    #   else
    #     ctx.moveTo v[0] - 1, v[1]
    
    # ctx.lineTo v[0], v[1]
    # ctx.closePath()
    # ctx.stroke()

    n = tmp.mousePath[0]

    ctx.beginPath()
    ctx.moveTo n[0], n[1]

    for i in tmp.mousePath
      e = f n, i

      ctx.quadraticCurveTo n[0], n[1], e[0], e[1]
    
    ctx.stroke()

    # tmp.mousePath = []

  requestAnimationFrame tick

# export
module.exports = tick








  # try
  #   image = new Image()
  #   image.src tmp.syncData
  #   r.stage.children[0].texture.baseTexture.fromImage image, false
  #   # r.image.src = tmp.syncData
  #   # r.baseTexture.update()

  # draw sync
  # try
  #   image = new Image()
  #   image.src = tmp.syncData

  #   # baseTexture = new PIXI.BaseTexture image
  #   texture = new PIXI.Texture.fromImage image, false

  #   sprite = new PIXI.Sprite texture

  #   r.stage.addChild sprite


# base64 — не вариант
# бинарно слать
# fullsync вообще не нужон




  # catch e
    # console.log e

  # if tmp.syncPath.length % 3 is 0
  #   for v, k in tmp.syncPath by 3
  #     if tmp.syncPath[k] and tmp.syncPath[k + 1] > 0 and tmp.syncPath[k + 2] > 0
  #       g.beginFill tmp.syncPath[k]
  #       g.drawCircle +tmp.syncPath[k + 1], +tmp.syncPath[k + 2], 10
  #       g.endFill()