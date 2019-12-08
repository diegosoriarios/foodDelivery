const express = require('express')
const router = express.Router()

const pedidosController = require('../Controller/Restaurantes')

router.get('/getAll', pedidosController.getAll)

router.post('/create', pedidosController.createRestaurant)

router.delete('/remove', pedidosController.removeRestaurant)

router.post('/update', pedidosController.updateRestaurant)

module.exports = router