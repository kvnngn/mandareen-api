const router = require("express").Router();
const proController = require("./pro.controller");

router.route("/pro/login/").post(proController.login);
router.route("/pro/register/").post(proController.register);

module.exports = router;
