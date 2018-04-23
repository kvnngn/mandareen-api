'use strict';
module.exports = (sequelize, DataTypes) => {
  var Care = sequelize.define('Care', {
    sickness_name: DataTypes.STRING(100)
  }, {timestamps: false});
  Care.associate = function(models) {
    // associations can be defined here
  };
  return Care;
};