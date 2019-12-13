const mongoose = require('mongoose')
const Pedido = require('../Model/Pedidos')

exports.getAll = (req, res, next) => {
    Pedido.find().exec().then(response => res.send(response))
}

exports.createPedido = (req, res, next) => {
    
}

exports.removePedido = (req, res, next) => {
    Pedido.deleteOne({ _id: req.body._id })
        .exec()
        .then(restaurant => {
            return res.status(200).json({
                message: 'O Pedido foi removido'
            })
        })
        .catch(err => res.status(500).json({"Err": err}))
}

exports.updatePedido = (req, res, next) => {

}