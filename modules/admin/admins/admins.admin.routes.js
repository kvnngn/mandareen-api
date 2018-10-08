const router = require("express").Router();
const adminController = require("./admins.admin.controller");

router.route("/admin/data/").get(adminController.getAdminData);

router.route("/admin/alladmin/").get(adminController.getAllAdmins);

module.exports = router;
