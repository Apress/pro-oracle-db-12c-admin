declare
  src_blb bfile; -- point to source BLOB on file system
  dst_blb blob;  -- destination BLOB in table
  src_doc_name varchar2(300) := 'patch.zip';
  src_offset integer := 1; -- where to start in the source BLOB
  dst_offset integer := 1;  -- where to start in the target BLOB
begin
  src_blb := bfilename('LOAD_LOB',src_doc_name); -- assign pointer to file
  --
  insert into patchmain(patch_id, patch_file)
  values(patch_seq.nextval, empty_blob())
  returning patch_file into dst_blb; -- create LOB placeholder column first
  dbms_lob.open(src_blb, dbms_lob.lob_readonly);
  --
  dbms_lob.loadblobfromfile(
  dest_lob => dst_blb,
  src_bfile => src_blb,
  amount => dbms_lob.lobmaxsize,
  dest_offset => dst_offset,
  src_offset => src_offset
  );
  dbms_lob.close(src_blb);
  dbms_output.put_line('Wrote BLOB: ' || src_doc_name);
end;
/

