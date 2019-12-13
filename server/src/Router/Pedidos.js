const express = require('express')
const router = express.Router()

const pedidosController = require('../Controller/Pedidos')

router.get('/getAll', pedidosController.getAll)

router.post('/create', pedidosController.createPedido)

router.delete('/remove', pedidosController.removePedido)

router.post('/update', pedidosController.updatePedido)

module.exports = router