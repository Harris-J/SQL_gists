SELECT t.name AS table_name
      , SCHEMA_NAME(schema_id) AS schema_name
      , c.name AS column_name
FROM sys.tables AS t
      INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
 
--    EDIT the 'LIKE' statement to find specific column names anywhere in the database!
WHERE c.name LIKE '%bstat%'
 
ORDER BY schema_name
      , table_name;