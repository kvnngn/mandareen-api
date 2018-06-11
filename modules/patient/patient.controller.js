var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");

//routes
module.exports = {
    // !! A continuer pour le journal une fois que le lien avec méd sera fait !! \\
    patientDiary: function(req, res) {
        console.log(req.body);
        var content = req.body.content;
        return res.status(200).json({
            'message': 'Informations envoyées'
        });
    },
    patientLogin: function(req, res) {
        console.log(req.body);
        //console.log(req);
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
                /* ///// A décomenter lorsque les mots de passe seront hashés en bdd \\\\\ */
                //bcrypt.compare(password, patientFound.pass, function(errBycrypt, resBycrypt) {
                    //console.log(resBycrypt);
                    if(password == patientFound.pass) {

                        return res.status(200).json({
                            'message': 'Utilisateur connecté'
                            //'token': jwtUtils.generateTokenForPatient(patientFound)
                        });
                    }
                    else {
                        return res.status(403).json({"error": "invalid password"});
                    }
                //});
            }
            return res.status(404).json({'error': 'patient does not exist in DB'});
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
    },
    addAdmin: function(req, res) {
        var Newlogin = req.body.login;
        var password = req.body.password;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        if(Newlogin == null || password == null || firstname == null || lastname == null) {
            return res.status(400).json({'error': 'missing paramaters'});
        }
    }
};