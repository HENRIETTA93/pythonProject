-- 1
 select
index_name, blevel, leaf_blocks, num_rows, distinct_keys, clustering_factor
from user_ind_statistics
where table_name=UPPER('film');