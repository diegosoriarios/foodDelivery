const mongoose = require('mongoose')
const Restaurante = require('../Model/Restaurante')

exports.getAll = (req, res, next) => {
    Restaurante.find().exec().then(response => res.send(response))
}

exports.removeRestaurant = (req, res, next) => {
    Restaurante.deleteOne({ _id: req.body._id })
        .exec()
        .then(restaurant => {
            return res.status(200).json({
                message: 'O Restaurante foi removido'
            })
        })
        .catch(err => res.status(500).json({"Err": err}))
}

exports.updateRestaurant = (req, res, next) => {

}