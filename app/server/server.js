'use strict';

const koa = require('koa');
const path = require('path');
const route = require('koa-route');
const serve = require('koa-static');
const views = require('co-views');
const app = module.exports = koa();

let render = views(
  path.join(__dirname, '/views'),
  { ext: 'ejs' }
);

let user = {
  name: {
    first: 'Peter',
    last: 'Cottontail',
  },
  species: 'Rabbit',
  age: 105,
};

function * index() {
  this.body = yield render(
    'index', { user }
  );
}

app.use(route.get('/', index));
app.use(serve('app/public'));

if (!module.parent) {
  app.listen(8081);
}
