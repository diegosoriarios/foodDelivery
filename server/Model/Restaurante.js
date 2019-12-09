const mongoose = require('mongoose')
const Schema = mongoose.Schema

const restaurantModel = new Schema({
    nome: String,
    imagem: String,
    categoria: String,
    produtos: ObjectId,
    horarios: ObjectId
})

export default restaurantModel