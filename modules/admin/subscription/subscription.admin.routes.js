const router = require("express").Router();
const adminController = require("./subscription.admin.controller");

router.route("/admin/allsubs/:filter").get(adminController.getAllSubsFilter);
router.route("/admin/allsubs/").get(adminController.getAllSubs);
router.route("/admin/tooglesub/").post(adminController.ToogleSub);

module.exports = router;
