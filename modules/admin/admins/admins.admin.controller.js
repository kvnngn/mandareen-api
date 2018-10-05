var jwtUtils = require('../../../utils/jwt.utils')
var models = require("../../../models/index")

//routes
module.exports = {
    getAdminData: function(req, res) {
        console.log('getAdminData');
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0)
            return res.status(401).json({'error': 'wrong token'});

        models.Admin.findOne({
            attributes: ['id', 'login', 'firstname', 'lastname','email', 'type'],
            where: {id: adminId}
        }).then(function(admin) {
            if(admin) {
                return res.status(201).json(admin);
            }
            else {
                return res.status(404).json({'error': 'admin not found'});
            }
        }).catch(function(err) {
            return res.status(500).json({'error': 'cannot fetch admin data'});
        });
    },
};
