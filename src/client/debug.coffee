debug =
  setPing: (ping) ->
    debug.id('ping').textContent = "ping: #{ping} ms"
  setColor: (color) ->
    debug.id('color').innerHTML = "color: <span style=\"color: #{color}\">#{color}</span>"
  setOffsetX: (x) ->
    debug.id('x-offset').textContent = "x offset: #{x} px"
  setOffsetY: (y) ->
    debug.id('y-offset').textContent = "y offset: #{y} px"
  id: (id) ->
    return document.getElementById id

# export
module.exports = debug