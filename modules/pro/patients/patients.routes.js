const router = require("express").Router();
const proController = require("./patients.controller");

//patients
router.route("/pro/patients/proId/:id").get(proController.getPatientsByPro);
router.route("/pro/patient/create/").post(proController.addPatient);

module.exports = router;
