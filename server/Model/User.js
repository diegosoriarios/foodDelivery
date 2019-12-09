const mongoose = require('mongoose')
const Schema = mongoose.Schema

const userModel = new Schema({
    nome: String,
    email: String,
    celular: Numeric,
    endereco: String,
    cep: String,
    cpf: String,
    senha: String
})

export default userModel