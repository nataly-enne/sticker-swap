module.exports = class Usuario {
    //propriedades e funções da classe aqui
    constructor(atributes) {
        if (atributes.id) this.id = atributes.id;
        this.username = atributes.username;
        this.password = atributes.password;
        this.nome = atributes.nome;
        this.cpf = atributes.cpf;
        this.email = atributes.email;
        this.telefone = atributes.telefone;
        this.endereco = atributes.endereco;
    }

}