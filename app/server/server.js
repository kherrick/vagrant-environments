'use strict';

require('babel-polyfill');

var _marked = [index].map(regeneratorRuntime.mark);

var koa = require('koa');
var path = require('path');
var route = require('koa-route');
var serve = require('koa-static');
var views = require('co-views');
var app = module.exports = koa();
var port = 8080;

var render = views(path.join(__dirname, '/views'), { ext: 'ejs' });

var user = {
  name: {
    first: 'Peter',
    last: 'Cottontail'
  },
  species: 'Rabbit',
  age: 99
};

function index() {
  return regeneratorRuntime.wrap(function index$(_context) {
    while (1) switch (_context.prev = _context.next) {
      case 0:
        _context.next = 2;
        return render('index', { user: user });

      case 2:
        this.body = _context.sent;

      case 3:
      case 'end':
        return _context.stop();
    }
  }, _marked[0], this);
}

app.use(route.get('/', index));
app.use(serve('app/public'));

if (!module.parent) {
  app.listen(port);
}
//# sourceMappingURL=server.js.map
