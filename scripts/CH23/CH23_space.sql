SET LINES 132 PAGES 100
COL con_name FORM A15 HEAD "Container|Name"
COL tablespace_name FORM A15
COL fsm FORM 999,999,999,999 HEAD "Free|Space Meg."
COL apm FORM 999,999,999,999 HEAD "Alloc|Space Meg."
--
COMPUTE SUM OF fsm apm ON REPORT
BREAK ON REPORT ON con_id ON con_name ON tablespace_name
--
WITH x AS (SELECT c1.con_id, cf1.tablespace_name, SUM(cf1.bytes)/1024/1024 fsm
FROM cdb_free_space cf1
,v$containers c1
WHERE cf1.con_id = c1.con_id
GROUP BY c1.con_id, cf1.tablespace_name),
y AS (SELECT c2.con_id, cd.tablespace_name, SUM(cd.bytes)/1024/1024 apm
FROM cdb_data_files cd
,v$containers c2
WHERE cd.con_id = c2.con_id
GROUP BY c2.con_id
,cd.tablespace_name)
SELECT x.con_id, v.name con_name, x.tablespace_name, x.fsm, y.apm
FROM x, y, v$containers v
WHERE x.con_id = y.con_id
AND x.tablespace_name = y.tablespace_name
AND v.con_id = y.con_id
UNION
SELECT vc2.con_id, vc2.name, tf.tablespace_name, null, SUM(tf.bytes)/1024/1024
FROM v$containers vc2, cdb_temp_files tf
WHERE vc2.con_id = tf.con_id
GROUP BY vc2.con_id, vc2.name, tf.tablespace_name
ORDER BY 1, 2;
