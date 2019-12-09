const mongoose = require('mongoose')
const Schema = mongoose.Schema

const produtosModel = new Schema({
    nome: String,
    preco: Decimal128,
    imagem: String,
    ingredientes: Array
})

export default produtosModel