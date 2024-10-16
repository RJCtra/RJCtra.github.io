-- Inserting benefit payment details
INSERT INTO `benefit` (`benefit_id`, `benefit_name`, `payment`)
	VALUES ('UB', 'Unemployment Benefit', 250),('SB', 'Sickness Benefit', 300), ('SPB', 'Single Parent Benefit', 300), ('NB', 'No Benefit', 0);

-- Importing data to populate beneficiaries table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Data/benefitrecords.csv'
INTO TABLE `beneficiary`
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(`client_number`,`first_name`,`last_name`,`middle_name`,`sex`,`date_of_birth`,`ethnicity`,`street_address`,`suburb`,`city`,`post_code`,`region`,`phone_number`,`email_address`,`login`,`password`,`benefit_id`,@dummy);

-- Select all clients details
SELECT * FROM `beneficiary`;

-- Select all from demographics (created to view distribution of demographics without excessive personal details being divulged)
SELECT * FROM `demographics`;

-- Count number of each ethnicity in demographics view
SELECT `ethnicity`, COUNT(`ethnicity`) FROM `demographics` GROUP BY `ethnicity`;

-- Select client with specific client number
SELECT * FROM `beneficiary`
WHERE `client_number` = 445924132;

-- Select clients who are female and were born before 1990-01-01
SELECT * FROM `beneficiary`
WHERE `sex` = 'female' AND `date_of_birth` < '1990-01-01';

-- Adding new client record into beneficiary table
INSERT INTO `beneficiary` (`client_number`,`first_name`,`last_name`,`middle_name`,`sex`,`date_of_birth`,`ethnicity`,`street_address`,`suburb`,`city`,`post_code`,`region`,`phone_number`,`email_address`,`login`,`password`,`benefit_id`)
	VALUES (905198234,'Frank','Otero','Brian','male','1988-05-06','Maori','140 Tower Way','Khandallah','Wellington',6035,'Wellington','0281456123','FrankOtero@example.com','Fotero002','professorx82','UB');

-- Adding partner relationship to partner table, this triggers both beneficiary tables to update
INSERT INTO `partner`(`partner_1_ID`,`partner_2_ID`) VALUES (905198234, 906192856);

-- Select clients whose relationship has been updated
SELECT * FROM `beneficiary`
WHERE `client_number` IN ('905198234', '906192856');

-- Select partner table
SELECT * FROM `partner`;

-- Check payments for all clients
SELECT * FROM `payments`;

-- Change benefit a client receives
UPDATE `beneficiary` SET `benefit_id` = 'UB' WHERE `client_number` = 311456499;

-- Confirm change has been made
SELECT * FROM `payments` WHERE `client_number` = 311456499;
