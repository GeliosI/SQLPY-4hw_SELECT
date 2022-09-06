-- количество исполнителей в каждом жанре
SELECT mg.title, COUNT(*)
  FROM Musical_genres mg
  JOIN GenresPerformers gp ON gp.genre_id = mg.genre_id
 GROUP BY mg.title;
 
 -- количество треков, вошедших в альбомы 2019-2020 годов
SELECT al.title, COUNT(*)
  FROM Albums al
  JOIN Tracks tr ON tr.album_id = al.album_id
 WHERE al.year_of_issue BETWEEN '2019.01.01' AND '2020.12.12'
 GROUP BY al.title;
 
-- средняя продолжительность треков по каждому альбому
SELECT al.title, AVG(duration)
  FROM Albums al
  JOIN Tracks tr ON tr.album_id = al.album_id
 GROUP BY al.title;
 
-- все исполнители, которые не выпустили альбомы в 2020 году
SELECT pr.performer_name
  FROM Performers pr
  JOIN PerformersAlbums pa ON pa.performer_id = pr.performer_id
  JOIN Albums al ON al.album_id  = pa.album_id
 WHERE al.year_of_issue NOT BETWEEN '2020.01.01' AND '2020.12.12';
 
-- названия сборников, в которых присутствует конкретный исполнитель (Freddie Mercury)
SELECT cl.title
  FROM Сollection cl
  JOIN TracksСollection tc ON cl.collection_id = tc.collection_id
  JOIN Tracks tr ON tr.track_id = tc.track_id 
  JOIN PerformersAlbums pa ON pa.album_id = tr.album_id 
  JOIN Performers pr ON pr.performer_id = pa.performer_id  
 WHERE pr.performer_name = 'Freddie Mercury';
 
-- название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT al.title
  FROM Albums al
  JOIN PerformersAlbums pa ON al.album_id = pa.album_id
  JOIN GenresPerformers gp ON gp.performer_id = pa.performer_id  
 GROUP BY al.title
HAVING COUNT(*) > 1;

-- наименование треков, которые не входят в сборники
SELECT tr.title
  FROM Tracks tr
  LEFT JOIN TracksСollection tc ON tr.track_id = tc.track_id
  WHERE collection_id ISNULL;
  
-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько) 
SELECT pr.performer_name
  FROM Performers pr
  JOIN PerformersAlbums pa ON pa.performer_id = pr.performer_id 
  JOIN Tracks tr ON tr.album_id = pa.album_id
 WHERE tr.duration = (SELECT MIN(duration) FROM tracks);

-- название альбомов, содержащих наименьшее количество треков
SELECT al.title, COUNT(tr.track_id)
  FROM Albums al
  JOIN Tracks tr ON tr.album_id = al.album_id 
 GROUP BY al.title
HAVING COUNT(tr.track_id) = (
		 SELECT min(count_tr)
		   FROM (
		         SELECT al.title, COUNT(tr.track_id) count_tr
		           FROM Albums al
		           JOIN Tracks tr ON tr.album_id = al.album_id 
		          GROUP BY al.title
		        ) AS count_tracks_in_albums    
		 )
        