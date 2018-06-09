var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");

//routes
module.exports = {
    register: function(req, res) {
        var email = req.body.email;
        var password = req.body.password;
        var civ = req.body.civ;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var city = req.body.city;
        var phone = req.body.phone;
        var type = req.body.type;

        if(email == null || password == null || civ == null || firstname == null ||
            lastname == null || city == null || phone == null) {
            return res.status(400).json({'error': 'missing paramaters'});
        }

        // TODO verification

        models.Pro.findOne({
            attributes: ['email'],
            where: {email: email}
        })
        .then(function(proFound) {
            if(!proFound) {
                bcrypt.hash(password, 5, function(err, bcryptedPassword) {
                    var newPro = models.Pro.create({
                        email: email,
                        pass: bcryptedPassword,
                        civ: civ,
                        firstname: firstname,
                        lastname: lastname,
                        city: city,
                        phone: phone
                    })
                    .then(function(newPro) {
                        return res.status(201).json({'proId': newPro.id})
                    })
                    .catch(function(err) {
                        console.log('Error add pro');
                        console.log('Log : ' + err)
                        return (res.status(500).json({'error': 'cannot add pro'}));
                    });
                });
            } else {
                return res.status(409).json({'error': 'pro already exist'});
            }
        })
        .catch(function(err) {
            console.log('Error verify pro:');
            console.log('Log : ' + err);
            return res.status(500).json({'error': 'unable to verify pro'});
        });
    },
    login: function(req, res) {
        console.log("login");

        var email = req.body.email;
        var password = req.body.password;

        console.log(req.body);
        if(email == null || password == null) {
            return res.status(400).json({'error': 'missing parameters'});
        }

        return models.Pro.find({
            attributes: ['id', 'pass'],
            where: {email: email}
        })
        .then(function(proFound) {
            if(proFound) {
                console.log(proFound);
                bcrypt.compare(password, proFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        return res.status(200).json({
                            'proId': proFound.id,
                            'token': jwtUtils.generateTokenForPro(proFound)
                        });
                    }
                    else {return res.status(403).json({"error": "invalid password"});}
                });
            }
            else {return res.status(404).json({'error': 'pro not exist in DB'});}
        })
        .catch(function(err) {
            return res.status(500).json({'error': 'unable to verify pro'});
        });
    },
    register: function(req, res) {
        console.log("register");
        console.log(req.body);
    }
};