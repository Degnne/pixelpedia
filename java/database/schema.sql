BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS vg_system;
DROP TABLE IF EXISTS vg_genre;
DROP TABLE IF EXISTS vg_studio;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS video_game;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS system;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE company (
	company_id SERIAL,
	company_name varchar(300) NOT NULL,
	CONSTRAINT PK_company PRIMARY KEY (company_id)
);

CREATE TABLE video_game (
	id SERIAL,
	title varchar(150) NOT NULL,
	release_date DATE,
	release_price MONEY,
	description TEXT,
	publisher_id INT,
	rating varchar(50),
	CONSTRAINT PK_video_game PRIMARY KEY (id),
	CONSTRAINT FK_publisher FOREIGN KEY (publisher_id) REFERENCES company (company_id)
);

CREATE TABLE system (
	system_id SERIAL,
	system_name varchar(250) NOT NULL,
	manufacturer_id INT,
	CONSTRAINT PK_system_id PRIMARY KEY (system_id),
	CONSTRAINT FK_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES company (company_id)
);

CREATE TABLE vg_system (
	vg_id INT,
	system_id INT,
	CONSTRAINT FK_video_game FOREIGN KEY (vg_id) REFERENCES video_game (id),
	CONSTRAINT FK_system FOREIGN KEY (system_id) REFERENCES system (system_id)
);

CREATE TABLE genre (
	genre_id SERIAL,
	genre_name varchar(250) NOT NULL,
	CONSTRAINT PK_genre_id PRIMARY KEY (genre_id)
);

CREATE TABLE vg_genre (
	vg_id INT,
	genre_id INT,
	CONSTRAINT FK_video_game FOREIGN KEY (vg_id) REFERENCES video_game (id),
	CONSTRAINT FK_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);

CREATE TABLE vg_studio (
	vg_id INT,
	studio_id INT,
	CONSTRAINT FK_video_game FOREIGN KEY (vg_id) REFERENCES video_game (id),
	CONSTRAINT FK_studio FOREIGN KEY (studio_id) REFERENCES company (company_id)
);

COMMIT TRANSACTION;
