'use strict';
module.exports = (sequelize, DataTypes) => {
  var Subscription = sequelize.define('subscription', {
    name: DataTypes.STRING(50),
    price: DataTypes.DECIMAL,
    max_patients: DataTypes.INTEGER
  }, {freezeTableName: true,
    timestamps: false});
  Subscription.associate = function(models) {
  };
  return Subscription;
};