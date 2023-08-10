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
INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('Pac-Man', '1980-05-22', 30.00, 'This is one of the most popular arcade games of all time.', 1, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Pac-Man_arcade_game.jpg/220px-Pac-Man_arcade_game.jpg');

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('Tetris', '1984-06-06', 25.00, 'This is a puzzle game that is simple to learn but difficult to master.', 2, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Tetris_cover.jpg/220px-Tetris_cover.jpg');

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('Super Mario Bros. 3', '1988-09-12', 60.00, 'This is the sequel to Super Mario Bros. and is considered one of the greatest video games of all time.', 1, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/9/91/Super_Mario_Bros._3_box_art.jpg/220px-Super_Mario_Bros._3_box_art.jpg');

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('The Legend of Zelda: A Link to the Past', '1991-11-21', 60.00, 'This is a sequel to The Legend of Zelda: Ocarina of Time and is considered one of the greatest video games of all time.', 3, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/The_Legend_of_Zelda_A_Link_to_the_Past_box_art.png/220px-The_Legend_of_Zelda_A_Link_to_the_Past_box_art.png');

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('Street Fighter II', '1991-02-10', 35.00, 'This is a fighting game that is considered one of the greatest video games of all time.', 5, 'T','https://upload.wikimedia.org/wikipedia/en/thumb/d/d9/Street_Fighter_II_box_art.jpg/220px-Street_Fighter_II_box_art.jpg');

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('Sonic the Hedgehog', '1991-06-23', 49.99, 'This is a platform game that is considered one of the greatest video games of all time.', 2, 'E','https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/Sonic_the_Hedgehog_cover.jpg/220px-Sonic_the_Hedgehog_cover.jpg');

INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
('Mortal Kombat', '1992-10-13', 59.99, 'This is a fighting game that is considered one of the greatest video games of all time.', 8, 'T','https://upload.wikimedia.org/wikipedia/en/thumb/3/33/Mortal_Kombat_box_art.jpg/220px-Mortal_Kombat_box_art.jpg');


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

-- Insert 50 more video games
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art) VALUES
-- ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 59.99, 'Embark on an epic adventure in the open world of Hyrule.', 2, 'E10+', 'https://example.com/zelda_botw.jpg'),
-- ('Red Dead Redemption 2', '2018-10-26', 59.99, 'Experience the life of an outlaw in the Wild West.', 1, 'M', 'https://example.com/red_dead_redemption_2.jpg'),
-- ('Cyberpunk 2077', '2020-12-10', 49.99, 'Explore a dystopian future in this action RPG.', 1, 'M', 'https://example.com/cyberpunk_2077.jpg'),
-- ('DOOM Eternal', '2020-03-20', 39.99, 'Rip and tear through hordes of demons in this high-octane FPS.', 1, 'M', 'https://example.com/doom_eternal.jpg'),
-- ('Animal Crossing: New Horizons', '2020-03-20', 49.99, 'Create your own island paradise in this charming life simulation game.', 2, 'E', 'https://example.com/animal_crossing.jpg'),
-- ('The Witcher 3: Wild Hunt', '2015-05-19', 39.99, 'Embark on a quest to find the Child of Prophecy in this expansive RPG.', 1, 'M', 'https://example.com/witcher_3.jpg'),
-- ('Call of Duty: Modern Warfare', '2019-10-25', 59.99, 'Engage in intense military operations in this realistic FPS.', 1, 'M', 'https://example.com/cod_modern_warfare.jpg'),
-- ('Mass Effect Legendary Edition', '2021-05-14', 49.99, 'Experience the complete Mass Effect trilogy with updated visuals and gameplay.', 1, 'M', 'https://example.com/mass_effect_legendary.jpg'),
-- ("Uncharted 4: A Thief's End", '2016-05-10', 39.99, 'Join Nathan Drake on his final adventure in search of treasure.', 1, 'T', 'https://example.com/uncharted_4.jpg'),
-- ('Cuphead', '2017-09-29', 19.99, 'Face off against challenging bosses in this unique run-and-gun game.', 4, 'E10+', 'https://example.com/cuphead.jpg'),
-- ('Stardew Valley', '2016-02-26', 24.99, 'Build and manage your own farm in this relaxing simulation game.', 6, 'E', 'https://example.com/stardew_valley.jpg'),
-- ('Resident Evil Village', '2021-05-07', 49.99, 'Survive horror and uncover mysteries in a village plagued by supernatural threats.', 1, 'M', 'https://example.com/re_village.jpg'),
-- ('Horizon Zero Dawn', '2017-02-28', 29.99, 'Explore a lush post-apocalyptic world and uncover its secrets.', 1, 'T', 'https://example.com/horizon_zero_dawn.jpg'),
-- ('The Elder Scrolls V: Skyrim', '2011-11-11', 39.99, 'Embark on a grand adventure in the fantasy world of Tamriel.', 1, 'M', 'https://example.com/skyrim.jpg'),
-- ('Dark Souls III', '2016-04-12', 39.99, 'Test your skills in this challenging action RPG known for its difficulty.', 1, 'M', 'https://example.com/dark_souls_3.jpg'),
-- ('Rainbow Six Siege', '2015-12-01', 29.99, 'Engage in tactical multiplayer battles as part of an elite counter-terrorism unit.', 1, 'M', 'https://example.com/rainbow_six_siege.jpg'),
-- ('Super Smash Bros. Ultimate', '2018-12-07', 59.99, 'Battle it out with iconic characters in this frenetic crossover fighting game.', 2, 'E10+', 'https://example.com/smash_bros_ultimate.jpg'),
-- ('Civilization VI', '2016-10-21', 49.99, 'Lead a civilization from ancient times to the modern age in this turn-based strategy game.', 5, 'E10+', 'https://example.com/civ_6.jpg'),
-- ('Grand Theft Auto: San Andreas', '2004-10-26', 19.99, 'Experience the criminal underworld in a fictionalized version of California.', 1, 'M', 'https://example.com/gta_san_andreas.jpg'),
-- ('Metal Gear Solid V: The Phantom Pain', '2015-09-01', 39.99, 'Infiltrate enemy bases and unravel a complex narrative in this stealth-action game.', 1, 'M', 'https://example.com/mgs5.jpg'),
-- ('Fable III', '2010-10-26', 29.99, 'Shape your own destiny in a fantasy world filled with moral choices.', 1, 'M', 'https://example.com/fable_3.jpg'),
-- ('Fallout 4', '2015-11-10', 39.99, 'Navigate the post-apocalyptic wasteland and forge your own path.', 1, 'M', 'https://example.com/fallout_4.jpg'),
-- ('Final Fantasy XV', '2016-11-29', 49.99, 'Join Prince Noctis and his friends on a road trip that leads to a grand adventure.', 2, 'T', 'https://example.com/ffxv.jpg'),
-- ('Borderlands 3', '2019-09-13', 49.99, 'Shoot and loot your way through a chaotic world filled with humor and mayhem.', 1, 'M', 'https://example.com/borderlands_3.jpg'),
-- ('The Sims 4', '2014-09-02', 39.99, 'Create and control virtual lives in this beloved life simulation game.', 1, 'T', 'https://example.com/sims_4.jpg'),
-- ('Doom (1993)', '1993-12-10', 9.99, 'Experience the classic FPS that revolutionized the genre.', 1, 'M', 'https://example.com/doom_1993.jpg'),
-- ('Minecraft Dungeons', '2020-05-26', 29.99, 'Embark on a new adventure set in the Minecraft universe.', 2, 'E10+', 'https://example.com/minecraft_dungeons.jpg'),
-- ('Bioshock', '2007-08-21', 19.99, 'Explore the underwater city of Rapture and uncover its dark secrets.', 3, 'M','https://example.com/bioshock.jpg'),
-- ('Half-Life 2', '2004-11-16', 19.99, 'Fight against alien forces in a dystopian future using advanced weaponry.', 1, 'M', 'https://example.com/half_life_2.jpg'),
-- ('Hollow Knight', '2017-02-24', 14.99, 'Embark on a journey through a beautifully hand-drawn world as a brave knight.', 4, 'E10+', 'https://example.com/hollow_knight.jpg'),
-- ('Undertale', '2015-09-15', 9.99, "Navigate a unique world and make choices that impact the game's outcome.", 8, 'E10+', 'https://example.com/undertale.jpg'),
-- ('Destiny 2', '2017-09-06', 29.99, 'Defend the last safe city on Earth in this online multiplayer shooter.', 3, 'T', 'https://example.com/destiny_2.jpg'),
-- ('Genshin Impact', '2020-09-28', 0.00, 'Explore the fantasy world of Teyvat and uncover its mysteries.', 6, 'T', 'https://example.com/genshin_impact.jpg'),
-- ('Celeste', '2018-01-25', 19.99, 'Climb a mountain and overcome challenges in this indie platformer.', 4, 'E10+', 'https://example.com/celeste.jpg'),
-- ('Braid', '2008-08-06', 9.99, 'Manipulate time and solve intricate puzzles in this unique platformer.', 9, 'E10+', 'https://example.com/braid.jpg'),
-- ('Firewatch', '2016-02-09', 19.99, 'Experience a captivating story as a fire lookout in the Wyoming wilderness.', 8, 'T', 'https://example.com/firewatch.jpg'),
-- ('The Outer Worlds', '2019-10-25', 29.99, 'Navigate a space colony and make choices that shape the course of the story.', 1, 'M', 'https://example.com/outer_worlds.jpg'),
-- ("No Man's Sky", '2016-08-09', 39.99, 'Explore a procedurally generated universe and discover new planets and lifeforms.', 1, 'T', 'https://example.com/no_mans_sky.jpg'),
-- ('Cuphead: The Delicious Last Course', 'TBD', 19.99, "Continue Cuphead and Mugman's adventure with new challenges and bosses.", 4, 'E10+', 'https://example.com/cuphead_dlc.jpg'),
-- ('The Elder Scrolls VI', 'TBD', 59.99, 'Embark on a new journey in the next installment of The Elder Scrolls series.', 1, 'M', 'https://example.com/elder_scrolls_vi.jpg'),
-- ('Starfield', 'TBD', 59.99, "Explore the stars in Bethesda's upcoming spacefaring RPG.", 1, 'T', 'https://example.com/starfield.jpg'),
-- ('Hogwarts Legacy', 'TBD', 49.99, 'Attend Hogwarts School of Witchcraft and Wizardry in the 1800s in this action RPG.', 1, 'T', 'https://example.com/hogwarts_legacy.jpg'),
-- ('Metroid Prime 4', 'TBD', 59.99, 'Join Samus Aran in her next adventure in the beloved Metroid series.', 2, 'T', 'https://example.com/metroid_prime_4.jpg');

-- Video Games
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art)
--VALUES ('Cuphead', '2017-09-29', 20.00, 'Cuphead is a classic run and gun action game heavily focused on boss battles.', 1, 'E10+', 'https://cdn.mobygames.com/images/covers/l/413370-cuphead-xbox-one-front-cover.jpg');
--
--INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art)
--VALUES ('The Elder Scrolls V: Skyrim', '2011-11-11', 40.00, 'Skyrim is an open-world RPG known for its vast and immersive fantasy world.', 2, 'M', 'https://upload.wikimedia.org/wikipedia/en/thumb/1/15/The_Elder_Scrolls_V_Skyrim_cover.png/220px-The_Elder_Scrolls_V_Skyrim_cover.png');
--
---- Studios
--INSERT INTO studio (studio_name) VALUES ('Supergiant Games');
--INSERT INTO studio (studio_name) VALUES ('Bethesda Game Studios');
--INSERT INTO studio (studio_name) VALUES ('Team Cherry');
--INSERT INTO studio (studio_name) VALUES ('CD Projekt Red');
--INSERT INTO studio (studio_name) VALUES ('Ubisoft');
--
---- Genres
--INSERT INTO genre (genre_name) VALUES ('Action Adventure');
--INSERT INTO genre (genre_name) VALUES ('RPG');
--INSERT INTO genre (genre_name) VALUES ('Metroidvania');
--INSERT INTO genre (genre_name) VALUES ('Open World');
--INSERT INTO genre (genre_name) VALUES ('Stealth');
--
---- Publishers
--INSERT INTO company (company_name) VALUES ('Annapurna Interactive');
--INSERT INTO company (company_name) VALUES ('CD Projekt');
--INSERT INTO company (company_name) VALUES ('Square Enix');
--INSERT INTO company (company_name) VALUES ('Electronic Arts');
--INSERT INTO company (company_name) VALUES ('Capcom');
--
---- Video Game Genres
--INSERT INTO vg_genre (vg_id, genre_id) VALUES (11, 1);
--INSERT INTO vg_genre (vg_id, genre_id) VALUES (12, 1);
--INSERT INTO vg_genre (vg_id, genre_id) VALUES (13, 2);
--INSERT INTO vg_genre (vg_id, genre_id) VALUES (14, 2);
--INSERT INTO vg_genre (vg_id, genre_id) VALUES (15, 3);
--
---- Video Game Studios
--INSERT INTO vg_studio (vg_id, studio_id) VALUES (11, 1);
--INSERT INTO vg_studio (vg_id, studio_id) VALUES (12, 2);
--INSERT INTO vg_studio (vg_id, studio_id) VALUES (13, 3);
--INSERT INTO vg_studio (vg_id, studio_id) VALUES (14, 4);
--INSERT INTO vg_studio (vg_id, studio_id) VALUES (15, 5);
--
---- Video Game Publishers
--INSERT INTO vg_publisher (vg_id, publisher_id) VALUES (11, 6);
--INSERT INTO vg_publisher (vg_id, publisher_id) VALUES (12, 7);
--INSERT INTO vg_publisher (vg_id, publisher_id) VALUES (13, 8);
--INSERT INTO vg_publisher (vg_id, publisher_id) VALUES (14, 9);
--INSERT INTO vg_publisher (vg_id, publisher_id) VALUES (15, 10);








COMMIT TRANSACTION;
