var jwt = require('jsonwebtoken');
var Logs = require('./file_log_system');

const JWT_SIGN_SECRET = "01sJdTjGxCh3Rf426e0AqPCSSZ4pLr73H6aqFpoYTgLT5ES1HxySYZnH0GKNg7YzxiNTDtWsI"

module.exports = {
    parseAuth: function(auth) {
        return (auth != null) ? auth.replace('Bearer ', '') : null;
    },
    // Pro part
    generateTokenForPro: function(proData){
        return jwt.sign({
            proId: proData.id
        },
        JWT_SIGN_SECRET,
        {  
            expiresIn: '12h'
        })
    },

    // Admin part
    generateTokenForAdmin: function(adminData){
        return jwt.sign({
            adminId: adminData.id,
            access: "full"
        },
        JWT_SIGN_SECRET,
        {  
            expiresIn: '1h'
        })
    },
    generateTokenForPasswdAdmin: function(adminData){
        return jwt.sign({
            adminId: adminData.id,
            access: "limited"
        },
        JWT_SIGN_SECRET,
        {  
            expiresIn: '10m'
        })
    },
    getAdminId:function(auth, secure) {
        var id = -1;
        var token = module.exports.parseAuth(auth);
        if (token != null)
        {
            try {
                var jwtToken = jwt.verify(token, JWT_SIGN_SECRET);
                if (jwtToken != null) {
                    if (secure == 1 && jwtToken.access == "limited")
                        id = -2;
                    else
                        id = jwtToken.adminId;
                }
            }
            catch(err) {
                Logs.LogError("Error getAdminId : " + err);
            }
        }
        return id;
    },

    // Patient part
    generateTokenForPatient: function(patientData){
        return jwt.sign({
            patientId: patientData.id,
        },
        JWT_SIGN_SECRET,
        {  
            expiresIn: '48h'
        })
    }
}