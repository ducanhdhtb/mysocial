SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fullname` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NULL ,
  `username` VARCHAR(255) NULL ,
  `phoneNumber` VARCHAR(255) NULL ,
  `presentAddress` VARCHAR(255) NULL ,
  `permanentAddress` VARCHAR(255) NULL ,
  `nidNumber` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`posts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `content` VARCHAR(45) NULL ,
  `checkIn` VARCHAR(45) NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL ,
  `users_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_posts_users_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gps`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`gps` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `latitude` VARCHAR(45) NULL ,
  `longtitude` VARCHAR(45) NULL ,
  `users_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_gps_users1_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_gps_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `content` VARCHAR(45) NULL ,
  `time` VARCHAR(45) NULL ,
  `users_id` INT NOT NULL ,
  `posts_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`, `users_id`, `posts_id`) ,
  INDEX `fk_comments_users1_idx` (`users_id` ASC) ,
  INDEX `fk_comments_posts1_idx` (`posts_id` ASC) ,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id` )
    REFERENCES `mydb`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`commentLikes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`commentLikes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT NOT NULL ,
  `comments_id` INT NOT NULL ,
  `comments_users_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `comments_id`, `comments_users_id`) ,
  INDEX `fk_commentLikes_users1_idx` (`users_id` ASC) ,
  INDEX `fk_commentLikes_comments1_idx` (`comments_id` ASC, `comments_users_id` ASC) ,
  CONSTRAINT `fk_commentLikes_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commentLikes_comments1`
    FOREIGN KEY (`comments_id` , `comments_users_id` )
    REFERENCES `mydb`.`comments` (`id` , `users_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`pages` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL ,
  `introduction` VARCHAR(45) NULL ,
  `users_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `users_id`) ,
  INDEX `fk_pages_users1_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_pages_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pageposts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`pageposts` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `content` VARCHAR(45) NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL ,
  `pages_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `pages_id`) ,
  INDEX `fk_pageposts_pages1_idx` (`pages_id` ASC) ,
  CONSTRAINT `fk_pageposts_pages1`
    FOREIGN KEY (`pages_id` )
    REFERENCES `mydb`.`pages` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pageLikes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`pageLikes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `time` TIME NULL ,
  `users_id` INT NOT NULL ,
  `pages_id` INT NOT NULL ,
  `pages_users_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `users_id`, `pages_id`, `pages_users_id`) ,
  INDEX `fk_pageLikes_users1_idx` (`users_id` ASC) ,
  INDEX `fk_pageLikes_pages1_idx` (`pages_id` ASC, `pages_users_id` ASC) ,
  CONSTRAINT `fk_pageLikes_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pageLikes_pages1`
    FOREIGN KEY (`pages_id` , `pages_users_id` )
    REFERENCES `mydb`.`pages` (`id` , `users_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`friends`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`friends` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `time` VARCHAR(45) NULL ,
  `users_id` INT NOT NULL ,
  `status` INT NULL ,
  `friendsOf` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`, `users_id`) ,
  INDEX `fk_friends_users1_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_friends_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`followers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`followers` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `follower` VARCHAR(45) NULL ,
  `followered` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`foridden`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`foridden` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `blocker` VARCHAR(45) NULL ,
  `blocked person` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`emotions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`emotions` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT NOT NULL ,
  `posts_id` INT UNSIGNED NOT NULL ,
  `emotionStatus` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`, `users_id`, `posts_id`) ,
  INDEX `fk_emotions_users1_idx` (`users_id` ASC) ,
  INDEX `fk_emotions_posts1_idx` (`posts_id` ASC) ,
  CONSTRAINT `fk_emotions_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emotions_posts1`
    FOREIGN KEY (`posts_id` )
    REFERENCES `mydb`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`emotionStatus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`emotionStatus` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sad` INT NULL DEFAULT 1 ,
  `happy` INT NULL DEFAULT 2 ,
  `angry` INT NULL DEFAULT 3 ,
  `inlove` INT NULL DEFAULT 4 ,
  `haha` INT NULL DEFAULT 5 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`chat`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`chat` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `chatter` INT NULL ,
  `chatted` INT NULL ,
  `content` VARCHAR(425) NULL ,
  `time` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pageSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`pageSetup` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `statusPage` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sharePost`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`sharePost` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`postConfigs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`postConfigs` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `posts_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`, `posts_id`) ,
  INDEX `fk_postConfigs_posts1_idx` (`posts_id` ASC) ,
  CONSTRAINT `fk_postConfigs_posts1`
    FOREIGN KEY (`posts_id` )
    REFERENCES `mydb`.`posts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`visible`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`visible` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `everyone` INT NULL DEFAULT 1 ,
  `onlyme` INT NULL DEFAULT 2 ,
  `friend` INT NULL DEFAULT 3 ,
  `friendConfig` VARCHAR(45) NULL ,
  `postConfigs_id` INT NOT NULL ,
  `postConfigs_posts_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_visible_postConfigs1_idx` (`postConfigs_id` ASC, `postConfigs_posts_id` ASC) ,
  CONSTRAINT `fk_visible_postConfigs1`
    FOREIGN KEY (`postConfigs_id` , `postConfigs_posts_id` )
    REFERENCES `mydb`.`postConfigs` (`id` , `posts_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
