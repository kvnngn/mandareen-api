const router = require("express").Router();
const adminController = require("./admin.controller");

router.route("/admin/login/").post(adminController.adminLogin);
router.route("/admin/add/").post(adminController.addAdmin);
router.route("/admin/reset").post(adminController.resetPwd);
router.route("/admin/passwd").post(adminController.passwd);
router.route("/admin/data/").get(adminController.getAdminData);
router.route("/admin/allpro/").get(adminController.getAllPro);
module.exports = router;
