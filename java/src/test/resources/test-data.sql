BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO company (company_name) VALUES ('Activision');   --1
INSERT INTO company (company_name) VALUES ('Nintendo');     --2
INSERT INTO company (company_name) VALUES ('Bungie');       --3
INSERT INTO company (company_name) VALUES ('Team Meat');    --4
INSERT INTO company (company_name) VALUES ('THQ');          --5
INSERT INTO company (company_name) VALUES ('Microsoft');    --6
INSERT INTO company (company_name) VALUES ('Sony');    --7
INSERT INTO company (company_name) VALUES ('SEGA');    --7



INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Halo: Combat Evolved', CURRENT_DATE, 60.00, 'This is Halo. It is a game.', 3, 'M','https://cdn.mobygames.com/covers/4079988-halo-combat-evolved-windows-other.jpg');                              --1
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Super Mario Bros.', CURRENT_DATE, 60.00, 'This is Super Mario Bros. It is a game.', 2, 'E','https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/de10961b-5990-4053-b78f-eabbba03ae83/d7ndqiw-9b9e55e3-e573-47c6-bc70-4edfa3b89043.png/v1/fill/w_746,h_1072,q_75,strp/super_mario_bros_nes_cover_by_perrito_gatito-d7ndqiw.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi9kZTEwOTYxYi01OTkwLTQwNTMtYjc4Zi1lYWJiYmEwM2FlODMvZDduZHFpdy05YjllNTVlMy1lNTczLTQ3YzYtYmM3MC00ZWRmYTNiODkwNDMucG5nIiwid2lkdGgiOiI8PTc0NiIsImhlaWdodCI6Ijw9MTA3MiJ9XV19.mDrgffJcbbl5h5bVylez77M2zeW_MfJyGdcdDRiYCfg');     --2
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Super Meat Boy', CURRENT_DATE, 60.00, 'This is Super Meat Boy. It is a game.', 4, 'T','https://www.newgamenetwork.com/images/uploads/games/1294707829_supermeatboycover.png');          --3
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES ('Tak and the Power of Juju', CURRENT_DATE, 60.00, 'This is Tak and the Power of Juju. It is a game.', 5, 'E','https://www.giantbomb.com/a/uploads/original/8/87790/2352270-box_tak.png');    --4
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('Pac-Man', '1980-05-22', 30.00, 'This is one of the most popular arcade games of all time.', 1, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Pac-Man_arcade_game.jpg/220px-Pac-Man_arcade_game.jpg');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('Tetris', '1984-06-06', 25.00, 'This is a puzzle game that is simple to learn but difficult to master.', 2, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Tetris_cover.jpg/220px-Tetris_cover.jpg');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('Super Mario Bros. 3', '1988-09-12', 60.00, 'This is the sequel to Super Mario Bros. and is considered one of the greatest video games of all time.', 1, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/9/91/Super_Mario_Bros._3_box_art.jpg/220px-Super_Mario_Bros._3_box_art.jpg');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('The Legend of Zelda: A Link to the Past', '1991-11-21', 60.00, 'This is a sequel to The Legend of Zelda: Ocarina of Time and is considered one of the greatest video games of all time.', 3, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/The_Legend_of_Zelda_A_Link_to_the_Past_box_art.png/220px-The_Legend_of_Zelda_A_Link_to_the_Past_box_art.png');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('Street Fighter II', '1991-02-10', 35.00, 'This is a fighting game that is considered one of the greatest video games of all time.', 5, 'T','https://upload.wikimedia.org/wikipedia/en/thumb/d/d9/Street_Fighter_II_box_art.jpg/220px-Street_Fighter_II_box_art.jpg');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('Sonic the Hedgehog', '1991-06-23', 49.99, 'This is a platform game that is considered one of the greatest video games of all time.', 2, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/Sonic_the_Hedgehog_cover.jpg/220px-Sonic_the_Hedgehog_cover.jpg');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
--('Mortal Kombat', '1992-10-13', 59.99, 'This is a fighting game that is considered one of the greatest video games of all time.', 8, 'T','https://upload.wikimedia.org/wikipedia/en/thumb/3/33/Mortal_Kombat_box_art.jpg/220px-Mortal_Kombat_box_art.jpg');


INSERT INTO genre (genre_name) VALUES ('Platformer');   --1
INSERT INTO genre (genre_name) VALUES ('First Person Shooter');          --2
INSERT INTO genre (genre_name) VALUES ('Real Time Strategy');          --3
INSERT INTO genre (genre_name) VALUES ('Twin-Stick Shooter');          --4
INSERT INTO genre (genre_name) VALUES ('Arcade Game');          --5
INSERT INTO genre (genre_name) VALUES ('2D');          --6
INSERT INTO genre (genre_name) VALUES ('3D');          --7
INSERT INTO genre (genre_name) VALUES ('Indie');          --8
INSERT INTO genre (genre_name) VALUES ('Role Playing Game');          --9
INSERT INTO genre (genre_name) VALUES ('Adventure');          --10
INSERT INTO genre (genre_name) VALUES ('Rhythm');          --11
INSERT INTO genre (genre_name) VALUES ('FORTNITEEE');          --12
INSERT INTO genre (genre_name) VALUES ('Battle Royale');          --13
INSERT INTO genre (genre_name) VALUES ('Puzzle Game');          --14
INSERT INTO genre (genre_name) VALUES ('MMO');          --15
INSERT INTO genre (genre_name) VALUES ('Souls-like');          --16
INSERT INTO genre (genre_name) VALUES ('Simulation');          --17
INSERT INTO genre (genre_name) VALUES ('Racing');          --18
INSERT INTO genre (genre_name) VALUES ('Sports Game');          --19
INSERT INTO genre (genre_name) VALUES ('Card Game');          --20
INSERT INTO genre (genre_name) VALUES ('Trivia');          --21
INSERT INTO genre (genre_name) VALUES ('Tactical FPS');          --22
INSERT INTO genre (genre_name) VALUES ('Education');          --23
INSERT INTO genre (genre_name) VALUES ('Exercise');          --24
INSERT INTO genre (genre_name) VALUES ('Party');          --25


INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 2);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (2, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (3, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (4, 1);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 4);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 5);
INSERT INTO vg_genre (vg_id, genre_id) VALUES (1, 3);


