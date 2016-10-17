create table alert_log_file(
  alert_text varchar2(4000))
organization external
( type              oracle_loader
  default directory t_loc
  access parameters (
    records delimited by newline
    nobadfile
    nologfile
    nodiscardfile
    fields terminated by '#$~=ui$X'
    missing field values are null
    (alert_text)
  )
  location ('alert_o12c.log')
)
reject limit unlimited;

