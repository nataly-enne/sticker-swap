const express = require('express');
const usuarioController = require('../controller/usuario.controller');
const albumController = require('../controller/album.controller')
const router = express.Router();
const { signupValidation, loginValidation } = require('../utils/validation');

// router.get("/usuarios", async function(req, res){
//     let id = await usuarioController.authToken(req);
//     if (!id) return res.status(403).send("Acesso negado");
//     return res.send(await usuarioController.listarUsuarios());
// });

// router.get("/usuario/:id", async function(req, res){
//     let id = await usuarioController.authToken(req);
//     if (!id) return res.status(403).send("Acesso negado");
//     return res.send(await usuarioController.getUsuario(req.params.id));
// });

router.get("/usuario/:id/album", async function(req, res){
    let id = (await usuarioController.authToken(req)).id;
    if (!id || id != req.params.id) return res.status(403).send("Acesso negado");
    return res.send(await albumController.getAlbum(req.params.id));
});

router.put("/usuario/:id/album", async function(req, res){
    let id = (await usuarioController.authToken(req)).id;
    if (!id || id != req.params.id) return res.status(403).send("Acesso negado");
    return res.send(await albumController.updateAlbum(req.params.id, req.body));
});

router.post("/usuario/:id/album", async function(req, res){
    return res.send(await albumController.postAlbum(req.params.id, req.body));
});

// router.delete("/usuario/:id", async function(req, res){
//     let id = await usuarioController.authToken(req);
//     if (!id ) return res.status(403).send("Acesso negado");
//     try {
//         return res.send(await usuarioController.deleteUsuario(req.params.id));
//     } catch (error) {
//         console.log(error)
//         return res.status(500).send("Erro interno");
//     }
// });

// router.post("/usuario", async function(req, res){
//     let id = await usuarioController.authToken(req);
//     if (!id) return res.status(403).send("Acesso negado");
//     return res.send(await usuarioController.postUsuario(req.body));
// });

router.post("/cadastro", signupValidation, async function(req, res){
    return await usuarioController.cadastroUsuario(req.body, res);
});

router.post("/login", loginValidation, async function(req, res){
    return await usuarioController.loginUsuario(req.body, res);
});

module.exports = router;