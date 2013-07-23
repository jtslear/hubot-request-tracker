# Description:
#   Looks up Request Tracker tickets when they're mentioned in chat
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_RT_URL (format: "https://example.com:9090")
#   HUBOT_RT_USERNAME
#   HUBOT_RT_PASSWORD
#
# Commands:
#   hubot rturl - will show the url configured
#   hubot rtuser - will show the user configured
#   hubot rt[\d] - will provide details of a ticket
# 
# Author:
#   jtslear

module.exports = (robot) ->
  env = process.env
 
  robot.respond /rturl/i, (msg) ->
    msg.send process.env.HUBOT_RT_URL

  robot.respond /rtuser/i, (msg) ->
    msg.send process.env.HUBOT_RT_USERNAME

  robot.respond /rt(\d+)/i, (msg) ->
    httprequest = msg.robot.http(process.env.HUBOT_RT_URL) 
      .get() (err, res, body) ->
        msg.send body
