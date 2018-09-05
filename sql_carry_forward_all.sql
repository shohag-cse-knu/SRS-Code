
UPDATE par_docs_title SET tagable_sts = 1,cforward_sts = 1 WHERE has_child_sts = 0
UPDATE child_table_list SET child_tagable_sts = 1,child_cforward_sts = 1