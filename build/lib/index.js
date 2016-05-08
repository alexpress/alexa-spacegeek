var app, newSpaceFact, renderAsk, spaceFacts, tell, _ref;

app = require('alexpress')();

_ref = require('alexpress-middleware'), tell = _ref.tell, renderAsk = _ref.renderAsk;

spaceFacts = require('./spaceFacts');

newSpaceFact = function(req, res, next) {
  return res.local("fact", spaceFacts.newFact()).renderSimpleCard("Space Fact", 'fact').render("fact");
};

app.use('/launch', newSpaceFact).use('/intent/getNewFact', newSpaceFact).use('/intent/amazon/help', renderAsk("help", "helpReprompt")).use('/intent/amazon/stop', tell("Goodbye")).use('/intent/amazon/cancel', tell("Goodbye"));

module.exports = app.lambda;
