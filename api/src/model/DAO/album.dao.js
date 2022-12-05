const { response } = require('express');
const db = require('../../utils/db')
const Usuario = require('../usuario.model')
var md5 = require('md5');
require('dotenv/config');


async function postAlbum(userId, body) {
    await db.mongo_client.connect();
    const mdb = db.mongo_client.db(process.env.MONGO_DB);
    const collection = mdb.collection('Album');
    await collection.insertOne({userId: userId, body});
    await db.mongo_client.close()
}


async function updateAlbum(userId, body) {
    await db.mongo_client.connect();
    const mdb = db.mongo_client.db(process.env.MONGO_DB);
    const collection = mdb.collection('Album');
    await collection.updateOne({userId: userId}, {$set: body});
    await db.mongo_client.close()
}

async function getAlbum(userId, body) {
    await db.mongo_client.connect();
    const mdb = db.mongo_client.db(process.env.MONGO_DB);
    const collection = mdb.collection('Album');
    let response = await collection.findOne({userId: userId});
    await db.mongo_client.close();
    return response;
}



module.exports = {postAlbum, updateAlbum, getAlbum}