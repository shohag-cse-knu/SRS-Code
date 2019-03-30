INSERT INTO sys_prod_seg_title(prod_seg_id,docs_head_id,docs_title_id)
SELECT l.id prod_seg_id,t.docs_head_id,t.id docs_title_id
FROM par_product_segment l
LEFT OUTER JOIN par_docs_title t ON 1=1
