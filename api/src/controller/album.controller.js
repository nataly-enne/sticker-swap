async function getAlbum(id) {
    return await usuarioDAO.recuperaUsuarioPorId(id);
}


async function getAlbumId(email) {
    return await usuarioDAO.recuperaUsuarioPorId(id);
}


async function postAlbum(body) {
    let novoUsuario = new Usuario({password: body.password, email: body.email});
    await usuarioDAO.inserirUsuario(novoUsuario);
}