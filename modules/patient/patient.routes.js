const router = require("express").Router();
const patientController = require("./patient.controller");

router.route("/patient/login/").post(patientController.patientLogin);
router.route("/patients/account/patients/").get(patientController.findAll);
router.route("/patients/account/patients/:id").get(patientController.findById);
router.route("/patients/account/reports/").get(patientController.findAll);

module.exports = router;
