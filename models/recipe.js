'use strict';
module.exports = (sequelize, DataTypes) => {
  var Recipe = sequelize.define('Recipe', {
    name: DataTypes.STRING(255),
    nb_cal: DataTypes.INTEGER,
    ingredients: DataTypes.STRING(255),
    description: DataTypes.STRING(2048)
  }, {freezeTableName: true,
    timestamps: false});
  Recipe.associate = function(models) {
    // associations can be defined here
  };
  return Recipe;
};