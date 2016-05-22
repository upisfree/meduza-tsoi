COMMANDS = require '../commands'
pong = require './pong'
sync = require './sync'
fullSync = require './full'

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
      sync values
    when COMMANDS.FULL_SYNC
      fullSync array

# export
module.exports = manager