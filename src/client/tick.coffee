mouse = require './mouse'
tmp = require './tmp'

tick = ->
  if tmp.syncData.length > 0
    s = tmp.syncData.split ','

    ctx.beginPath()

    for v, k in s
      if v[0] is '#'
        ctx.strokeStyle = v[0]

      if s[k] > 0 and s[k + 1] > 0 and s[k + 2] > 0 and s[k + 3] > 0
        ctx.moveTo parseInt(s[k], 10), parseInt(s[k + 1], 10)
        ctx.lineTo parseInt(s[k + 2], 10), parseInt(s[k + 3], 10)
        ctx.stroke()

    tmp.syncData = ''

  requestAnimationFrame tick

# export
module.exports = tick