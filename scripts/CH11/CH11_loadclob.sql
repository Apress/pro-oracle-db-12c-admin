declare
  src_clb bfile; -- point to source CLOB on file system
  dst_clb clob;  -- destination CLOB in table
  src_doc_name varchar2(300) := 'patch.txt';
  src_offset integer := 1; -- where to start in the source CLOB
  dst_offset integer := 1;  -- where to start in the target CLOB
  lang_ctx integer := dbms_lob.default_lang_ctx;
  warning_msg number; -- returns warning value if bad chars
begin
  src_clb := bfilename('LOAD_LOB',src_doc_name); -- assign pointer to file
  --
  insert into patchmain(patch_id, patch_desc) -- create LOB placeholder
  values(patch_seq.nextval, empty_clob())
  returning patch_desc into dst_clb;
  --
  dbms_lob.open(src_clb, dbms_lob.lob_readonly); -- open file
  --
  -- load the file into the LOB
  dbms_lob.loadclobfromfile(
  dest_lob => dst_clb,
  src_bfile => src_clb,
  amount => dbms_lob.lobmaxsize,
  dest_offset => dst_offset,
  src_offset => src_offset,
  bfile_csid => dbms_lob.default_csid,
  lang_context => lang_ctx,
  warning => warning_msg
  );
  dbms_lob.close(src_clb); -- close file
  --
  dbms_output.put_line('Wrote CLOB: ' || src_doc_name);
end;
/

