tmp = require '../tmp'
generateRandomString = require './generateRandomString'

generateId = ->
  id = generateRandomString 8
  
  if not tmp.clients[id]
    return id
  else
    generateId()

# export
module.exports = generateId