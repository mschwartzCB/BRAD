module.exports = (robot) ->
  robot.respond /what does (.*) stand for?/i, (res) ->
    acro = res.match[1]
    if acro is "WTF"
      res.reply "Wednesday Thursday Friday"
    if acro is "B.R.A.D." or "BRAD" or "brad"
      randomWords = require "random-words"
      b = randomWords()
      while String(b.substr 0,1) isnt "b"
        b = randomWords()
      r = randomWords()
      while String(r.substr 0,1) isnt "r"
        r = randomWords()
      a = randomWords()
      while String(a.substr 0,1) isnt "a"
        a = randomWords()
      d = randomWords()
      while String(d.substr 0,1) isnt "d"
        d = randomWords()
      res.reply b[0].toUpperCase() + b[1..-1] + " " + r[0].toUpperCase() + r[1..-1] + " " + a[0].toUpperCase() + a[1..-1] + " " + d[0].toUpperCase() + d[1..-1]
    else
      res.reply "I don't know that acronym."
