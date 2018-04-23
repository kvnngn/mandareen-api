var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils')
var models = require("../../models/index")

//routes
module.exports = {
    adminLogin: function(req, res) {
        var login = req.body.login;
        var password = req.body.password;

        if(login == null || password == null) {
            return res.status(400).json({'error': 'missing parameters'});
        }

        models.Admin.findOne({
            attributes: ['id', 'pass'],
            where: {login: login}
        })
        .then(function(adminFound) {
            if(adminFound) {
                bcrypt.compare(password, adminFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        return res.status(200).json({
                            'token': jwtUtils.generateTokenForAdmin(adminFound)
                        });
                    }
                    else {
                        return res.status(403).json({"error": "invalid password"});
                    }
                });
            }
            else {
                return res.status(404).json({'error': 'admin not exist in DB'});
            }
        })
        .catch(function(err) {
            return res.status(500).json({'error': 'unable to verify admin'});
        });
    },
    getAdminData: function(req, res) {
        console.log('getAdminData');
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth);

        if(adminId < 0)
            return res.status(400).json({'error': 'wrong token'});

        models.Admin.findOne({
            attributes: ['id', 'login', 'firstname', 'lastname', 'type'],
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
    addAdmin: function(req, res) {
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth);
        var Newlogin = req.body.login;
        var password = req.body.password;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var type = req.body.type;

        if(Newlogin == null || password == null || firstname == null || lastname == null || type == null) {
            return res.status(400).json({'error': 'missing paramaters'});
        }
        if(adminId < 0)
            return res.status(400).json({'error': 'wrong token'});

        models.Admin.findOne({
            attributes: ['id', 'login', 'type'],
            where: {id: adminId}
        }).then(function(admin) {
            if(admin && admin.type == "Super-Admin") {
                models.Admin.findOne({
                    attributes: ['id'],
                    where: {login: Newlogin}
                }).then(function(already) {
                    if(already)
                        return res.status().json({'error': 'admin already exist'});
                    else {
                        bcrypt.hash(password, 5, function(err, bcryptedPassword) {
                            var newAdmin = models.Admin.create({
                                login: Newlogin,
                                pass: bcryptedPassword,
                                firstname: firstname,
                                lastname: lastname,
                                type: type
                            })
                            .then(function(newAdmin) {
                                return res.status(201).json({'adminId': newAdmin.id})
                            })
                            .catch(function(err) {
                                console.log('Error add admin');
                                console.log('Log : ' + err)
                                return (res.status(500).json({'error': 'cannot add admin'}));
                            });
                        });
                    }
                })
            }
            else {
                return res.status(404).json({'error': 'admin not found'});
            }
        }).catch(function(err) {
            console.log('Log: ' + err);
            return res.status(500).json({'error': 'cannot fetch admin data'});
        });
    }
};