const express = require('express')
const router = express.Router()

const restauranteController = require('../Controller/Restaurantes')

router.get('/getAll', restauranteController.getAll)

router.post('/create', restauranteController.createRestaurant)

router.delete('/remove', restauranteController.removeRestaurant)

router.post('/update', restauranteController.updateRestaurant)

module.exports = router