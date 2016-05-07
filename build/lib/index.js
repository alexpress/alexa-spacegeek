var app, newSpaceFact, renderAsk, spaceFacts, tell, validateApp, _ref;

app = require('alexpress')();

_ref = require('alexpress-middleware'), tell = _ref.tell, renderAsk = _ref.renderAsk, validateApp = _ref.validateApp;

spaceFacts = require('./spaceFacts');

newSpaceFact = function(req, res, next) {
  return res.local("fact", spaceFacts.newFact()).renderSimpleCard("Space Fact", 'fact').render("fact");
};

app.use('/launch', newSpaceFact);

app.use('/intent/getNewFact', newSpaceFact);

app.use('/intent/amazon/help', renderAsk("help", "helpReprompt"));

app.use('/intent/amazon/stop', tell("Goodbye"));

app.use('/intent/amazon/cancel', tell("Goodbye"));

module.exports = app.lambda;
