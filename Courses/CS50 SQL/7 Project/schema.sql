-- Database created, during creation when testing required am dropping on creation of database
-- Written for local MySQL server
DROP DATABASE IF EXISTS benefit;
CREATE DATABASE benefit;
USE benefit;

-- Table for definining what benefit payment is
CREATE TABLE IF NOT EXISTS `benefit`
	(
    `benefit_id` VARCHAR(3),
    `benefit_name` VARCHAR(25),
    `payment` SMALLINT,
    PRIMARY KEY(`benefit_id`)
    );

-- Table for beneficiary details
CREATE TABLE IF NOT EXISTS `beneficiary`
	(
    `client_number` INT,
    `first_name` VARCHAR(30) NOT NULL,
	`last_name` VARCHAR(30) NOT NULL,
    `middle_name` VARCHAR(30),
    `sex` VARCHAR(10) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `ethnicity` VARCHAR(20),
    `street_address` VARCHAR(50) NOT NULL,
    `suburb` VARCHAR(30),
    `city` VARCHAR(30),
    `post_code` SMALLINT,
    `region` VARCHAR(20),
    `phone_number` INT NOT NULL,
    `email_address` VARCHAR(40),
    `login` VARCHAR(20) NOT NULL UNIQUE,
    `password` VARCHAR(20) NOT NULL,
    `benefit_id` VARCHAR(3) NOT NULL,
    `partner` INT,
    PRIMARY KEY(`client_number`),
    INDEX `index_client_number` (`client_number`)
    );

-- Had trouble updating `payments` on creation of data in beneficiary table in MySQL due to being unable to update table being referred to in FROM,
-- so have used a separate table to convert work into two steps
CREATE TABLE IF NOT EXISTS `paymentswork`
	(
    `client_number` INT,
    `benefit_id` VARCHAR(3),
    FOREIGN KEY(`client_number`) REFERENCES `beneficiary`(`client_number`)
    );

-- Where client payments are stored
CREATE TABLE IF NOT EXISTS `payments`
	(
    `client_number` INT UNIQUE,
    `benefit_id` VARCHAR(3),
    `benefit_payment` SMALLINT,
    FOREIGN KEY(`client_number`) REFERENCES `beneficiary`(`client_number`),
    FOREIGN KEY(`benefit_id`) REFERENCES `benefit`(`benefit_id`),
    INDEX `index_payment_client_number` (`client_number`)
    );

-- Where client partner relationships are stored
CREATE TABLE IF NOT EXISTS `partner`
	(
    `partner_1_ID` INT,
    `partner_2_ID` INT,
	FOREIGN KEY(`partner_1_ID`) REFERENCES `beneficiary`(`client_number`),
    FOREIGN KEY(`partner_2_ID`) REFERENCES `beneficiary`(`client_number`),
    );

-- Create a view that shows demographics with identifying data removed
CREATE VIEW `demographics` AS
	(
    SELECT
    `sex`,
    TIMESTAMPDIFF(YEAR,`date_of_birth`, CURDATE()) AS `age`,
    `ethnicity`,
    `city`,
    `post_code`,
    `region`
    FROM `beneficiary`
    );

-- On adding records to the beneficiary table, a trigger is used to update the payments table
DELIMITER $$
CREATE TRIGGER `registerpayment`
AFTER INSERT ON `beneficiary`
FOR EACH ROW
BEGIN

	INSERT INTO `paymentswork`(`client_number`, `benefit_id`) SELECT NEW.`client_number`, NEW.`benefit_id`;

				REPLACE INTO `payments`(`client_number`, `benefit_id`, `benefit_payment`)
                SELECT `paymentswork`.`client_number`, `paymentswork`.`benefit_id`, `payment`
                FROM `benefit`
				JOIN `paymentswork` ON `benefit`.`benefit_id` = `paymentswork`.`benefit_id`
				WHERE `benefit`.`benefit_id` = `paymentswork`.`benefit_id`;

END$$
DELIMITER ;

-- On updating records on beneficiary table, a trigger is used to update the payments table
DELIMITER $$
CREATE TRIGGER `updatepayment`
AFTER UPDATE ON `beneficiary`
FOR EACH ROW
BEGIN

	INSERT INTO `paymentswork`(`client_number`, `benefit_id`) SELECT NEW.`client_number`, NEW.`benefit_id`;

				REPLACE INTO `payments`(`client_number`, `benefit_id`, `benefit_payment`)
                SELECT `paymentswork`.`client_number`, `paymentswork`.`benefit_id`, `payment`
                FROM `benefit`
				JOIN `paymentswork` ON `benefit`.`benefit_id` = `paymentswork`.`benefit_id`
				WHERE `benefit`.`benefit_id` = `paymentswork`.`benefit_id`;

END$$
DELIMITER ;

-- On adding partners, a trigger is used to update the beneficiary table records for both clients to reflect relationship
DELIMITER $$
CREATE TRIGGER `partneradd`
AFTER INSERT ON `partner`
FOR EACH ROW
BEGIN
	UPDATE `beneficiary`
		SET `partner` = NEW.`partner_2_ID`
        WHERE `client_number` = NEW.`partner_1_ID`;
    UPDATE `beneficiary`
		SET `partner` = NEW.`partner_1_ID`
        WHERE `client_number` = NEW.`partner_2_ID`;
END$$
DELIMITER;
