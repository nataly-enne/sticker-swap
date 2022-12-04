const express = require('express');
const usuarioController = require('../controller/usuario.controller');
const router = express.Router();
const { signupValidation, loginValidation } = require('../utils/validation');

router.get("/usuarios", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id) return res.status(403).send("Acesso negado");
    return res.send(await usuarioController.listarUsuarios());
});

router.get("/usuario/:id", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id) return res.status(403).send("Acesso negado");
    return res.send(await usuarioController.getUsuario(req.params.id));
});

router.get("/usuario/stickers", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id) return res.status(403).send("Acesso negado");
    return res.send(await usuarioController.getUsuario(req.params.id));
});

router.post("/usuario/stickers", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id) return res.status(403).send("Acesso negado");
    return res.send(await usuarioController.getUsuario(req.params.id));
});


router.delete("/usuario/:id", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id ) return res.status(403).send("Acesso negado");
    try {
        return res.send(await usuarioController.deleteUsuario(req.params.id));
    } catch (error) {
        console.log(error)
        return res.status(500).send("Erro interno");
    }
});

router.post("/usuario", async function(req, res){
    let id = await usuarioController.authToken(req);
    if (!id) return res.status(403).send("Acesso negado");
    return res.send(await usuarioController.postUsuario(req.body));
});

router.post("/cadastro", signupValidation, async function(req, res){
    return await usuarioController.cadastroUsuario(req.body, res);
});

router.post("/login", loginValidation, async function(req, res){
    return await usuarioController.loginUsuario(req.body, res);
});

module.exports = router;