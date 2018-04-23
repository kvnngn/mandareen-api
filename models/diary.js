'use strict';
module.exports = (sequelize, DataTypes) => {
  var Diary = sequelize.define('Diary', {
    content: DataTypes.STRING(50),
    patient_id: DataTypes.INTEGER
  }, {freezeTableName: true,
    timestamps: false});
  Diary.associate = function(models) {
    // associations can be defined here
  };
  return Diary;
};