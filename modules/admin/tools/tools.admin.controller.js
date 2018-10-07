var jwtUtils = require('../../../utils/jwt.utils')
var Logs = require('../../../utils/file_log_system')
var models = require("../../../models/index")

//routes
module.exports = {
    getLogs: function(req, res){
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);
        var date = req.params.date;
        if(adminId < 0) {
            Logs.LogErrorIP(req, "401", "getAllPro : wrong token");
            return res.status(401).json({'error': 'wrong token'});
        }
        var logs = Logs.GetLogsFromDate(date);
        if (logs == "err"){
            return res.status(500).json({'error': "error with log file (maybe it don't exist ?)"});
        }
        else
        {
            Logs.LogSuccessIP(req, "200", "GetLogs : ok");
            return res.status(200).json({'logs': logs});
        }
    },
};