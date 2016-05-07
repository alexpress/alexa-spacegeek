should = require( "should" )
assert = require( "assert" )
app = require( '../lib/index' )
should.use require './ext/ext'
run = require( './ext/run' )( app )

describe "space geek", ->

  it "LaunchRequest", run "launch", ( res ) ->
    res.should.endSession()
    res.response.outputSpeech.text.should.startWith "Here's your new space fact"
    res.response.card.title.should.equal "Space Fact"

  it "GetNewFactIntent", run "getNewFact", ( res ) ->
    res.should.endSession()
    res.response.outputSpeech.text.should.startWith "Here's your new space fact"
    res.response.card.title.should.equal "Space Fact"

  it "AMAZON.HelpIntent", run "help", ( res ) ->
    res.should.not.endSession()
    res.response.outputSpeech.text.should.startWith "You can ask Space Geek tell me a space fact"

  it "AMAZON.StopIntent", run "stop", ( res ) ->
    res.should.endSession()
    res.response.outputSpeech.text.should.equal "Goodbye"

  it "AMAZON.CancelIntent", run "cancel", ( res ) ->
    res.should.endSession()
    res.response.outputSpeech.text.should.equal "Goodbye"

