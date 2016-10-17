COL db_name FORM A10
COL con_id FORM 999
COL pdb_name FORM A15
COL operation FORM A16
COL op_timestamp FORM A10
COL cloned_from_pdb_name FORMAT A15
--
SELECT db_name, con_id, pdb_name, operation,
       op_timestamp, cloned_from_pdb_name
FROM cdb_pdb_history
WHERE con_id > 2
ORDER BY con_id;
