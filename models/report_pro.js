'use strict';
module.exports = (sequelize, DataTypes) => {
  var Report_pro = sequelize.define('report_pro', {
    content: DataTypes.STRING,
    patient_id: DataTypes.INTEGER,
    pro_id: DataTypes.INTEGER
  }, {freezeTableName: true,
    timestamps: false});
  Report_pro.associate = function(models) {
    // associations can be defined here
    models.Report_pro.belongsTo(models.Pro, {
      foreingKey: {
        allowNull: false
      }
    })
  };
  return Report_pro;
};