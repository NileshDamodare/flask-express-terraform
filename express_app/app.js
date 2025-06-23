// express_app/app.js
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from Express on port 3000!');
});

const port = 3000;
app.listen(port, () => {
  console.log(`Express app listening at http://0.0.0.0:${port}`);
});

