DELIMITER $$
CREATE TRIGGER admin_id_insert
BEFORE INSERT ON admin
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER pro_id_insert
BEFORE INSERT ON pro
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER cares_id_insert
BEFORE INSERT ON cares
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER devices_id_insert
BEFORE INSERT ON devices
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER diary_id_insert
BEFORE INSERT ON diary
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER followup_id_insert
BEFORE INSERT ON followup
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END;

DELIMITER $$
CREATE TRIGGER mood_id_insert
BEFORE INSERT ON mood
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER patient_id_insert
BEFORE INSERT ON patient
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER recipes_id_insert
BEFORE INSERT ON recipes
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER report_pro_id_insert
BEFORE INSERT ON report_pro
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER stats_id_insert
BEFORE INSERT ON stats
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER subscription_id_insert
BEFORE INSERT ON subscription
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER subs_pro_id_insert
BEFORE INSERT ON subs_pro
FOR EACH ROW
BEGIN
SET `NEW`.`id` = UUID();
END$$
DELIMITER ;