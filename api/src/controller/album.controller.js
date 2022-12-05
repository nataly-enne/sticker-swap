const albumDAO = require('../model/DAO/album.dao')

async function getAlbum(id) {
    return await albumDAO.getAlbum(id);
}


async function updateAlbum(id, body) {
    return await albumDAO.updateAlbum(id, body);
}


async function postAlbum(id, body) {
    await albumDAO.postAlbum(id, body);
}

module.exports = {getAlbum, updateAlbum, postAlbum};