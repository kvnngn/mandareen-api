var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");
const debug = require("debug")("app:patient.controller");


//routes
module.exports = {
    createDiary: function(req, res) {
        debug('createDiary');

        return models.Diary.create({
            content: req.body.content,
            patient_id: req.body.id
        })
        .then(function() {return res.status(201).json('ok')})
        .catch(function(err) {
            console.log('Error add patient');
            console.log('Log : ' + err);
            return (res.status(500).json({'error': 'cannot add diary'}));
        });
    },

    updateDiary: function(req, res) {
        console.log("Update Diary");
        return models.Diary.update({
                content: req.body.content },
            { where: { id: req.body.id }
            })
            .then(function(result) {
                console.log(result);
                return res.json(result);
            })
            .catch(function(err) {
                console.log('Error updating diary');
                console.log('Log : ' + err);
                return (res.status(500).json({'Error': 'Cannot update diary'}));
            });
    },

    login: function(req, res) {
        debug('login');

        var email = req.body.email;
        var password = req.body.password;

        if(email == null || password == null) {
            return res.status(400).json({'error': 'missing parameters'});
        }

        return models.Patient.find({
            exclude: ['pass'],
            where: {email: email}
        })
        .then(function(patientFound) {
            if(patientFound) {
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
        debug('getAllPatientDiaries');

        return models.Diary.findAll({
            attributes: ['id', 'content', 'creation_date'],
            where: {
                patient_id: req.params.id
            }

        })
        .then(function(diaries) {
            return res.json(diaries);
        })
        .catch(next);
    },

    getAllRecipesNames: function(req, res, next) {
        console.log("getAllRecipesNames");
        return models.Recipes.findAll({
            attributes: ['id', 'name', 'image'],
            offset: parseInt(req.params.offset),
            limit: 3
        })
        .then(function(recipes) {
            console.log(recipes);
            return res.json(recipes);
        })
        .catch(next);
    },

    getRecipeDetails: function(req, res, next) {
        console.log("getRecipeDetails");
        return models.Recipes.find({
            attributes: ['id', 'name', 'description', 'image', 'nb_cal', 'ingredients'],
            where: {
                id: req.params.id
            }
        })
        .then(function(recipes) {
            console.log(recipes);
            return res.json(recipes);
        })
        .catch(next);
    },

    changeEmail: function(req, res, next) {
        debug("changeEmail");

        return models.Patient.update({
            email: req.body.newEmail },
            { where: { id: req.body.id }
        })
        .then(function(result) {
            return res.json(result);
        })
        .catch(function(err) {
            console.log('Error changing email');
            console.log('Log : ' + err);
            return (res.status(500).json({'Error': 'Cannot change email'}));
        });
    },

    findById: function(req, res, next) {
        debug("findById");

        return models.Patient.findOne({
            where: {
                id: req.params.id
            }
        })
        .then(function(patient) { return res.json(patient); })
        .catch(next);
    },
};