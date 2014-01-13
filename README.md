#hubot-request-tracker#

This is a very young script, and probably nasty looking script.  Please feel free to fork this project and contribute.

##Setup##
 1. Simply drop request\_tracker.coffee in your hubots' scripts directory
 2. Set the following environmental variables:
  * HUBOT\_RT\_URL
  * HUBOT\_RT\_USERNAME
  * HUBOT\_RT\_PASSWORD

##Usage##

Thus far he responds to 3 items:
 * `hubot rturl` passes back HUBOT\_RT\_URL
 * `hubot rtuser` passes back HUBOT\_RT\_USERNAME
 * `hubot rt[\d]` reaches out to your RT instance quering for that ticket number, returning the Subject and link to the ticket
 * `hubot rtsearch [\w]` performs a search on the subject line for all new and open tickets

##Notes##
This script is still very young and work in progress!
