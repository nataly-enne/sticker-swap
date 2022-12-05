const mysql = require("mysql");
const syncSql = require("sync-mysql")
const util = require('util')
const { MongoClient } = require('mongodb');
require('dotenv/config');

const url = process.env.MONGO_URI;
console.log(url)
var mongo_client = new MongoClient(url);
//const dbName = 'stickerswap';
//await mongo_client.connect();
//const db = mongo_client.db(dbName);
//const collection = db.collection('stickers');


const config_mysql = {
    host: process.env.MYSQL_HOSTNAME, // O host do banco. Ex: localhost
    user: process.env.MYSQL_USER, // Um usuário do banco. Ex: user 
    password: process.env.MYSQL_ROOT_PASSWORD, // A senha do usuário. Ex: user123
    database: process.env.MYSQL_DB // A base de dados a qual a aplicação irá se conectar, deve ser a mesma onde foi executado o Código 1. Ex: node_mysql
}
console.log(config_mysql)
function connect(){
    var con = mysql.createConnection(config_mysql);
    
    //verifica conexao com o banco
    con.connect((err) => {
        if (err) {
            console.log('Erro connecting to database...', err);
            return;
        }
        //console.log('Connection established!');
    });

    con.query = util.promisify(con.query);
    return con;
}


function connectSync(){
    return new syncSql(config_mysql);
}

module.exports = {connect, connectSync, mysql, mongo_client}