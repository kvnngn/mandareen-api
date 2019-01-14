const path = require("path");
const debug = require("debug")("app:libs:schedule");
const models = require(path.resolve("./models"));
const mail = require(path.resolve("./libs/mail"));
const config = require(path.resolve("./config"));
const moment = require("moment");
const schedule = require("node-schedule");
const oneSignal = require(path.resolve("./libs/oneSignal"));

exports.run = function () {
    const EVERY_DAY_AT_9_AM = "0 0 9 * * *";

    new schedule.scheduleJob("sendNotificationsRateNightToUsers", EVERY_DAY_AT_9_AM, sendNotificationsRateNightToUsers);
    new schedule.scheduleJob("sendNotificationsRateNightToUsers", EVERY_DAY_AT_14_AM, sendNotificationsNoteLunchToUsers);
    new schedule.scheduleJob("sendNotificationsRateNightToUsers", EVERY_DAY_AT_21_AM, sendNotificationsNoteDinerToUsers);
};

function sendNotificationsRateNightToUsers() {
    debug("sendNotificationsToUsers");

    let devices = [];
    return Promise.resolve()
        .then(getDevices)
        .then(sendNotificationToDevices);

    function getDevices() {
        return models.Device.findAll()
            .then((_devices) => devices = _devices)
    }

    function sendNotificationToDevices() {
        console.log(devices);
        let tokens = devices.map((device) => device.uuid);
        const notification = {
            title: 'Il est essentiel de bien dormir pour rester en forme.',
            content: "Pensez à noter votre nombre d'heure de sommeil",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}
function sendNotificationsNoteLunchToUsers() {
    debug("sendNotificationsToUsers");

    let devices = [];
    return Promise.resolve()
        .then(getDevices)
        .then(sendNotificationToDevices);

    function getDevices() {
        return models.Device.findAll()
            .then((_devices) => devices = _devices)
    }

    function sendNotificationToDevices() {
        console.log(devices);
        let tokens = devices.map((device) => device.uuid);
        const notification = {
            title: 'Manger équilibré est essentiel pour votre santé.',
            content: "Pensez à noter votre déjeuner afin de ne pas faire d'écart !",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}
function sendNotificationsNoteDinerToUsers() {
    debug("sendNotificationsToUsers");

    let devices = [];
    return Promise.resolve()
        .then(getDevices)
        .then(sendNotificationToDevices);

    function getDevices() {
        return models.Device.findAll()
            .then((_devices) => devices = _devices)
    }

    function sendNotificationToDevices() {
        console.log(devices);
        let tokens = devices.map((device) => device.uuid);
        const notification = {
            title: 'Avez-vous bien mangé ?',
            content: "Pensez à noter votre dîner afin de ne pas faire d'écart !",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}
