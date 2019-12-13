const express = require('express')
const router = express.Router()

const produtoController = require('../Controller/Produtos')

router.get('/getAll', produtoController.getAll)

router.post('/create', produtoController.createProduto)

router.delete('/remove', produtoController.removeProduto)

router.post('/update', produtoController.updateProduto)

module.exports = router