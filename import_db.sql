

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255)
)
CREATE TABLE questions (
    id INTEGER PRIMARY KEY
    title VARCHAR(255),
    body VARCHAR(255),
    author VARCHAR(255)
    FOREIGN KEY (author) REFERENCES users(id)
)
CREATE TABLE question_follows (
    users_id INTEGER PRIMARY KEY
    questions_id
    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
)
CREATE TABLE replies (
    id INTEGER PRIMARY KEY NOT NULL
    subject_question_id INTEGER NOT NULL
    FOREIGN KEY (subject_question_id) REFERENCES questions(id)
    parent_reply_id INTEGER
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
    user_reply_id INTEGER NOT NULL
    FOREIGN KEY (user_reply_id) REFERENCES users(id)
    body TEXT NOT NULL
)
CREATE TABLE question_likes(
    user_like_id INTEGER PRIMARY KEY NOT NULL
    user_id INTEGER NOT NULL
    FOREIGN KEY (user_id) REFERENCES users(id)
    question_id INTEGER NOT NULL
    FOREIGN KEY (question_id) REFERENCES questions(id)
)









    body TEXT 
    FOREIGN KEY (reply) REFERENCES questions(id)
    parent_reply VARCHAR(255)
    FOREIGN KEY (parent_reply) REFERENCES replies(id)
)

