var bcrypt = require("bcrypt");
var jwtUtils = require('../../../utils/jwt.utils');
var models = require("../../../models/index");
const debug = require("debug")("app:patients.controller");

//routes
module.exports = {
    getFollowupsByPro: function(req, res, next) {
        debug("getFollowupsByPro");

        let followups = [];

        return Promise.resolve()
        .then(findFollowupLinkedToPro)
        .then(() => {res.json(followups)})
        .catch(next);


        function findFollowupLinkedToPro() {
            return models.Followup.findAll({
                where: {pro_id: req.params.id},
                include: [{
                    model: models.Patient,
                    attributes: {exclude: ['password']}
                }]
            })
            .then(function(_followups) {followups = _followups;})
        }
    }
};