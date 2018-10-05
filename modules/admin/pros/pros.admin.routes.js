const router = require("express").Router();
const adminController = require("./pros.admin.controller");

router.route("/admin/allpro/").get(adminController.getAllPro);
module.exports = router;
