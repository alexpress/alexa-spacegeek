path = require 'path'
log = require( '../../lib/util/log' ) 'test'
session = {}
context = {}
merge = ( target, src ) -> target[ k ] = v for own k,v of src

request = ( name ) -> require path.join __dirname, "../fixtures", "request", "#{name}.json"

run = (app) -> ( name, fn ) -> (done) -> 
  r = request name
  merge r.session.attributes, session unless r.session.new

  app r, context, ( err, res ) ->
    merge session, res.sessionAttributes
    log res
    return done err if err?
    fn res if fn?
    done()

module.exports = run