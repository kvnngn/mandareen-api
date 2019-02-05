var jwtUtils = require('../../../utils/jwt.utils');
var Logs = require('../../../utils/file_log_system');
var models = require("../../../models/index");

//routes
module.exports = {
    getAllSubs: function(req, res){
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0) {
            Logs.LogErrorIP(req, "401", "getAllSubs : wrong token");
            return res.status(401).json({'error': 'wrong token'});
        }
        models.Subs_pro.findAll({
            attributes: ['id', 'pending', 'date_sub_start', 'date_sub_end'],
            include: [{
                model: models.Pro,
                attributes:['civ', 'firstname', 'lastname']
            },
        {
            model: models.Subscription,
            attributes:['name']
        }],
        }).then(function(subs) {
            if(subs) {
                Logs.LogSuccessIP(req, "200", "getAllSubs : ok");
                return res.status(200).json(subs);
            }
            else {
                Logs.LogErrorIP(req, "404", "getAllSubs : not found");
                return res.status(404).json({'error': 'Subs not found'});
            }
        }).catch(function(err) {
            Logs.LogError('500', "GetAllSubs : " + err);
            return res.status(500).json({'error': 'cannot fetch Subs data'});
        });
    },
    getAllSubsFilter: function(req, res){
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);
        var filter = req.params.filter;

        if (!filter)
            filter = "";
        else if (filter != "Yes" && filter != "No")
            filter = "";

        if(adminId < 0) {
            Logs.LogErrorIP(req, "401", "getAllSubs : wrong token");
            return res.status(401).json({'error': 'wrong token'});
        }
        models.Subs_pro.findAll({
            attributes: ['id', 'pending', 'date_sub_start', 'date_sub_end'],
            include: [{
                model: models.Pro,
                attributes:['civ', 'firstname', 'lastname']
            },
        {
            model: models.Subscription,
            attributes:['name']
        }],
        }).then(function(subs) {
            if(subs) {
                Logs.LogSuccessIP(req, "200", "getAllSubs : ok");
                return res.status(200).json(subs);
            }
            else {
                Logs.LogErrorIP(req, "404", "getAllSubs : not found");
                return res.status(404).json({'error': 'Subs not found'});
            }
        }).catch(function(err) {
            Logs.LogError('500', "GetAllSubs : " + err);
            return res.status(500).json({'error': 'cannot fetch Subs data'});
        });
    },
    ToogleSub: function(req, res){
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0) {
            Logs.LogErrorIP(req, "401", "ToogleSub : wrong token");
            return res.status(401).json({'error': 'wrong token'});
        }
        return models.Subs_pro.update({
                    pending : "No"
                }, {
                    where: {id: req.body.id}
                })
                    .then(function (result) {
                        console.log(result);
                        return res.json(result);
                    }).catch(function (err) {
                        Logs.LogError('Error updating sub' + err);
                        return (res.status(500).json({'Error': 'Cannot update sub'}));
                    });
    }
};


