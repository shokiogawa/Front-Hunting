SELECT * FROM subCategoryRecords


SELECT *
FROM sub_category_records
INNER JOIN category_records on sub_category_records.category_id = category_records.id
WHERE (sub_category_records.now_level = ? OR sub_category_records.now_level = ? OR　sub_category_records.now_level = ? OR　sub_category_records.now_level = ? OR　sub_category_records.now_level = ?) AND category_records.name;

CREATE TABLE todos (
    id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
);

