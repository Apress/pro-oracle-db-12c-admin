SELECT a.name, (f.bytes/a.bytes)*100 pct_free,'% free',a.tablespace_name||','
FROM
(SELECT c.name, NVL(SUM(bytes),0) bytes, x.tablespace_name
FROM cdb_free_space y, cdb_tablespaces x, v$containers c
WHERE x.tablespace_name = y.tablespace_name(+)
AND x.contents != 'TEMPORARY' AND x.status != 'READ ONLY'
AND x.tablespace_name  NOT LIKE 'UNDO%'
AND x.con_id = y.con_id
AND x.con_id = c.con_id
GROUP BY c.name, x.tablespace_name) f,
(SELECT c.name, SUM(d.bytes) bytes, d.tablespace_name
FROM cdb_data_files d, v$containers c
WHERE d.con_id = c.con_id
GROUP BY c.name, tablespace_name) a
WHERE a.tablespace_name = f.tablespace_name
AND  (f.bytes/a.bytes)*100 <= 50
AND   a.name NOT IN ('PDB$SEED')
AND   a.name = f.name
ORDER BY 1;
