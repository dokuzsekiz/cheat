--- 
sql_alter: |-
  add a column:
  ALTER TABLE table_name ADD column_name datatype
  E.g: 
    alter table books add total_page_num float default 100 NOT NULL
  
  drop a column:
  ALTER TABLE table_name drop Gender column_name
  
  modify datatype of column:
  ALTER table table_name modify column_name datatype
  
  completely change a column
  ALTER table table_name change column_name new_column_name attributes
  
  add an index
    | ADD {INDEX|KEY} [index_name]
          [index_type] (index_col_name,...) [index_option] ...
  E.g:
    alter table track_offer_clicks add index fubar1 (application_id, landing_page_id );
