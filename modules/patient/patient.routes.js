const router = require("express").Router();
const patientController = require("./patient.controller");

router.route("/patient/login/").post(patientController.login);
router.route("/patient/diary/").post(patientController.create);
router.route("/patients/account/patients/:id").get(patientController.findById);
router.route("/patient/diaries/:id").get(patientController.getAllPatientDiaries);
router.route("/patient/recipesNames/").get(patientController.getAllRecipesNames);
router.route("/patient/recipeDetails/:id").get(patientController.getRecipeDetails);
router.route("/patient/changeEmail/").post(patientController.changeEmail);

module.exports = router;
