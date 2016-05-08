app = require( 'alexpress' )()
{tell, renderAsk} = require 'alexpress-middleware'
spaceFacts = require './spaceFacts'

newSpaceFact = ( req, res, next ) ->
  res
  .local "fact", spaceFacts.newFact()
  .renderSimpleCard "Space Fact", 'fact'
  .render "fact"

app
.use '/launch', newSpaceFact
.use '/intent/getNewFact', newSpaceFact
.use '/intent/amazon/help', renderAsk "help", "helpReprompt"
.use '/intent/amazon/stop', tell "Goodbye"
.use '/intent/amazon/cancel', tell "Goodbye"

module.exports = app.lambda
