'use strict';
const debug = require("debug")("app:models:patient");
const bcrypt = require("bcrypt");
const oneSignal = require("../libs/oneSignal");

module.exports = (sequelize, DataTypes) => {
    var Patient = sequelize.define('patient', {
        email: DataTypes.STRING(100),
        pass: DataTypes.STRING(200),
        civ: DataTypes.ENUM('M', 'Mme'),
        firstname: DataTypes.STRING(100),
        lastname: DataTypes.STRING(100),
        birthdate: DataTypes.DATEONLY,
    }, {
        freezeTableName: true,
        timestamps: false
    });
    Patient.associate = function(models) {
        models.Report_pro.belongsTo(models.Patient, {
            foreingKey: {
                allowNull: false
            }
        });
        Patient.hasMany(models.Device)
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

    Patient.prototype.sendNotification = function(notification) {
        const self = this;
        return this.getDevices({attributes: ["uuid"]})
            .then(function(devices) {
                if(devices.length === 0) { return; }
                notification.tokens = devices.map(function(device) { return device.uuid; });
                return oneSignal.sendNotification(notification);
            })
            .then(function() { return {id: self.id, success: true}; })
            .catch(function(err) {
                debug("notification err", err);
                return {id: self.id, success: false, err: err};
            });
    };
    return Patient;
};