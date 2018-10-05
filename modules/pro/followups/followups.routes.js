const router = require("express").Router();
const proController = require("./followups.controller");

//patients
router.route("/pro/followups/proId/:id").get(proController.getFollowupsByPro);

module.exports = router;
