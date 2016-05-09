COMMANDS = require '../commands'
ping = require './ping'
sync = require './sync'
firstSync = require './first'

# первое число массива — это команда
manager = (data) ->
  array = data.split ','
  command = +array[0]
  values = array[1..].filter (n) ->
    n.length isnt 0 

  switch command
    when COMMANDS.PING
      ping values
    when COMMANDS.SYNC
      sync values
    when COMMANDS.FIRST_SYNC
      firstSync array

# export
module.exports = manager