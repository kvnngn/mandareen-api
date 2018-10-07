const router = require("express").Router();
const adminController = require("./tools.admin.controller");

router.route("/admin/logs/:date").get(adminController.getLogs);
module.exports = router;
