SELECT DISTINCT
  a.owner                                 owner
 ,a.constraint_name                       cons_name
 ,a.table_name                            tab_name
 ,b.column_name                           cons_column
 ,NVL(c.column_name,'***Check index****') ind_column
FROM dba_constraints  a
    ,dba_cons_columns b
    ,dba_ind_columns  c
WHERE constraint_type = 'R'
AND a.owner           = UPPER('&&user_name')
AND a.owner           = b.owner
AND a.constraint_name = b.constraint_name
AND b.column_name     = c.column_name(+)
AND b.table_name      = c.table_name(+)
AND b.position        = c.column_position(+)
ORDER BY tab_name, ind_column;
--
SELECT
 CASE WHEN ind.index_name IS NOT NULL THEN
   CASE WHEN ind.index_type IN ('BITMAP') THEN
     '** Bitmp idx **'
   ELSE
     'indexed'
   END
 ELSE
   '** Check idx **'
 END checker
,ind.index_type
,cons.owner, cons.table_name, ind.index_name, cons.constraint_name, cons.cols
FROM (SELECT
        c.owner, c.table_name, c.constraint_name
       ,LISTAGG(cc.column_name, ',' ) WITHIN GROUP (ORDER BY cc.column_name) cols
      FROM dba_constraints  c
          ,dba_cons_columns cc
      WHERE c.owner           = cc.owner
      AND   c.owner = UPPER('&&schema')
      AND   c.constraint_name = cc.constraint_name
      AND   c.constraint_type = 'R'
      GROUP BY c.owner, c.table_name, c.constraint_name) cons
LEFT OUTER JOIN
(SELECT
  table_owner, table_name, index_name, index_type, cbr
 ,LISTAGG(column_name, ',' ) WITHIN GROUP (ORDER BY column_name) cols
 FROM (SELECT
        ic.table_owner, ic.table_name, ic.index_name
       ,ic.column_name, ic.column_position, i.index_type
       ,CONNECT_BY_ROOT(ic.column_name) cbr
       FROM dba_ind_columns ic
           ,dba_indexes     i
       WHERE ic.table_owner = UPPER('&&schema')
       AND   ic.table_owner = i.table_owner
       AND   ic.table_name  = i.table_name
       AND   ic.index_name  = i.index_name
       CONNECT BY PRIOR ic.column_position-1 = ic.column_position
       AND PRIOR ic.index_name = ic.index_name)
  GROUP BY table_owner, table_name, index_name, index_type, cbr) ind
ON  cons.cols       = ind.cols
AND cons.table_name = ind.table_name
AND cons.owner      = ind.table_owner
ORDER BY checker, cons.owner, cons.table_name;

