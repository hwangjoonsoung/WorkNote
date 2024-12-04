-- database character set 확인
SELECT SCHEMA_NAME AS 'database', DEFAULT_CHARACTER_SET_NAME AS 'character_set', DEFAULT_COLLATION_NAME AS 'collation'
FROM information_schema.SCHEMATA;

-- database character set 확인
show variables like '[database name]';

-- table collation 확인
show table status where name like '[table name]';

-- column collation 확인
show full columns from 'table_name';