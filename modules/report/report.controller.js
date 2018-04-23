var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils');
var models = require("../../models/index");

//routes
module.exports = {
    findAll: function(req, res, next) {
        console.log("findAll");
        return models.Report_pro.findAll()
        .then(function(reports) { return res.json(reports); })
        .catch(next);
    }
};