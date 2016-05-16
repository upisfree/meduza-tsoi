COMMANDS = require '../commands'
ping = require './ping'
pong = require './pong'
sync = require './sync'
firstSync = require './first'

# первое число массива — это команда
manager = (data, socket) ->
  array = data.split ','
  command = +array[0]
  values = array[1..].filter (n) ->
    n.length isnt 0 

  switch command
    when COMMANDS.PING # на клиенте мы не шлём пинг, мы его только принимаем
      ping values[0], socket
    when COMMANDS.PONG
      pong.get values[0]
    when COMMANDS.SYNC
      sync values
    when COMMANDS.FIRST_SYNC
      firstSync array

# export
module.exports = manager