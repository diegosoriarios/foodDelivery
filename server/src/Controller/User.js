const mongoose = require('mongoose')
const User = require('../Model/User')

exports.getAll = (req, res, next) => {
    User.find().exec().then(response => res.send(response))
}

exports.createConta = (req, res, next) => {
    
}

exports.removeConta = (req, res, next) => {
    User.deleteOne({ _id: req.body._id })
        .exec()
        .then(restaurant => {
            return res.status(200).json({
                message: 'O Usuário foi removido'
            })
        })
        .catch(err => res.status(500).json({"Err": err}))
}

exports.updateUsuario = (req, res, next) => {

}