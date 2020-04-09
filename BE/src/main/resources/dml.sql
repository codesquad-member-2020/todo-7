INSERT INTO project(id, title) VALUES(1, 'Todo Project');

INSERT INTO category
    (id, title, project, project_key)
VALUES
    (1, '해야 할 일', 1, 0), (2, '하고 있는 일', 1, 1), (3, '완료된 일', 1, 2);

INSERT INTO
    card(id, contents, category, category_key)
VALUES
    (1, '할 일 1', 1, 0),
    (2, '할 일 2', 1, 1),
    (3, '하는 중 1', 2, 0),
    (4, '다함 1', 3, 1);
