renderer =
  init: ->
    r = PIXI.autoDetectRenderer 1024, 640,
      antialias: true
      backgroundColor: 0xffffff

    document.body.appendChild r.view

    stage = new PIXI.Container()

    graphics = new PIXI.Graphics()
    # graphics.lineStyle 2, 0x000000, 1

    stage.addChild graphics

    renderer.renderer = r
    renderer.stage = stage
    renderer.graphics = graphics

# export
module.exports = renderer