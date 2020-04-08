INSERT INTO Category(Id, Title) VALUES(1, '해야 할 일'), (2, '하고 있는 일'), (3, '완료된 일');

INSERT INTO
    Card(Id, Contents, CategoryId, PrevCardId)
VALUES
    (1, 'Spring boot와 MySQL 연결', 3, NULL),
    (2, 'Spring data jdbc 학습', 2, NULL),
    (3, 'ddd aggregate root 선택 기준준', 2, 2),
    (4, 'aggregate root를 통해 CRUD 로직 구현', 1, NULL);
