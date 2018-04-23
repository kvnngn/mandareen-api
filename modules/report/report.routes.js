const router = require("express").Router();
const reportController = require("./report.controller");

router.route("/reports/").get(reportController.findAll);

module.exports = router;
