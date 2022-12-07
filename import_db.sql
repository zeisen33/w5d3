PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body VARCHAR(255),
    author VARCHAR(255),
    FOREIGN KEY (author) REFERENCES users(id)
);
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_reply_id INTEGER,
    body TEXT NOT NULL,
    FOREIGN KEY (subject_question_id) REFERENCES questions(id)
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
    FOREIGN KEY (user_reply_id) REFERENCES users(id)
);
CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    liker_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (liker_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Adam', 'Smith'),
    ('Jane', 'Doe');

INSERT INTO
    questions (title, body, author)
VALUES
    ('Question 1', 'What is your name?', (SELECT id FROM users WHERE fname = 'Adam')),
    ('Question 2', 'What is your gender?', (SELECT id FROM users WHERE fname = 'Jane'));

INSERT INTO 
    replies (subject_question_id, parent_reply_id, user_reply_id, body)
VALUES
    (1, NULL, 1, 'my name is ');

INSERT INTO 
    question_likes (liker_id, question_id)
VALUES
    (1, 1);