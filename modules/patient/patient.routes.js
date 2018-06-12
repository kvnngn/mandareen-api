const router = require("express").Router();
const patientController = require("./patient.controller");

router.route("/patient/login/").post(patientController.login);
router.route("/patient/diary/").post(patientController.create);
router.route("/patients/account/patients/:id").get(patientController.findById);
router.route("/patient/diaries/:id").get(patientController.getAllPatientDiaries);

module.exports = router;
