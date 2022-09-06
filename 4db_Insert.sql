INSERT INTO Musical_genres (title) 
VALUES ('rock and roll'),
       ('country'),
       ('blues'),
       ('chanson'),
       ('opera');

INSERT INTO Performers (performer_name) 
VALUES ('Freddie Mercury'),
       ('Alabama'),
       ('Nirvana'),
       ('Montserrat Caballe'),
       ('Mikhail Krug'),
       ('Muddy Waters'),
       ('Luciano Pavarotti'),
       ('Pink Floyd');
       
INSERT INTO GenresPerformers (genre_id, performer_id) 
VALUES (1, 1),
       (2, 2),
       (1, 3),
       (5, 4),
       (4, 5),
       (3, 6),
       (5, 7),
       (1, 6),
       (2, 7),       
       (1, 8);
      
INSERT INTO Albums (title, year_of_issue) 
VALUES ('Moon', '1960-03-27'),
       ('Sun', '2019-09-01'),
       ('Gun', '2020-05-21'),
       ('Freddie', '2018-12-28'),
       ('Prison', '2020-01-05'),
       ('Tears', '2018-07-03'),
       ('Italy', '1999-11-11'),
       ('Violet', '2020-04-09');
       
INSERT INTO PerformersAlbums (album_id, performer_id) 
VALUES (1, 2),
       (2, 1),
       (3, 3),
       (4, 5),
       (5, 6),
       (6, 4),
       (7, 8),
       (8, 7);
      
INSERT INTO Tracks (album_id, title, duration) 
VALUES ('1', 'my lunch', 180),
       ('2', 'cool house', 240),
       ('4', 'potatoes in a bag', 172),
       ('1', 'fried onion', 120),
       ('6', 'raspberry girl', 250),
       ('8', 'my dear neighbor', 200),
       ('7', 'five plus five', 156),
       ('7', 'python is a snake', 231),
       ('3', 'plate on the table', 150),
       ('1', 'voldepotter', 280),
       ('5', 'horrors of Duma street', 275),
       ('4', 'orange peel', 111),
       ('3', 'tangerine bone', 135),
       ('2', 'fifth ocean', 178),
       ('2', 'tomcat', 200),       
       ('5', 'pluto is my planet', 333);       
      
INSERT INTO Сollection (title, year_of_issue) 
VALUES ('three moons', '2020-03-22'),
       ('monkey not human', '2010-08-01'),
       ('chair and table', '1955-05-01'),
       ('man is a monkey', '2020-11-22'),
       ('window to australia', '1984-05-05'),
       ('killer whale', '2019-07-09'),
       ('monkey tribe', '1995-12-12'),
       ('the voices of the earth', '2019-11-11');
      
INSERT INTO TracksСollection (track_id, collection_id) 
VALUES (1, 1),
       (2, 5),
       (3, 3),
       (4, 7),
       (5, 6),
       (6, 1),
       (7, 2),
       (8, 8),
       (9, 7),
       (10, 4),
       (11, 4),
       (12, 5),
       (13, 1),
       (14, 8),
       (15, 7);
      
      

