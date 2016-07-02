random = require './random'

generateRandomString = (length, isDigits = true, isBigLetters = true) ->
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  string = ''

  if isDigits
    alphabet += '0123456789'

  if isBigLetters
    alphabet += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  for i in [0..length]
    string += alphabet[random(0, alphabet.length - 1)]

  return string

# export
module.exports = generateRandomString