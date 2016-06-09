var generateRandomString, random;

random = require('./random');

generateRandomString = function(length, isDigits, isBigLetters) {
  var alphabet, i, j, ref, string;
  if (isDigits == null) {
    isDigits = true;
  }
  if (isBigLetters == null) {
    isBigLetters = true;
  }
  alphabet = 'abcdefghijklmnopqrstuvwxyz';
  string = '';
  if (isDigits) {
    alphabet += '0123456789';
  }
  if (isBigLetters) {
    alphabet += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  }
  for (i = j = 0, ref = length; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
    string += alphabet[random(0, alphabet.length - 1)];
  }
  return string;
};

module.exports = generateRandomString;
