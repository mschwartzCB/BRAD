dict = [{ name: "WTF", def: "Wednesday Thursday Friday"},
		{ name: "WFH", def: "work from home"},
		{ name: "AFK", def: "away from keyboard"},
		{ name: "NPM", def: "node package manager"}]

module.exports = (robot) ->
  robot.respond /what does (.*) stand for?/i, (res) ->
    acro = res.match[1]

    get_def = dict.filter (x) -> `x.name == acro`

    if `get_def.length == 1 `
      res.reply get_def[0]['def']
    else
      res.reply "I don't know that acronym"
  
  robot.respond /add (.*) means (.*) to acronyms/i, (res) ->
  	acro = res.match[1]
  	def = res.match[2]

  	new_acro = { name: acro, def: def }
  	dict.push new_acro
