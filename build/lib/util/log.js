var replacer,
  __slice = [].slice;

replacer = function(k, v) {
  if (typeof v === 'function') {
    return '[Function]';
  }
  return v;
};

module.exports = function(tag) {
  return function() {
    var item, items, msgs;
    items = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    msgs = (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = items.length; _i < _len; _i++) {
        item = items[_i];
        if (typeof item === 'object') {
          _results.push(JSON.stringify(item, replacer));
        } else {
          _results.push(item);
        }
      }
      return _results;
    })();
    return console.log("[" + tag + "] " + (msgs.join(' ')));
  };
};
