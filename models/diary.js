'use strict';
module.exports = (sequelize, DataTypes) => {
  var Diary = sequelize.define('diary', {
    content: DataTypes.STRING(50),
    patient_id: DataTypes.STRING(100),
    mood_id: DataTypes.STRING(64)
  }, {freezeTableName: true,
    timestamps: false});
  Diary.associate = function(models) {
    // associations can be defined here
  };
  return Diary;
};