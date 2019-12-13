const express = require('express')
const router = express.Router()

const userController = require('../Controller/User')

router.get('/getAll', userController.getAll)

router.post('/create', userController.createConta)

router.delete('/remove', userController.removeConta)

router.post('/update', userController.updateUsuario)

module.exports = router