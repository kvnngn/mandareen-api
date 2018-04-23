const router = require("express").Router();
const adminController = require("./admin.controller");

router.route("/admin/login/").post(adminController.adminLogin);
router.route("/admin/add/").post(adminController.addAdmin);
router.route("/admin/data/").get(adminController.getAdminData);
module.exports = router;
