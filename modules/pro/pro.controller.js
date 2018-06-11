var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");

//routes
module.exports = {
    register: function(req, res, next) {
        console.log("register");

        var email = req.body.email;
        var password = req.body.password;
        var civ = req.body.civility;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var city = req.body.city;
        var phone = req.body.phone;
        var type = req.body.type;

        if(!email || !password || !civ || !firstname || !lastname || !city || !phone) {
            return res.status(400).json({'error': 'missing paramaters'});
        }

        // TODO verification

        return models.Pro.find({
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
                        console.log('Log : ' + err);
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
    login: function(req, res, next) {
        console.log("login");

        var email = req.body.email;
        var password = req.body.password;

        console.log(req.body);
        if(email == null || password == null) {
            return res.status(400).json({'error': 'missing parameters'});
        }

        return models.Pro.find({
            exclude: ['pass'],
            where: {email: email}
        })
        .then(function(proFound) {
            if(proFound) {
                bcrypt.compare(password, proFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        return res.status(200).json({
                            'pro': proFound,
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
    getPatientsByPro: function(req, res, next) {
        console.log("getPatientsByPro");
        return models.Patient.findAll()
        .then(function(reports) { return res.json(reports); })
        .catch(next);
    },
    getReportsByPro: function(req, res, next) {
        console.log("getReportsByPro");
        return models.Report_pro.findAll({where: {pro_id: req.params.id}})
        .then(function(reports) { return res.json(reports); })
        .catch(next);
    },
    addPatient: function(req, res, next) {
        console.log("register");

        var email = req.body.email;
        var password = req.body.password;
        var civ = req.body.civility;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var birthdate = req.body.birthdate;
        var pro_id = req.body.pro_id;

        if(!email || !password || !civ || !firstname || !lastname || !birthdate || !pro_id) {
            return res.status(400).json({'error': 'missing paramaters'});
        }

        // TODO verification

        return models.Patient.find({
            attributes: ['email'],
            where: {email: email}
        })
        .then(function(patientFound) {
            if(!patientFound) {
                bcrypt.hash(password, 5, function(err, bcryptedPassword) {
                    var newPatient = models.Patient.create({
                        email: email,
                        pass: bcryptedPassword,
                        civ: civ,
                        firstname: firstname,
                        lastname: lastname,
                        birthdate: birthdate
                    })
                    .then(function(newPatient) {
                        return res.status(201).json({'patientId': newPatient.id})
                    })
                    .catch(function(err) {
                        console.log('Error add patient');
                        console.log('Log : ' + err);
                        return (res.status(500).json({'error': 'cannot add patient'}));
                    });
                });
            } else {
                return res.status(409).json({'error': 'patient already exist'});
            }
        })
        .catch(function(err) {
            console.log('Error verify patient:');
            console.log('Log : ' + err);
            return res.status(500).json({'error': 'unable to verify patient'});
        });
    },
};