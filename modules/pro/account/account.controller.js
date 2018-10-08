var bcrypt = require("bcrypt");
var jwtUtils = require('../../../utils/jwt.utils');
var models = require("../../../models/index");
const debug = require("debug")("app:account.controller");

//routes
module.exports = {
    update: function(req, res, next) {
        debug("update");

        const updatePro = req.body;
        return models.Pro.update(updatePro,{where: {id: updatePro.id}})
        .then(function(pro) { return res.json(pro); })
        .catch(function(err) {
            console.log('Error verify pro:');
            console.log('Log : ' + err);
            return res.status(500).json({'error': 'unable to verify pro'});
        });
    },
    updateEmail: function(req, res, next) {
        debug("updateEmail");

        const email = req.body.email;

        return models.Pro.update(
            {email: email},
            {where: {id: req.body.pro_id}}
        )
        .then(function() { return res.json({res: "OK"}); })
        .catch(function(err) {
            console.log('Error verify pro:');
            console.log('Log : ' + err);
            return res.status(500).json({'error': 'unable to verify pro'});
        });
    },
    updatePassword: function(req, res, next) {
        debug("updatePassword");
        bcrypt.hash(req.body.currentPassword, 5, function(err, bcryptedPassword) {
            return models.Pro.find({where: {id: req.body.pro_id}})
            .then(function(proFound) {
                bcrypt.compare(req.body.currentPassword, proFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        bcrypt.hash(req.body.newPassword, 5, function(err, bcryptedPassword) {
                            return models.Pro.update(
                                {pass: bcryptedPassword},
                                {where: {id: req.body.pro_id}}
                            )
                            .then(function() { return res.json("OK"); })
                        });
                    }
                    else {return res.status(403).json({"error": "invalid password"});}
                });
            })
            .catch(next);
        });
    }
};