'use strict';
module.exports = (sequelize, DataTypes) => {
  var Pro = sequelize.define('pro', {
    email: DataTypes.STRING(100),
    pass: DataTypes.STRING(200),
    civ: DataTypes.ENUM('M', 'Mme'),
    firstname: DataTypes.STRING(100),
    lastname: DataTypes.STRING(100),
    city: DataTypes.STRING(150),
    zipcode: DataTypes.STRING(150),
    adeli: DataTypes.STRING(150),
    phone: DataTypes.STRING(15),
    type: DataTypes.ENUM('Vendeur de BK', 'Doctor'),
    subscription_id: DataTypes.INTEGER,
    start_sub_date: DataTypes.DATEONLY,
    end_sub_date: DataTypes.DATEONLY
  }, {freezeTableName: true,
    timestamps: false});
  Pro.associate = function(models) {
    models.Pro.hasMany(models.Report_pro);
  };
  return Pro;
};
