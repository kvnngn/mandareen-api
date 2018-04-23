'use strict';
module.exports = (sequelize, DataTypes) => {
  var Patient = sequelize.define('Patient', {
    email: DataTypes.STRING(100),
    pass: DataTypes.STRING(200),
    civ: DataTypes.ENUM('M', 'Mme'),
    firstname: DataTypes.STRING(100),
    lastname: DataTypes.STRING(100),
    birthdate: DataTypes.DATEONLY
  }, {freezeTableName: true,
    timestamps: false});
  Patient.associate = function(models) {
    // associations can be defined here
  };
  return Patient;
};