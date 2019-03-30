UPDATE app_mortgage a 
LEFT OUTER JOIN app_mortgage b ON(a.id = b.id)
SET a.mortgage_deed_no_unique = REPLACE(b.mortgage_deed_no_unique,'/','_')