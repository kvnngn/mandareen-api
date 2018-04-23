var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");

//routes
module.exports = {
    patientLogin: function(req, res) {
        console.log(req.body);
        console.log(req);
        var email = req.body.email;
        var password = req.body.password;

        if(email == null || password == null) {
            return res.status(400).json({'error': 'missing parameters'});
        }

        models.Patient.findOne({
            attributes: ['id', 'pass'],
            where: {email: email}
        })
        .then(function(patientFound) {
            if(patientFound) {
                bcrypt.compare(password, patientFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        return res.status(200).json({
                            'token': jwtUtils.generateTokenForPatient(patientFound)
                        });
                    }
                    else {
                        return res.status(403).json({"error": "invalid password"});
                    }
                });
            }
            return res.status(404).json({'error': 'patient not exist in DB'});
        })
        .catch(function(err) {
            return res.status(500).json({'error': 'unable to verify patient'});
        });
    },
    findAll: function(req, res, next) {
        console.log("findAll");
        return models.Patient.findAll()
        .then(function(patients) { return res.json(patients); })
        .catch(next);
    },
    findById: function(req, res, next) {
        console.log("findById");
        return models.Patient.findOne({
            where: {
                id: req.params.id
            }
        })
        .then(function(patient) { return res.json(patient); })
        .catch(next);
    }
};