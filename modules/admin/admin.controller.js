var bcrypt = require("bcrypt");
var jwtUtils = require('../../utils/jwt.utils')
var models = require("../../models/index")
var mailer = require("nodemailer");

//routes
module.exports = {
    adminLogin: function(req, res) {
        var login = req.body.login;
        var password = req.body.password;

        if(login == null || password == null) {
            return res.status(401).json({'error': 'missing parameters'});
        }

        models.Admin.findOne({
            attributes: ['id', 'login', 'pass', 'type'],
            where: {login: login}
        })
        .then(function(adminFound) {
            if(adminFound) {
                bcrypt.compare(password, adminFound.pass, function(errBycrypt, resBycrypt) {
                    if(resBycrypt) {
                        return res.status(200).json({
                            'token': jwtUtils.generateTokenForAdmin(adminFound),
                            'right': adminFound.type
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
    addAdmin: function(req, res) {
        var headerAuth = req.headers['authorization'];
        
        console.log("addAdmin");
        var adminId = jwtUtils.getAdminId(headerAuth, 1);
        var Newlogin = req.body.login;
        var password = req.body.password;
        var firstname = req.body.firstname;
        var lastname = req.body.lastname;
        var email = req.body.email;
        var type = req.body.type;
        if(Newlogin == null || password == null || firstname == null || lastname == null || type == null || email == null) {
            return res.status(400).json({'error': 'missing paramaters'});
        }
        if(adminId < 0)
            return res.status(401).json({'error': 'wrong token'});

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
                        return res.status(409).json({'error': 'admin already exist'});
                    else {
                        bcrypt.hash(password, 5, function(err, bcryptedPassword) {
                            var newAdmin = models.Admin.create({
                                login: Newlogin,
                                pass: bcryptedPassword,
                                firstname: firstname,
                                lastname: lastname,
                                email: email,
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
                return res.status(404).json({'error': 'super-admin not found'});
            }
        }).catch(function(err) {
            console.log('Log: ' + err);
            return res.status(500).json({'error': 'cannot fetch admin data'});
        });
    },
    resetPwd: function(req, res) {
        var login = req.body.login;
        var state = "err";

        if(login == null) {
            return res.status(400).json({'error': 'missing parameters'});
        }
        models.Admin.findOne({
            attributes: ['id', 'login', 'email'],
            where: {login: login}
        })
        .then(function(adminFound) {
            if(adminFound) {
                var mailTo = adminFound.email;
                var transporter = mailer.createTransport({
                    service: 'Gmail',
                    auth: {
                        user: 'contact.mandareen@gmail.com',
                        pass: '20ManDa1reEn8'
                    },
                    tls: {
                        rejectUnauthorized: false
                    }
                });
                var mail = {
                    from: "contact.mandareen@gmail.com",
                    to: mailTo,
                    subject: "[No-Reply] Changement de mot de passe - Mandareen admin",
                    html: "<p>Bonjour " + login + ",</p>" + 
                    "<p>Une demande de mot de passe viens d'être effectuée pour votre compte administrateur de mandareen.</p>" +
                    "<p>Cliquez sur ce lien pour changer votre mot de passe :" + "http://localhost:4242/passwd?dt=" + jwtUtils.generateTokenForPasswdAdmin(adminFound) +
                    "<br><p>Ce lien n'est valable que pendant 10 minutes</p>" +
                    "<p> Si vous n'avez pas demandé cet email, veuillez l'ignorer et le supprimer"
                }
                transporter.sendMail(mail, function(error, response) {
                    if (error) {
                        console.log("Mail error (resetPwd): " + error);
                        state = "err";
                        return res.status(500).json({"error": "Send mail failed"});
                    }
                    else {
                        state = "ok"
                        return res.status(200).json({'message': "email send"});
                    }
                })
                }
            else {
                return res.status(404).json({'error': 'admin not exist in DB'});
            }
        })
        .catch(function(err) {
            return res.status(500).json({'error': 'unable to verify admin'});
        });
    },
    passwd: function(req, res) {
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 0);
        var newPwd = req.body.newPwd;
        console.log(adminId);

        if(adminId < 0)
            return res.status(401).json({'error': 'wrong token'});

        models.Admin.findOne({
            where: {id: adminId}
        }).then(function(admin) {
            if(admin) {
                bcrypt.hash(newPwd, 5, function(err, bcryptedPassword) {
                    admin.update({
                        pass: bcryptedPassword
                    }).then(() => {})
                });
                return res.status(200).json({'message': 'password changed'});
            }
        }).catch(function(err) {
            return res.status(500).json({'error': 'cannot change password'});
        });
    },

    //Pro related route
    getAllPro: function(req, res){
        console.log('getAllPro');
        var headerAuth = req.headers['authorization'];
        var adminId = jwtUtils.getAdminId(headerAuth, 1);

        if(adminId < 0)
            return res.status(401).json({'error': 'wrong token'});

        models.Pro.findAll({
            attributes: ['id', 'civ', 'firstname', 'lastname', 'type'],
            order: [
                ['type', 'DESC']
            ]
        }).then(function(pros) {
            if(pros) {
                return res.status(200).json(pros);
            }
            else {
                return res.status(404).json({'error': 'Pros not found'});
            }
        }).catch(function(err) {
            return res.status(500).json({'error': 'cannot fetch pro data'});
        });
    }
};