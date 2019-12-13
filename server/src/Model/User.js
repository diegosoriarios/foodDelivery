const mongoose = require('mongoose')
const Schema = mongoose.Schema

const User = new Schema({
    nome: String,
    email: String,
    celular: Numeric,
    endereco: String,
    cep: String,
    cpf: String,
    senha: String,
    permissao: String
})

export default User