var bcrypt = require("bcrypt");
var jwtUtils = require('../../../utils/jwt.utils');
var models = require("../../../models/index");
const debug = require("debug")("app:patients.controller");

//routes
module.exports = {
    getPatientsByPro: function(req, res, next) {
        debug("getPatientsByPro");

        let followups = [];
        let patients = [];

        return Promise.resolve()
        .then(findFollowupLinkedToPro)
        .then(getUniquePatients)
        .then(() => {res.json(patients)})
        .catch(next);


        function findFollowupLinkedToPro() {
            return models.Followup.findAll({
                where: {pro_id: req.params.id},
                include: [{
                    model: models.Patient,
                    attributes: {exclude: ['password']}
                }],
            })
            .then(function(_followups) {followups = _followups;})
        }

        function getUniquePatients() {
            patients = followups.filter((followup) => {return followup.Patient;});
        }

    },
    addPatient: function(req, res, next) {
        debug("addPatient");

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