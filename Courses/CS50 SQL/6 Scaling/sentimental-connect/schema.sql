CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `schools` (
    `id` INTEGER AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `type` ENUM(`Primary`,`Secondary`,`Higher Education`),
    `location` VARCHAR(50),
    `year_founded` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `companies` (
    `id` INTEGER,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    `industry` ENUM(`Technology`,`Education`,`Business`)
    `location` VARCHAR(50)
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `people_connections` (
    `user_1` VARCHAR(32),
    `user_2` VARCHAR(32),
    FOREIGN KEY(`user_1`) REFERENCES `users`(`username`),
    FOREIGN KEY(`user_2`) REFERENCES `users`(`username`)
);

CREATE TABLE `school_connections` (
    `username` VARCHAR(32),
    `school` VARCHAR(50),
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` ENUM(`BA`,`MA`,`PhD`,`Other`),
    FOREIGN KEY(`username`) REFERENCES `users`(`username`),
    FOREIGN KEY(`school`) REFERENCES `schools`(`id`)
);

CREATE TABLE `company_connections` (
    `username` VARCHAR(32),
    `company_name` VARCHAR(50),
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title_held` VARCHAR(50),
    FOREIGN KEY(`username`) REFERENCES `users`(`username`),
    FOREIGN KEY(`company_name`) REFERENCES `companies`(`name`)
);


`Year` YEAR,
`All cancers` INT,
`Lip, Oral Cavity and Pharynx` INT,
`Oesophagus` INT,
`Stomach` INT,
`Colorectum and anus` INT,
`Liver and intrahepatic bile ducts` INT,
`Pancreas` INT,
`Lung & Trachea` INT,
`Melanoma` INT,
`Prostate` INT,
`Testis` INT,
`Kidney and other urinary` INT,
`Bladder` INT,
`Brain` INT,
`Thyroid` INT,
`Hodgkin lymphoma` INT,
`Non-Hodgkin lymphoma` INT,
`Myeloma` INT,
`Leukaemia` INT,
PRIMARY KEY

