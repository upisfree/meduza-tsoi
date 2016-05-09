config = require './config'

renderer =
  init: ->
    r = PIXI.autoDetectRenderer config.size.width, config.size.height,
      antialias: true
      backgroundColor: config.backgroundColor

    document.body.appendChild r.view

    stage = new PIXI.Container()

    graphics = new PIXI.Graphics()

    stage.addChild graphics

    renderer.renderer = r
    renderer.stage = stage
    renderer.graphics = graphics

# export
module.exports = renderer