var bcrypt = require("bcrypt");
var jwtUtils = require('../../../utils/jwt.utils')
var models = require("../../../models/index")
var mailer = require("nodemailer");

//routes
module.exports = {
    getAllPro: function(req, res){
        console.log('getAllPro');
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0)
            return res.status(401).json({'error': 'wrong token'});
        models.Pro.findAll({
            attributes: ['id', 'civ', 'firstname', 'lastname', 'type'],
            order: [
                ['type', 'DESC']
            ]
        }).then(function(pros) {
            if(pros) {
                return res.status(200).json(pros);
            }
            else {
                return res.status(404).json({'error': 'Pros not found'});
            }
        }).catch(function(err) {
            return res.status(500).json({'error': 'cannot fetch pro data'});
        });
    },
};
