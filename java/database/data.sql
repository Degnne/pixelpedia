BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO company (company_name) VALUES ('Activision');   --1
INSERT INTO company (company_name) VALUES ('Nintendo');     --2
INSERT INTO company (company_name) VALUES ('Bungie');       --3
INSERT INTO company (company_name) VALUES ('Team Meat');    --4
INSERT INTO company (company_name) VALUES ('THQ');          --5
INSERT INTO company (company_name) VALUES ('Microsoft');    --6

INSERT INTO video_game (title, release_date, release_price, description, publisher_id) VALUES ('Halo', CURRENT_DATE, 60.00, 'This is Halo. It is a game.', 3);                              --1
INSERT INTO video_game (title, release_date, release_price, description, publisher_id) VALUES ('Super Mario Bros.', CURRENT_DATE, 60.00, 'This is Super Mario Bros. It is a game.', 2);     --2
INSERT INTO video_game (title, release_date, release_price, description, publisher_id) VALUES ('Super Meat Boy', CURRENT_DATE, 60.00, 'This is Super Meat Boy. It is a game.', 4);          --3
INSERT INTO video_game (title, release_date, release_price, description, publisher_id) VALUES ('Tak and the Power of Juju', CURRENT_DATE, 60.00, 'This is Tak and the Power of Juju. It is a game.', 5);    --4

INSERT INTO genre (genre_name) VALUES ('platformer');   --1
INSERT INTO genre (genre_name) VALUES ('FPS');          --2

INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 2);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (2, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (3, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (4, 1);

INSERT INTO system (system_name, manufacturer_id) VALUES ('NES', 2);    --1
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox', 6);   --2

INSERT INTO vg_system (vg_id, system_id) VALUES (2, 1);
INSERT INTO vg_system (vg_id, system_id) VALUES (1, 2);

INSERT INTO vg_studio (vg_id, studio_id) VALUES (1, 3);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (2, 2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (3, 4);

COMMIT TRANSACTION;
