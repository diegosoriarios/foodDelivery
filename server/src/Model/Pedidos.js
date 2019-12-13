const mongoose = require('mongoose')
const Schema = mongoose.Schema

const Pedidos = new Schema({
    pedido: Date,
    produtos: ObjectId
})

export default Pedidos