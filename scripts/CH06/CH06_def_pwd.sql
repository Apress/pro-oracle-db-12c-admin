select distinct u.username
,case when d.user_name is null then 'DBA created account'
 else 'Oracle created account'
 end
from dba_users    u
    ,default_pwd$ d
where u.username=d.user_name(+);

