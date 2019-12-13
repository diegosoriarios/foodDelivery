const mongoose = require('mongoose')
const Produto = require('../Model/Produtos')

exports.getAll = (req, res, next) => {
    Produto.find().exec().then(response => res.send(response))
}

exports.createProduto = (req, res, next) => {
    
}

exports.removeProduto = (req, res, next) => {
    Produto.deleteOne({ _id: req.body._id })
        .exec()
        .then(restaurant => {
            return res.status(200).json({
                message: 'O Produto foi removido'
            })
        })
        .catch(err => res.status(500).json({"Err": err}))
}

exports.updateProduto = (req, res, next) => {

}