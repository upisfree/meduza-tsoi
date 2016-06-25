COMMANDS = require '../commands'
pong = require './pong'
sync = require './sync'
tmp = require '../tmp'

# первое число массива — это команда
manager = (data, socket) ->
  array = data.split ','
  command = +array[0]
  values = array[1..].filter (n) ->
    n.length isnt 0 

  switch command
    when COMMANDS.PONG
      pong values[0], socket
    when COMMANDS.SYNC
      sync data

# export
module.exports = manager