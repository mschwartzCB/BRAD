dict = [{ name: "WTF", def: "Wednesday Thursday Friday"},
		{ name: "WFH", def: "work from home"},
		{ name: "AFK", def: "away from keyboard"},
		{ name: "NPM", def: "node package manager"}]

module.exports = (robot) ->
  robot.respond /what does (.*) stand for(.?)/i, (res) ->
    acro = res.match[1]
    get_def = dict.filter (x) -> `x.name == acro`
    if `get_def.length == 1 `
      res.reply get_def[0]['def']
    else if acro in ["B.R.A.D.", "BRAD", "brad"]
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
      res.reply "I don't know that acronym"

  robot.respond /add (.*) means (.*) to acronyms/i, (res) ->
  	acro = res.match[1]
  	def = res.match[2]

  	new_acro = { name: acro, def: def }
  	dict.push new_acro

    res.reply "Okay, " + acro + " means " + def
