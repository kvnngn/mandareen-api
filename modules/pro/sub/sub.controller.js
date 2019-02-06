var bcrypt = require("bcrypt");
var jwtUtils = require('../../../utils/jwt.utils');
var models = require("../../../models/index");
const debug = require("debug")("app:sub.controller");
var Logs = require('../../../utils/file_log_system');
var moment = require('moment');

//routes
module.exports = {
    getCurrentSub: function(req, res, next) {
        debug("getCurrentSub");

        return models.Subs_pro.findOne(
            {
                where: {pro_id: req.params.id},
                attributes: ['sub_id', 'pending', 'date_sub_end']
            }
        )
        .then(function(CurrSub) {
            if (CurrSub) {
            models.Subscription.findOne({
                where: {id: CurrSub.sub_id},
                attributes: ['name', 'max_patients']
            })
            .then(function(Sub){
                Logs.LogSuccessIP(req, '200', 'Sub get processed');
                return res.status(200).json({'name': Sub.name, 'max_patients': Sub.max_patients, 'pending':CurrSub.pending, 'end':CurrSub.date_sub_end})
            })
            .catch(function(err) {
                Logs.LogError('500', "Sub get : " + err);
                return (res.status(500).json({'error': 'Sub get failed'}));
            });
        }
        else{
            Logs.LogError('404', "Sub: no sub for pro id");
            return (res.status(500).json({'error': 'Sub for pro id not found'}));
        }
        }
        )
    },
    postRequestSub: function(req, res, next) {
        debug("request sub");

        models.Pro.findOne({
            attributes: ['id'],
            where: {id: req.body.id}
        }).then(function(pro) {
                models.Subs_pro.findOne({
                    attributes: ['id'],
                    where: {pro_id: req.body.id}
                }).then(function(already) {
                    if(already){
                        Logs.LogErrorIP(req, '409', "Request Sub : Already exist");
                        return res.status(409).json({'error': 'sub already set, use replace instead'});
                    }
                    else {
                        models.Subscription.findOne({
                            attributes: ['id'],
                            where: {name: req.body.sub_name}
                        }).then(function(sub){
                            if (sub)
                            {
                                var NewSub = models.Subs_pro.create({
                                    pro_id: req.body.id,
                                    sub_id: sub.id,
                                    date_sub_start: moment().format("YYYY-MM-DD"),
                                    date_sub_end: moment().add(parseInt(req.body.duration), 'months').format("YYYY-MM-DD")
                                })
                                .then(function(NewSub) {
                                    Logs.LogSuccessIP(req, '200', 'Sub request processed');
                                    return res.status(200).json({'status': 'Sub request ok'})
                                })
                                .catch(function(err) {
                                    Logs.LogError('500', "Sub request : " + err);
                                    return (res.status(500).json({'error': 'Sub request failed'}));
                                });
                            }
                            else{
                                Logs.LogErrorIP(req, '404', "Request Sub : sub don't exist on db");
                                return res.status(409).json({'error': "Request Sub : sub don't exist on db"});
                            }
                        })
                    }
                })
            }
        ).catch(function(err) {
            Logs.LogError('500', "request sub : " + err);
            return res.status(500).json({'error': 'cannot request subscription'});
        });
    }

};