cache = require '../cache'
generateRandomString = require './generateRandomString'

generateId = ->
  id = generateRandomString 8
  
  if not cache.clients[id]
    return id
  else
    generateId()

# export
module.exports = generateId