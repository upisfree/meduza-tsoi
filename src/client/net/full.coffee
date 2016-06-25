full = (data) ->
  image = new Image()
  image.onload = ->
    ctx.drawImage image, 0, 0

  image.src = data[1] + ',' + data[2]

# export
module.exports = full