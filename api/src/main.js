const createError = require('http-errors');
const express = require('express');
const bodyParser = require('body-parser');
//require('dotenv/config');
const app = express();
app.use(express.json())
app.use(express.urlencoded({extended: true}))


app.use('/api', require('./routes/usuario.routes'));
app.use('/api', require('./routes/randomnumber.routes'));

app.use((err, req, res, next) => {
    // console.log(err);
    err.statusCode = err.statusCode || 500;
    err.message = err.message || "Erro interno";
    res.status(err.statusCode).json({
      message: err.message,
    });
});

app.listen(process.env.API_PORT, () => console.log(`sticker_swap_api iniciada! escutando porta: ${process.env.API_PORT}`));

