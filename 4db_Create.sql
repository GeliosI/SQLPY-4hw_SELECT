-- Музыкальные жанры
CREATE TABLE IF NOT EXISTS Musical_genres (
	genre_id SERIAL PRIMARY KEY,
	title VARCHAR(40) UNIQUE NOT NULL
);

-- Исполнители
CREATE TABLE IF NOT EXISTS Performers (
	performer_id SERIAL PRIMARY KEY,
	performer_name VARCHAR(40) UNIQUE NOT NULL
);

-- Связь исполнителей и жанров
CREATE TABLE IF NOT EXISTS GenresPerformers (
	genre_id INTEGER REFERENCES Musical_genres(genre_id),
	performer_id INTEGER REFERENCES Performers(performer_id),
	CONSTRAINT GPpk PRIMARY KEY (genre_id, performer_id)
);

-- Альбомы
CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	title VARCHAR(40) UNIQUE NOT NULL,
	year_of_issue DATE CHECK (year_of_issue > '1950-01-01')
);

-- Связь исполнителей и альбомов
CREATE TABLE IF NOT EXISTS PerformersAlbums (
	album_id INTEGER REFERENCES Albums(album_id),
	performer_id INTEGER REFERENCES Performers(performer_id),
	CONSTRAINT PApk PRIMARY KEY (album_id, performer_id)
);

-- Треки. Каждый трек входит в строго один альбом
CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Albums(album_id),
	title VARCHAR(40) UNIQUE NOT NULL,
	duration INTEGER CHECK (duration BETWEEN 100 AND 600)
);

-- Сборник
CREATE TABLE IF NOT EXISTS Сollection (
	collection_id SERIAL PRIMARY KEY,
	title VARCHAR(40) UNIQUE NOT NULL,
	year_of_issue DATE CHECK (year_of_issue > '1950-01-01')
);

-- Связь сборников и треков
CREATE TABLE IF NOT EXISTS TracksСollection (
	track_id INTEGER REFERENCES Tracks(track_id),
	collection_id INTEGER REFERENCES Сollection(collection_id),
	CONSTRAINT TCpk PRIMARY KEY (track_id, collection_id)
);