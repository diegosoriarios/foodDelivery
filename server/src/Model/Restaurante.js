const mongoose = require('mongoose')
const Schema = mongoose.Schema

const Restaurante = new Schema({
    nome: String,
    imagem: String,
    categoria: String,
    produtos: ObjectId,
    horarios: ObjectId
})

export default Restaurante