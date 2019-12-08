const express = require('express')
const bodyParser = require("body-parser")
const cors = require('cors')
const app = express()

app.use(bodyParser.urlencoded({ extended : true }))
app.use(bodyParser.json())
app.use(cors())

const restauranteRoute = require('./Router/Restaurantes')
const pedidosRoute = require('./Router/Pedidos')

app.get('/restaurantes', restauranteRoute)

app.get('/pedidos', pedidosRoute)