const { response } = require('express');
const db = require('../../utils/db')
const Usuario = require('../usuario.model')

async function inserirUsuario(usuario) {
    let query = "INSERT INTO user SET password = " + db.mysql.escape(usuario.password) + ", email = " + db.mysql.escape(usuario.email);
    connection = db.connect();
    await connection.query(query);
    connection.end(); 
}

async function listarUsuarios() {
    let query = "SELECT * FROM usuario";
    connection = db.connect();
    let response = await connection.query(query);
    //connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}


async function recuperaUsuarioPorId(id) {
    let query = "SELECT * FROM usuario WHERE id = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    return response[0];
}

async function recuperaUsuarioPorEmail(email) {
    let query = "SELECT * FROM user WHERE `email` = "+ db.mysql.escape(email);
    connection = db.connect();
    let response = await connection.query(query);
    //connection.end();
    return response[0];
}

async function deletaUsuarioPorId(id) {
    let query = "DELETE FROM usuario WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioUsername(id, username) {
    let query = "UPDATE usuario SET 'username' = " + db.mysql.escape(username) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioSenha(id, senha) {
    let query = "UPDATE usuario SET 'senha' = " + db.mysql.escape(senha) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioNome(id, nome) {
    let query = "UPDATE usuario SET 'nome' = " + db.mysql.escape(nome) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioCPF(id, cpf) {
    let query = "UPDATE usuario SET 'cpf' = " + db.mysql.escape(cpf) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioEmail(id, email) {
    let query = "UPDATE usuario SET 'email' = " + db.mysql.escape(email) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioTelefone(id, telefone) {
    let query = "UPDATE usuario SET 'telefone' = " + db.mysql.escape(telefone) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

async function updateUsuarioEndereco(id, endereco) {
    let query = "UPDATE usuario SET 'endereco' = " + db.mysql.escape(endereco) + "WHERE `id` = "+ db.mysql.escape(id);
    connection = db.connect();
    let response = await connection.query(query);
    connection.end();
    let usuarios = [];
    for (let index = 0; index < response.length; index++) {
        usuarios.push(new Usuario(response[index]));
        
    }
    return usuarios;
}

module.exports = {recuperaUsuarioPorEmail, inserirUsuario, listarUsuarios, recuperaUsuarioPorId, deletaUsuarioPorId, updateUsuarioUsername, updateUsuarioSenha, updateUsuarioNome, updateUsuarioCPF, updateUsuarioEmail, updateUsuarioTelefone, updateUsuarioEndereco}