const path = require("path");
const errors = require(path.resolve("./libs/errors"));
const models = require(path.resolve("./models"));
const debug = require("debug")("app:devices");


exports.register = function() {
    return function(req, res, next) {
        debug("registering device", req.body.uuid);
        return models.Device.findOrCreate({
            where: {uuid: req.body.uuid},
            defaults: req.body
        })
            .spread(function(device) {
                req.body.updated_at = models.sequelize.fn("NOW");
                device.changed('updated_at', true);
                return device.update(req.body);
            })
            .then(function() { return res.send("OK"); })
            .catch(next);
    };
};

exports.find = function() {
    return function(req, res, next) {
        debug("find Devices");

        let reqNbOfDevices = parseInt(req.params.nbOfDevices) || null;

        models.Device.findAll({
            limit: reqNbOfDevices,
            order: [
                ["updated_at", "DESC"],
                ["id", "ASC"]
            ],
            include: [{
                model: models.Pro,
                attributes: ["id", "lastname", "firstname"],
                required: false
            }]
        })
            .then(function(devices) { return res.json(devices); })
            .catch(next);
    };
};

exports.sendNotifications = function() {
    return function(req, res, next) {
        const notification = {
            ids: req.body.ids,
            title: req.body.title,
            message: req.body.message,
            store: req.body.store
        };
        push.send(notification)
            .then(function() { res.send("OK"); })
            .catch(function(err) { next(err); });
    };
};

exports.ping = function() {
    return function(req, res, next) {
        debug("pinging devices");

        let deviceIds = null;

        return Promise.resolve()
            .then(function() { return getAllDevicesIds(); })
            .then(function() { return sendSilentNotification(); })
            .then(function() { return res.send("OK"); })
            .catch(function(err) { next(err) });

        function getAllDevicesIds() {
            return models.Device.findAll({attributes: ["id"]})
                .then(function(devices) {
                    deviceIds = devices.map(function(device) { return device.id });
                });
        }

        function sendSilentNotification() {
            return push.send({
                ids: deviceIds,
                silent: 1
            });
        }
    };
};

exports.delete = function() {
    return function(req, res, next) {
        debug("deleteDevices");

        let devices;
        const reqDevicesIds = req.query.ids;

        return Promise.resolve()
            .then(fetchDevices)
            .then(deleteDevices)
            .then(() => res.send("OK"))
            .catch(next);

        function fetchDevices() {
            return models.Device.findAll({where: {id: reqDevicesIds}})
                .then(function(_devices) { devices = _devices; });
        }

        function deleteDevices() {
            const promises = [];
            devices.forEach((device) => promises.push(device.destroy()));
            return Promise.all(promises);
        }
    }
};

