-- Active: 1697652204043@@127.0.0.1@3306

-- Práticas
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME('now', 'localtime'))
);

INSERT INTO users (id, name, email, password)
VALUES
('000', 'leo', 'leo@email.com', '123'),
('001', 'oi', 'oi@email.com', '1234'),
('002', 'jose', 'jose@email.com', '12345');

DROP TABLE users;

SELECT * FROM users;

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id)
);

INSERT INTO follows
VALUES
('000','001'),
('000','002'),
('001','000');

SELECT * FROM users
INNER JOIN follows
ON follows.follower_id = users.id;

SELECT * FROM users AS A
LEFT JOIN follows AS B
ON B.follower_id = A.id;

SELECT A.name AS seguidor, B.name AS seguido
FROM follows AS f
FULL JOIN users AS A ON f.follower_id = A.id
LEFT JOIN users AS B ON f.followed_id = B.id;
-- Verificar os seguidores, é necessário usar APELIDO