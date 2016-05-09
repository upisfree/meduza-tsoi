renderer = require '../renderer'

first = (data) ->
  image = new Image()
  image.src = data[1] + ',' + data[2]

  baseTexture = new PIXI.BaseTexture image
  texture = new PIXI.Texture baseTexture

  sprite = new PIXI.Sprite texture
  renderer.stage.addChild sprite

# export
module.exports = first