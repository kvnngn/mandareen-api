var jwtUtils = require('../../../utils/jwt.utils')
var Logs = require('../../../utils/file_log_system')
var models = require("../../../models/index")

//routes
module.exports = {
    getAllPro: function(req, res){
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0) {
            Logs.LogErrorIP(req, "401", "getAllPro : wrong token");
            return res.status(401).json({'error': 'wrong token'});
        }
        models.Pro.findAll({
            attributes: ['id', 'civ', 'firstname', 'lastname', 'type'],
            order: [
                ['type', 'DESC']
            ]
        }).then(function(pros) {
            if(pros) {
                Logs.LogSuccessIP(req, "200", "getAllPro : ok");
                return res.status(200).json(pros);
            }
            else {
                Logs.LogErrorIP(req, "404", "getAllPro : not found");
                return res.status(404).json({'error': 'Pros not found'});
            }
        }).catch(function(err) {
            Logs.LogError('500', "GetAllPatient : " + err);
            return res.status(500).json({'error': 'cannot fetch pro data'});
        });
    },
};
