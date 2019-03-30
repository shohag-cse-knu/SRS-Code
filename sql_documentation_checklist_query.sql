SELECT 
h.name Category_Name,
t.name Title,
IF(t.materiality!=1,'Material','Less Material') Materiality,
IF(t.has_child_sts!=1,'No','Yes') Child_Status,
IF(f.id IS NOT NULL, GROUP_CONCAT(
			CONCAT(f.caption_name,IF(f.mandatory_sts!=0,'*','')) ORDER BY f.orders SEPARATOR '\n'),''
  ) Child_Names,
IF(f.id IS NOT NULL, GROUP_CONCAT(IF(f.input_type!='List',f.input_type,'Dropdown') ORDER BY f.orders SEPARATOR '\n'),'\n') Nature_Of_Child,
GROUP_CONCAT(IF(ref.ref_name IS NOT NULL,ref.ref_name,'') ORDER BY f.orders SEPARATOR '\n') Reference_Name
FROM 
par_docs_title t
LEFT OUTER JOIN par_docs_head h ON(t.docs_head_id = h.id AND h.sts=1 AND t.sts=1)
LEFT OUTER JOIN child_table_fields f ON(t.child_table_name = f.child_table_name)
LEFT OUTER JOIN ref_list ref ON(ref.table_name = f.ref_table_name)
GROUP BY t.id
ORDER BY h.orders,t.orders;