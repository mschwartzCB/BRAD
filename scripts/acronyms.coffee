module.exports = (robot) ->
  robot.respond /what does (.*) stand for?/i, (res) ->
    acro = res.match[1]
    if acro is "WTF"
      res.reply "Wednesday Thursday Friday"
    else
      res.reply "I don't know that acronym."
