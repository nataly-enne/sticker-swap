const usuarioDAO = require('../model/DAO/usuario.dao');
const Usuario = require('../model/usuario.model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../utils/auth');

async function checaVendedor(id) {
    let usuario = await vendedorController.recuperaVendedorPorid(id);
    return (usuario != undefined);
}

async function checaGerente(id) {
    let usuario = await vendedorController.recuperaGerentePorid(id);
    return (usuario != undefined);
}

async function listarUsuarios() {
    return await usuarioDAO.listarUsuarios();
}

async function getUsuario(id) {
    return await usuarioDAO.recuperaUsuarioPorId(id);
}


async function deleteUsuario(id) {
    if (await vendedorController.recuperaVendedorPorid(id) != undefined) await vendedorController.deleteVendedor(id);
    if (await clienteController.recuperaClientePorid(id) != undefined) await clienteController.deleteCliente(id);
    if(await usuarioDAO.recuperaUsuarioPorId(id) != undefined) return await usuarioDAO.deletaUsuarioPorId(id)
    return undefined;
}


async function postUsuario(body) {
    let novoUsuario = new Usuario({username: body.username, senha: body.senha, nome: body.nome, cpf: body.cpf, email: body.email, telefone: body.telefone, endereco: body.endereco});
    await usuarioDAO.inserirUsuario(novoUsuario);
}

async function cadastroUsuario(body, res) {
    let usuario = await usuarioDAO.recuperaUsuarioPorEmail(body.email);
    
    if (usuario != undefined) return  res.status(409).send({msg: 'Usuário já existe'});
    await bcrypt.hash(body.senha, 10, async (err, hash) => {
        if(err) return  res.status(500).send({msg:'Erro interno'});
        try{
            body.senha = hash;
            await postUsuario(body);
            let novoUsuario = await usuarioDAO.recuperaUsuarioPorEmail(body.email);
            if (body.role == 'Vendedor' || body.role == 'Gerente') await vendedorController.postVendedor({id: novoUsuario.id, gerente: (body.role == 'Gerente')});
            else await clienteController.postCliente({id: novoUsuario.id});
        }catch(e){
            console.log(e);
            return res.status(400).send({msg: 'Bad request'});
        }
    });
    return res.status(201).send({msg: 'OK'});
}

async function loginUsuario(body, res) {
    let usuario = await usuarioDAO.recuperaUsuarioPorEmail(body.email);
    if (usuario == undefined) return res.status(400).send({msg: 'Usuário não existe'});
    bcrypt.compare(body.password, usuario.password, (err) => {
        if (err) return res.status(401).send({msg: 'Senha incorreta'});
        const token = jwt.sign({email: usuario.email}, auth.jwtSecretKey,{ expiresIn: '1h' });
        return res.status(201).send({msg: 'OK', token});
    });
    
}

async function authToken(req) {
    if(
        !req.headers.authorization ||
        !req.headers.authorization.startsWith('Bearer') ||
        !req.headers.authorization.split(' ')[1]
    ){
        return false;
    }
    try{
        const token = req.headers.authorization.split(' ')[1];
        const decoded = jwt.verify(token, auth.jwtSecretKey);
        let usuario = await usuarioDAO.recuperaUsuarioPorEmail(decoded.email);
        if (usuario != undefined) {
            return decoded;
        }
    }
    catch (e){
        console.log(e);
    }
    return false;
    
}



module.exports = {checaGerente, checaVendedor, authToken, loginUsuario, cadastroUsuario, listarUsuarios, getUsuario, deleteUsuario, postUsuario}