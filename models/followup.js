'use strict';
module.exports = (sequelize, DataTypes) => {
    var Followup = sequelize.define('followup', {
        cares_id: DataTypes.STRING(100),
        pro_id: DataTypes.STRING(100),
        patient_id: DataTypes.STRING(100),
        status: DataTypes.ENUM('Accepted', 'Refused', 'Notification sent')
    }, {
        freezeTableName: true,
        timestamps: false
    });
    Followup.associate = function(models) {
        Followup.belongsTo(models.Patient);
        Followup.belongsTo(models.Pro)
    };
    return Followup;
};