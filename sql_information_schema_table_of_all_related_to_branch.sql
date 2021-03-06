SELECT 
TABLE_NAME,
COLUMN_NAME,
DATA_TYPE
FROM 
information_schema.COLUMNS 
WHERE 
TABLE_SCHEMA = 'edoc_cbl_v2' 
AND COLUMN_NAME LIKE "branch_id%" 
AND (
	TABLE_NAME LIKE "app_loan%" OR
	TABLE_NAME LIKE "ch_%" OR
	TABLE_NAME LIKE "doc%" OR
	TABLE_NAME LIKE "doc%"
)