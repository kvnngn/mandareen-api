'use strict';
const debug = require("debug")("app:models:patient");
const bcrypt = require("bcrypt");

module.exports = (sequelize, DataTypes) => {
    var Device = sequelize.define('Device', {
        token: DataTypes.STRING(200),
        platform: DataTypes.STRING(200),
        manufacturer: DataTypes.STRING(200),
        model: DataTypes.STRING(200),
        uuid: DataTypes.STRING(45),
        pro_id: DataTypes.INTEGER,
        app_version: DataTypes.STRING(200),
    }, {
        freezeTableName: true,
        timestamps: false
    });
    Device.associate = function(models) {
        models.Report_pro.belongsTo(models.Patient, {
            foreingKey: {
                allowNull: false
            }
        });
        // associations can be defined here
    };

    return Device;
};