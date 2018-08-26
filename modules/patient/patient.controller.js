var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");

//routes
module.exports = {
    create: function(req, res) {
        console.log(req.body);
        return models.Diary.create({
            content: req.body.content,
            patient_id: req.body.id,
            humeur: req.body.humeur
        })
        .then(function() {return res.status(201).json('ok')})
        .catch(function(err) {
            console.log('Error add patient');
            console.log('Log : ' + err);
            return (res.status(500).json({'error': 'cannot add patient'}));
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

        return models.Patient.find({
            exclude: ['pass'],
            where: {email: email}
        })
        .then(function(patientFound) {
            if(patientFound) {
                console.log(password, patientFound.pass);
                bcrypt.compare(password, patientFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        return res.status(200).json({
                            'patient': patientFound,
                            'token': jwtUtils.generateTokenForPro(patientFound)
                        });
                    }
                    else {return res.status(403).json({"error": "invalid password"});}
                });
            }
            else {return res.status(404).json({'error': 'User not found'});}
        })
        .catch(function(err) {
            return res.status(500).json({'error': 'unable to verify pro'});
        });
    },

    getAllPatientDiaries: function(req, res, next) {
        console.log("getAllPatientDiaries");
        return models.Diary.findAll({
            attributes: ['id', 'content', 'creation_date', 'humeur'],
            where: {
                patient_id: req.params.id
            }

        })
        .then(function(diaries) {
            console.log(diaries);
            return res.json(diaries);
        })
        .catch(next);
    },

    changeEmail: function(req, res, next) {
        console.log("changeEmail");
        return models.Patient.update({
            email: req.body.newEmail },
            { where: { id: req.body.id }
        })
        .then(function(result) {
            console.log(result);
            return res.json(result);
        })
        .catch(function(err) {
            console.log('Error changing email');
            console.log('Log : ' + err);
            return (res.status(500).json({'Error': 'Cannot change email'}));
        });
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