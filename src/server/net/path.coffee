tmp = require '../tmp'
sync = require './sync'

path = (path, socket) ->
  tmp.paths.push [path, socket._color]

  # шлём пути
  sync socket

# export
module.exports = path