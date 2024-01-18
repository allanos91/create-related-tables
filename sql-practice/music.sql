-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS musicians_and_instruments;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;

.mode box

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);
CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  bands_id INTEGER,
  FOREIGN KEY(bands_id) references bands(id) ON DELETE CASCADE
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);

CREATE TABLE musicians_and_instruments (
  musician_id INTEGER,
  instruments_id INTEGER,
  FOREIGN KEY(musician_id) references musicians(id) ON DELETE CASCADE,
  FOREIGN KEY(instruments_id) references instruments(id) ON DELETE CASCADE
);

INSERT INTO bands (name)
VALUES
("beetles"),
("Europe"),
("Monkeys");


INSERT INTO musicians (first_name, last_name, bands_id)
VALUES
("Johny", "Cash", 1),
("Elvis", "Presley", 2),
("Taylor", "Swift", 3);



UPDATE musicians SET bands_id = 1 WHERE id = 1;
SELECT * FROM musicians;
SELECT * FROM bands;

INSERT INTO instruments (type)
VALUES
("Saxaphone"),
("Guitar");

SELECT * FROM musicians_and_instruments;

SELECT first_name, name FROM musicians, bands WHERE bands_id = bands.id
