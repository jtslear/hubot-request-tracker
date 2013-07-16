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
#   HUBOT_RT_IGNORE_USERS (optional, format: "user1|user2", default is "hubot")
#
# Commands:
# 
# Author:
#   jtslear

class Instance
  rtUrl = process.env.HUBOT_RT_URL
  rtUsername = process.env.HUBOT_RT_USERNAME
  rtPassword = process.env.HUBOT_RT_PASSWORD
  
  if rtUsername != undefined && rtUsername.length > 0
    auth = "#{rtUsername}:#{rtPassword}"
  
  rtIgnoreUsers = process.env.HUBOT_RT_ISSUES_IGNORE_USERS ? "hubot"
  
  print rtURL
