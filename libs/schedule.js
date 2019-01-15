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
    const EVERY_DAY_AT_2_PM = "0 0 14 * * *";
    const EVERY_DAY_AT_9_PM = "0 0 21 * * *";
    const EVERY_DAY_AT_4_PM = "0 0 16 * * *";
    const test = "* * * * * *";

    new schedule.scheduleJob("sendNotificationsRateNightToUsers", EVERY_DAY_AT_9_AM, sendNotificationsRateNightToUsers);
    new schedule.scheduleJob("sendNotificationsNoteLunchToUsers", EVERY_DAY_AT_2_PM, sendNotificationsNoteLunchToUsers);
    new schedule.scheduleJob("sendNotificationsNoteDinerToUsers", EVERY_DAY_AT_9_PM, sendNotificationsNoteDinerToUsers);
    new schedule.scheduleJob("sendNotificationsNoteSportToUsers", EVERY_DAY_AT_4_PM, sendNotificationsNoteSportToUsers);
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
        let tokens = devices.map((device) => device.uuid);
        const notification = {
            title: 'Il est essentiel de bien dormir pour rester en forme.',
            content: "Pensez à noter votre nombre d'heure de sommeil",
            type: "sommeil",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}
function sendNotificationsNoteLunchToUsers() {
    debug("sendNotificationsNoteLunchToUsers");

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
            type: "calorie",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}
function sendNotificationsNoteDinerToUsers() {
    debug("sendNotificationsNoteDinerToUsers");

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
            type: "calorie",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}

function sendNotificationsNoteSportToUsers() {
    debug("sendNotificationsNoteDinerToUsers");

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
            title: 'Pratiquer une activité sportive est important pour votre santé.',
            content: "Si oui, indiquez vous rapidement quel sport et son rythme.",
            type: "sport",
            tokens: tokens
        };
        return oneSignal.sendNotificationPrepared(notification);
    }
}
