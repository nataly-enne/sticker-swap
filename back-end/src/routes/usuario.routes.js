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
    let auth = await usuarioController.authToken(req);
    let isEmployee = (req.body.role == 'Vendedor' || req.body.role == 'Gerente');
    if ((!auth && isEmployee) || (!(await usuarioController.checaGerente(auth.id)) && isEmployee) ) return res.status(403).send("Acesso negado");
    return await usuarioController.cadastroUsuario(req.body, res);
});

router.post("/login", loginValidation, async function(req, res){
    return await usuarioController.loginUsuario(req.body, res);
});

module.exports = router;