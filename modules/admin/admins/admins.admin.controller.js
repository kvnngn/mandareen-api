var jwtUtils = require('../../../utils/jwt.utils')
var Logs = require('../../../utils/file_log_system')
var models = require("../../../models/index")

//routes
module.exports = {
    getAdminData: function(req, res) {
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);
        if(adminId < 0) {
            Logs.LogErrorIP(req, '401', "GetAdminData : wrong token");
            return res.status(401).json({'error': 'wrong token'});
        }
        models.Admin.findOne({
            attributes: ['id', 'login', 'firstname', 'lastname','email', 'type'],
            where: {id: adminId}
        }).then(function(admin) {
            if(admin) {
                Logs.LogSuccessIP(req, "201", "GetAdminData : ok");
                return res.status(201).json(admin);
            }
            else {
                Logs.LogErrorIP(req, '404', "GetAdminData : admin not found");
                return res.status(404).json({'error': 'admin not found'});
            }
        }).catch(function(err) {
            Logs.LogError('500', "GetAdminData : " + err);
            return res.status(500).json({'error': 'cannot fetch admin data'});
        });
    },
};
