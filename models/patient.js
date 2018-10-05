'use strict';
const debug = require("debug")("app:models:patient");
const bcrypt = require("bcrypt");

module.exports = (sequelize, DataTypes) => {
    var Patient = sequelize.define('Patient', {
        email: DataTypes.STRING(100),
        pass: DataTypes.STRING(200),
        civ: DataTypes.ENUM('M', 'Mme'),
        firstname: DataTypes.STRING(100),
        lastname: DataTypes.STRING(100),
        birthdate: DataTypes.DATEONLY
    }, {
        freezeTableName: true,
        timestamps: false
    });
    Patient.associate = function(models) {
        // associations can be defined here
    };

    Patient.prototype.resetPassword = function() {
        const characters = "1234567890";
        const length = 4;
        let newPassword = "";
        let self = this;
        for(let i = 0; i < length; i++) {
            newPassword += characters[Math.floor(Math.random() * characters.length)];
        }
        debug("reset password", this.email, newPassword);

        bcrypt.hash(newPassword, 5, function(err, bcryptedPassword) {
            return self.update({pass: bcryptedPassword})
        });
        return newPassword;
    };

    return Patient;
};