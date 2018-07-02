const router = require("express").Router();
const proController = require("./pro.controller");

router.route("/pro/auth/login/").post(proController.login);
    router.route("/pro/account").put(proController.update);
    router.route("/pro/account/email").put(proController.updateEmail);
    router.route("/pro/account/password").put(proController.updatePassword);
router.route("/pro/auth/register/").post(proController.register);
router.route("/pro/patient/create/").post(proController.addPatient);

//patients
router.route("/pro/account/patients/proId/:id").get(proController.getPatientsByPro);

//reports
router.route("/pro/account/reports/").get(proController.getReportsByPro);


module.exports = router;
