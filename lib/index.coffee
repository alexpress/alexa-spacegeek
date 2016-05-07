app = require( 'alexpress' )()
{tell, renderAsk, validateApp} = require 'alexpress-middleware'

spaceFacts = require './spaceFacts'

newSpaceFact = ( req, res, next ) ->
  res.local( "fact", spaceFacts.newFact() )
  .renderSimpleCard "Space Fact", 'fact'
  .render "fact"

app.use '/launch', newSpaceFact
app.use '/intent/getNewFact', newSpaceFact
app.use '/intent/amazon/help', renderAsk "help", "helpReprompt"
app.use '/intent/amazon/stop', tell "Goodbye"
app.use '/intent/amazon/cancel', tell "Goodbye"

module.exports = app.lambda
