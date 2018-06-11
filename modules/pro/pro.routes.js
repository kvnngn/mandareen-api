const router = require("express").Router();
const proController = require("./pro.controller");

router.route("/pro/auth/login/").post(proController.login);
router.route("/pro/auth/register/").post(proController.register);

//patients
router.route("/pro/account/patients/proId/:id").get(proController.getPatientsByPro);

//reports
router.route("/pro/account/reports/").get(proController.getReportsByPro);


module.exports = router;
