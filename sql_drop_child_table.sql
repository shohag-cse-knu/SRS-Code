SET GROUP_CONCAT_MAX_LEN=10000;
SET @tbls = (SELECT GROUP_CONCAT(TABLE_NAME)
               FROM information_schema.TABLES
              WHERE TABLE_SCHEMA = 'edoc_mmbl'
                AND TABLE_NAME LIKE 'ch_%');
SET @delStmt = CONCAT('DROP TABLE ',  @tbls);
-- SELECT @delStmt;
PREPARE stmt FROM @delStmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;