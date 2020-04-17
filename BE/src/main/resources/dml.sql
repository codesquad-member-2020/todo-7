INSERT INTO
    project
        (id, title)
    VALUES
        (1, 'Todo Project');

INSERT INTO
    category
        (id, title, project, project_key)
    VALUES
        (1, 'To do', 1, 0),
        (2, 'In progress', 1, 1),
        (3, 'Done', 1, 2);

INSERT INTO
    card
        (id, title, contents, category, category_key)
    VALUES
        (1, '말 예쁘게 하기', '경청이 중요합니다!', 1, 0);

INSERT INTO
    user
        (id, user_name, password)
    VALUES
        (1, 'poogle', 'poogle');
