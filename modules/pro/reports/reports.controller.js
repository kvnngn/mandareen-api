var bcrypt = require("bcrypt");
var jwtUtils = require('../../../utils/jwt.utils');
var models = require("../../../models/index");
const debug = require("debug")("app:reports.controller");

//routes
module.exports = {
    getReportsByPro: function(req, res, next) {
        debug("getReportsByPro");

        return models.Report_pro.findAll({where: {pro_id: req.params.id}})
        .then(function(reports) { return res.json(reports); })
        .catch(next);
    }
};