INSERT INTO system (system_name, manufacturer_id) VALUES ('NES', 2);    --1
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox', 6);   --2
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox 360', 6);   --3
INSERT INTO system (system_name, manufacturer_id) VALUES ('Xbox One', 6);   --4
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation', 7);   --5
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 2', 7);   --6
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 3', 7);   --7
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 4', 7);   --8
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation 5', 7);   --9
INSERT INTO system (system_name, manufacturer_id) VALUES ('Playstation Portable', 7);   --10
INSERT INTO system (system_name, manufacturer_id) VALUES ('Game Boy Advance', 2);   --11
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo Switch', 2);   --12
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo DS', 2);   --13
INSERT INTO system (system_name, manufacturer_id) VALUES ('Gamecube', 2);   --14
INSERT INTO system (system_name, manufacturer_id) VALUES ('SNES', 2);   --15
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo Wii', 2);   --16
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nintendo 64', 2);   --17
INSERT INTO system (system_name, manufacturer_id) VALUES ('Genesis', 8);   --18
INSERT INTO system (system_name, manufacturer_id) VALUES ('Dreamcast', 8);   --19
INSERT INTO system (system_name, manufacturer_id) VALUES ('Saturn', 8);   --20
INSERT INTO system (system_name, manufacturer_id) VALUES ('Nomad', 8);   --21
INSERT INTO system (system_name, manufacturer_id) VALUES ('32X', 8);   --22
INSERT INTO system (system_name, manufacturer_id) VALUES ('SEGA CD', 8);   --23
INSERT INTO system (system_name, manufacturer_id) VALUES ('Game Gear', 8);   --24


INSERT INTO vg_system (vg_id, system_id) VALUES (2, 1);
INSERT INTO vg_system (vg_id, system_id) VALUES (1, 2);

INSERT INTO vg_studio (vg_id, studio_id) VALUES (1, 3);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (2, 2);
INSERT INTO vg_studio (vg_id, studio_id) VALUES (3, 4);




INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,1, 'This is test text. Man this game is so fun!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,2, 'This is test text. BRUH this game is so fun!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,3, 'This is test text. Man this game is so bad!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,4, 'This is test text. Man this game is so good!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,3, 'This is test text. Man this game is so boring!', 'This Is Test Title!', '2023-01-01');
INSERT into review (user_id, game_id, review_txt, review_title, date_time) VALUES (1,3, 'This is test text. Man this game is so lame! DONT BUY', 'This Is Test Title!', '2023-01-01');


INSERT into review_likes(review_id, user_id, isliked) VALUES (1, 1, '0');
INSERT into review_likes(review_id, user_id, isliked) VALUES (2, 1, '1');
INSERT into review_likes(review_id, user_id, isliked) VALUES (3, 1, '1');
INSERT into review_likes(review_id, user_id, isliked) VALUES (4, 1, '0');
INSERT into review_likes(review_id, user_id, isliked) VALUES (5, 1, '1');
INSERT into review_likes(review_id, user_id, isliked) VALUES (6, 1, '0');

INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Rocco & Jeff!!', 1,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Jeff!!', 1,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Rocco!!', 2,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Jeff & Rocco!!', 3,1, '2023-10-10');
INSERT INTO comment (comment_txt, review_id, user_id, date_time) VALUES ('This is a Test Comment! GL Rocco & Jeff!!', 4,1, '2023-10-10');


INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (1, 1, '1');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (2, 1, '0');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (3, 1, '0');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (4, 1, '1');
INSERT INTO comment_likes(comment_id, user_id, isliked) VALUES (5, 1, '1');

COMMIT TRANSACTION;
