const express = require('express')
const bodyParser = require("body-parser")
const cors = require('cors')
const app = express()

app.use(bodyParser.urlencoded({ extended : true }))
app.use(bodyParser.json())
app.use(cors())

const restauranteRoute = require('./src/Router/Restaurantes')
const pedidosRoute = require('./src/Router/Pedidos')
const userRoute = require('./src/Router/User')
const produtosRoute = require('./src/Router/Produtos')

app.use('/restaurantes', restauranteRoute)
app.use('/pedidos', pedidosRoute)
app.use('/user', userRoute)
app.use('/produtos', produtosRoute)

app.listen(3000, () => {
    console.log('Server listening on port 3000')
})