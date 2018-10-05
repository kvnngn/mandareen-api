const router = require("express").Router();
const proController = require("./auth.controller");

router.route("/pro/auth/login/").post(proController.login);
router.route("/pro/auth/register/").post(proController.register);

module.exports = router;
