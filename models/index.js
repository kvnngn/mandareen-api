'use strict';

const debug = require("debug")("app:models:sequelize");
const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const env = process.env.NODE_ENV || "development";
const config = require("../config");


const models = {};
let sequelize = null;
initSequelize();
loadModels();
associateModels();

models.sequelize = sequelize;
models.Sequelize = Sequelize;
models.Op = Sequelize.Op;
module.exports = models;


function initSequelize() {
    const cls = require("continuation-local-storage");
    const namespace = cls.createNamespace("mandareen");
    Sequelize.useCLS(namespace);
    sequelize = new Sequelize(
        config.development.database,
        config.development.username,
        config.development.password,
        {
            dialect: config.development.dialect,
            define: {underscored: true},
            logging: config.development.logging,
            host: config.development.host,
            maxConcurrentQueries: config.development.connectionLimit
        }
    );
}

function loadModels() {
    models.Admin = sequelize["import"](path.join(__dirname, "./admin"));
    models.Care = sequelize["import"](path.join(__dirname, "./care"));
    models.Diary = sequelize["import"](path.join(__dirname, "./diary"));
    models.Followup = sequelize["import"](path.join(__dirname, "./followup"));
    models.Patient = sequelize["import"](path.join(__dirname, "./patient"));
    models.Pro= sequelize["import"](path.join(__dirname, "./pro"));
    models.Recipes= sequelize["import"](path.join(__dirname, "./recipes"));
    models.Report_pro= sequelize["import"](path.join(__dirname, "./report_pro"));
    models.Subscription= sequelize["import"](path.join(__dirname, "./subscription"));
}

function associateModels() {
    Object.keys(models).forEach(function(modelName) {
        if(models[modelName].associate) {
            models[modelName].associate(models);
        }
    });
}