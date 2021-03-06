'use strict';
module.exports = (sequelize, DataTypes) => {
  var Admin = sequelize.define('admin', {
    login: DataTypes.STRING(20),
    pass: DataTypes.STRING(200),
    email: DataTypes.STRING(100),
    firstname: DataTypes.STRING(100),
    lastname: DataTypes.STRING(100),
    type: DataTypes.ENUM('Commercial', 'Admin', 'Super-Admin')
  }, {freezeTableName: true,
    timestamps: false});
  Admin.associate = function(models) {
    // associations can be defined here
  };
  return Admin;
};