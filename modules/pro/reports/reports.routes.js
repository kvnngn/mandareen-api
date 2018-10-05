const router = require("express").Router();
const proController = require("./reports.controller");

//reports
router.route("/pro/reports/").get(proController.getReportsByPro);

module.exports = router;
