const mysql = require("mysql");
const syncSql = require("sync-mysql")
const util = require('util')
require('dotenv/config');


const config = {
    host: process.env.MYSQL_HOSTNAME, // O host do banco. Ex: localhost
    user: process.env.MYSQL_USER, // Um usuário do banco. Ex: user 
    password: process.env.MYSQL_ROOT_PASSWORD, // A senha do usuário. Ex: user123
    database: process.env.MYSQL_DB // A base de dados a qual a aplicação irá se conectar, deve ser a mesma onde foi executado o Código 1. Ex: node_mysql
}

function connect(){
    var con = mysql.createConnection(config);
    
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
    return new syncSql(config);
}

module.exports = {connect, connectSync, mysql}