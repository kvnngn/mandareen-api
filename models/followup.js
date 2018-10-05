'use strict';
module.exports = (sequelize, DataTypes) => {
  var Followup = sequelize.define('followup', {
    cares_id: DataTypes.INTEGER,
    pro_id: DataTypes.INTEGER,
    patient_id: DataTypes.INTEGER,
    status: DataTypes.ENUM('Accepted', 'Refused', 'Notification sent')
  }, {freezeTableName: true,
    timestamps: false});
  Followup.associate = function(models) {
    // associations can be defined here
  };
  return Followup;
};