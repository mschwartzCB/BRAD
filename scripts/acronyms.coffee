dict = [{ name: "WTF", def: "Wednesday Thursday Friday"},
		{ name: "WFH", def: "work from home"},
		{ name: "AFK", def: "away from keyboard"},
		{ name: "NPM", def: "node package manager"}]

define = (acro) ->
  acro = acro.toUpperCase()
  get_def = dict.filter (x) -> `x.name == acro`
  if `get_def.length == 1 `
    get_def[0]['def']
  else if `get_def.length > 1`
    alldefs = get_def.map (x) -> " #{ x.def }"
    alldefs = "#{ acro } might mean:" + alldefs
    alldefs
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
    b[0].toUpperCase() + b[1..-1] + " " + r[0].toUpperCase() + r[1..-1] + " " + a[0].toUpperCase() + a[1..-1] + " " + d[0].toUpperCase() + d[1..-1]
  else
    "I don't know that acronym"

add = (acro, def) ->
  new_acro = { name: acro, def: def }
  dict.push new_acro
  "Ok! Added '#{ acro }: #{ def }' to acronyms "

module.exports = (robot) ->
  robot.respond /what does (.*) stand for(.?)/i, (res) ->
    acro = res.match[1]
    res.reply define(acro)

  robot.respond /define (.*)/i, (res) ->
    acro = res.match[1]
    res.reply define(acro)

  robot.respond /what does (.*) mean(.?)/i, (res) ->
    acro = res.match[1]
    res.reply define(acro)

  robot.respond /add (.*) means (.*) to acronyms/i, (res) ->
  	acro = res.match[1]
  	def = res.match[2]
  	new_acro = { name: acro.toUpperCase(), def: def }
  	dict.push new_acro
  	res.reply "Ok! Added '#{ acro }: #{ def }' to acronyms "

  robot.respond /add (.*) means (.*) (.to acronyms)/i, (res) ->
    acro = res.match[1]
    def = res.match[2]
    res.reply add(acro, def)

  robot.respond /define (.*): (.*)/i, (res) ->
    acro = res.match[1]
    def = res.match[2]
    res.reply add(acro, def)
