
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `HOPECENTERUTAH`;

CREATE SCHEMA IF NOT EXISTS `HOPECENTERUTAH` DEFAULT CHARACTER SET latin1;
USE `HOPECENTERUTAH`;

DROP TABLE IF EXISTS `HOPECENTERUTAH`.`User`;
CREATE TABLE `HOPECENTERUTAH`.`User` (
  `user_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NULL,
  `user_email` VARCHAR(75) NOT NULL,
  `user_type` ENUM('SU','AD','VT','RG') NOT NULL,
  `user_pass` VARCHAR(45) NOT NULL,
  `user_address1` VARCHAR(45) NULL,
  `user_address2` VARCHAR(45) NULL,
  `user_phone` CHAR(10) NULL,
  `user_zip` CHAR(5) NULL,
  `user_country` VARCHAR(45) NULL,
  `user_city` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC));

DROP TABLE IF EXISTS `HOPECENTERUTAH`.`ItemDonation`;
CREATE TABLE `HOPECENTERUTAH`.`ItemDonation` (
  `item_donation_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NULL,
  `item_donation_date` DATETIME NOT NULL,
  `item_donation_quantity` INT(5) NOT NULL,
  `item_donation_description` TEXT(100) NULL,
  `item_donation_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_donation_id`),
  INDEX `user_idFK` (`user_id` ASC),
  CONSTRAINT `user_idDONFK`
    FOREIGN KEY (`user_id`)
    REFERENCES `HOPECENTERUTAH`.`User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `HOPECENTERUTAH`.`PayPalDonations`;
CREATE TABLE `HOPECENTERUTAH`.`PayPalDonations` (
  `pay_id` INT(10) NOT NULL,
  `user_id` INT(10) NOT NULL,
  `pay_date` DATETIME NOT NULL,
  `pay_amount` DECIMAL(10) NULL,
  `pay_receipt` BINARY(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pay_id`),
  UNIQUE INDEX `pay_id_UNIQUE` (`pay_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `user_idPAYFK`
    FOREIGN KEY (`user_id`)
    REFERENCES `HOPECENTERUTAH`.`User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `HOPECENTERUTAH`.`Event`;
CREATE TABLE `HOPECENTERUTAH`.`Event` (
  `event_id` INT(10) NOT NULL AUTO_INCREMENT,
  `event_title` VARCHAR(45) NOT NULL,
  `event_description` TEXT(500) NULL,
  `event_date` DATETIME NOT NULL,
  `event_image` LONGBLOB NULL,
  PRIMARY KEY (`event_id`));

DROP TABLE IF EXISTS `HOPECENTERUTAH`.`RSVP`;
CREATE TABLE `HOPECENTERUTAH`.`RSVP` (
  `rsvp_id` INT(10) NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) NULL,
  `event_id` INT(10) NULL,
  PRIMARY KEY (`rsvp_id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `event_id_idx` (`event_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `HOPECENTERUTAH`.`User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `HOPECENTERUTAH`.`Event` (`event_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);