elem = require './getElement'

getContext = ->
  return elem.byTag('canvas')[0].getContext('2d')

# export
module.exports = getContext