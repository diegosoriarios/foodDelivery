const mongoose = require('mongoose')

exports.getAll = (req, res, next) => {
    
}

exports.login = (req, res, next) => {
    const name = req.body.name
    const password = req.body.password

    Login.findOne({ name: name }, 'name password', (err, user) => {
        if (!user) return res.status(404).send("User not found!")

        const result = bcrypt.compareSync(password, user.password)

        if(!result) return res.status(401).send("Password Not Valid")

        const expiresIn = 24 * 60 * 60
        const accessToken = jwt.sign({ id: user.id }, SECRET_KEY, {
            expiresIn: expiresIn
        })

        res.status(200).send({ "user": user, "access_token": accessToken, "expires_in": expiresIn })
    })
}

exports.createUser = (req, res, next) => {
    const login = new Login({
        _id: mongoose.Types.ObjectId(),
        createdAt: req.body.createdAt,
        name: req.body.name,
        avatar: req.body.avatar,
        password: bcrypt.hashSync(req.body.password)
    })

    return login.save().then(response => res.status(200)).catch(err => console.log(err))
}

exports.deleteUser = (req, res, next) => {
    Login.deleteOne({_id: req.body._id})
        .exec()
        .then(response => {
            return res.status(200).json({
                message: 'Removed',
            })
        }).catch(err => res.status(500).json({"Err": err}))
}

exports.updateUser = (req, res, next) => {
    let newLogin = {
        _id: req.body._id,
        createdAt: req.body.createdAt,
        name: req.body.name,
        avatar: req.body.avatar,
        password: req.body.password
    }
    
    Login.findOneAndUpdate({_id: req.body._id}, newLogin, {upsert: true}, (err, doc) => {
        if(err) return res.send(500, { error: err})
        return res.send(200).json({
            message: "Updated"
        })
    })
}