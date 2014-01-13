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
#   hubot rtsearch [\w] - will search the subject for all new & open tickets
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
    ticketNumber = escape(msg.match[1])
    rtUrl = process.env.HUBOT_RT_URL
    username = process.env.HUBOT_RT_USERNAME
    password = process.env.HUBOT_RT_PASSWORD
    auth = 'Basic ' + new Buffer(username + ':' + password).toString('base64');
    msg.robot.http("#{rtUrl}/REST/1.0/ticket/#{ticketNumber}/show") 
      .headers(Authorization: auth, Accept: 'application/json')
      .get() (err, res, body) ->
        switch res.statusCode
          when  200
            match = body.match(/Subject:\ (.+)/)
            msg.send match[1]
            msg.send "#{rtUrl}//Ticket/Display.html?id=#{ticketNumber}"
          when 401
            msg.send "Authentication Failure"
          else
            msg.send "shit"

  robot.respond /rtsearch (.*)/i, (msg) ->
    searchString = escape(msg.match[1])
    rtUrl = process.env.HUBOT_RT_URL
    username = process.env.HUBOT_RT_USERNAME
    password = process.env.HUBOT_RT_PASSWORD
    auth = 'Basic ' + new Buffer(username + ':' + password).toString('base64');
    msg.robot.http("#{rtUrl}/REST/1.0/search/ticket?query=(Status%20=%20'open'ORStatus%20=%20'new')ANDSubject%20LIKE%20'#{searchString}'") 
      .headers(Authorization: auth, Accept: 'application/json')
      .get() (err, res, body) ->
        switch res.statusCode
          when  200
            msg.send body
          when 401
            msg.send "Authentication Failure"
          else
            msg.send "shit"
