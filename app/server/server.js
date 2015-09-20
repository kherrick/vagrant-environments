const express = require('express');
const path = require('path');
const app = express();


// main page
app.get('/', (req, res) => {
  res.sendFile(
    path.join(__dirname, '../public/index.html')
  );
});

// public resources
app.use(
  express.static(
    path.join(__dirname, '../public/')
  )
);

// 404 page
app.use((req, res) => {
  res.type('text/plain');
  res.status(404);
  res.send('404');
});

// 500 page
app.use((err, req, res) => {
  console.error(err.stack);
  res.type('text/plain');
  res.status(500);
  res.send('500');
});

// start listening
app.listen('8081', 'localhost', () => {
  console.log('Express started on http://localhost:8081');
});
