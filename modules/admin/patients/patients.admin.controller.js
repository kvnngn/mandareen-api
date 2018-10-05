var jwtUtils = require('../../../utils/jwt.utils')
var models = require("../../../models/index")

//routes
module.exports = {
    getAllPatient: function(req, res){
        console.log('getAllPatient');
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0)
            return res.status(401).json({'error': 'wrong token'});

        models.Patient.findAll({
            attributes: ['id', 'civ', 'firstname', 'lastname']
        }).then(function(pros) {
            if(pros) {
				console.log("OK");
                return res.status(200).json(pros);
            }
            else {
				console.log("NOPE");
                return res.status(404).json({'error': 'Patient not found'});
            }
        }).catch(function(err) {
			console.log("Error:" + err.toString());
            return res.status(500).json({'error': 'cannot fetch patient data'});
        });
    },
};
