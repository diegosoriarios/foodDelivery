const mongoose = require('mongoose')
const Schema = mongoose.Schema

const pedidosModel = new Schema({
    pedido: Date,
    produtos: ObjectId
})

export default pedidosModel