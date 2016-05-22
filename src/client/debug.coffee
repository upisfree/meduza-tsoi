debug =
  setPing: (ping) ->
    document.getElementById('ping').textContent = "#{ping} ms"

# export
module.exports = debug