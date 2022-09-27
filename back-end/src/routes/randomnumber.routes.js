const express = require('express');
const usuarioController = require('../controller/usuario.controller');
const router = express.Router();


router.get("/randomnumber", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id) return res.status(403).send("Acesso negado");
    return res.status(200).send({randomNumber: Math.random().toString()});
});


module.exports = router;