--- 
migrations: |-
  Methods:
    create_table(name, options)
    drop_table(name)
    rename_table(old_name, new_name)
    add_column(table_name, column_name, type, options)
    rename_column(table_name, column_name, new_column_name)
    change_column(table_name, column_name, type, options)
    remove_column(table_name, column_name)
    add_index(table_name, column_name, index_type)
    remove_index(table_name, column_name)
    change_table(table_name) {|Table.new(table_name, self)| ...} 
  
  Available Column Types (mappings are below):
    * integer
    * float
    * datetime
    * date
    * timestamp
    * time
    * text
    * string
    * binary
    * boolean
    * decimal :precision, :scale
  
  Valid Column Options:
    * limit
    * null (i.e. ":null => false" implies NOT NULL)
    * default (to specify default values)
    * :decimal, :precision => 8, :scale => 3
  
  Rake Tasks:
    rake db:schema:dump: run after you create a model to capture the schema.rb
    rake db:schema:import: import the schema file into the current database (on error, check if your schema.rb has ":force => true" on the create table statements
    ./script/generate migration MigrationName: generate a new migration with a new 'highest' version (run './script/generate migration' for this info at your fingertips)
    rake db:migrate: migrate your current database to the most recent version
    rake db:migrate VERSION=5: migrate your current database to a specific version (in this case, version 5)
    rake db:rollback: migrate down one migration
    rake db:rollback STEP=3: migrate down three migrations
    rake db:migrate RAILS_ENV=production: migrate your production database
  
  SQL:
    Queries can be executed directly:
    execute 'ALTER TABLE researchers ADD CONSTRAINT fk_researchers_departments FOREIGN KEY ( department_id ) REFERENCES departments( id )'
  
  Example Migration:
    class UpdateUsersAndCreateProducts < ActiveRecord::Migration
      def self.up
        rename_column "users", "password", "hashed_password" 
        remove_column "users", "email" 
  
        User.reset_column_information
        User.find(:all).each{|u| #do something with u}
  
        create_table "products", :force => true do |t|
          t.column "name", :text
          t.column "description", :text
          t.column "price", :decimal, :precision => 9, :scale => 2
          t.column "category_id", :integer
        end
  
        #the rails 2.0 way:
        create_table :people do |t|
          t.integer :account_id
          t.string  :first_name, :last_name, :null => false
          t.text    :description
          t.references :category # is the equivalent of t.integer :category_id
          t.timestamps
        end
      end
  
      def self.down
        rename_column "users", "hashed_password", "password" 
        add_column "users", "email", :string
        drop_table "products" 
      end
    end
  
  Find Highest version:
    script/runner "puts ActiveRecord::Migrator.current_version"
  
  Database Mapping
  
  Rails      | db2          | mysql        | openbase     | Oracle        |
  ---        | ---          | ---          | ---          | ---           |
  :binary    | blob(32678)  | blob         | object       | blob          |
  :boolean   | decimal(1)   | tinyint(1)   | boolean      | number(10)    |
  :date      | date         | date         | date         | date          |
  :datetime  | timestamp    | datetime     | datetime     | date          |
  :decimal   | decimal      | decimal      | decimal      | decimal       |
  :float     | float        | float        | float        | number        |
  :integer   | int          | int(11)      | integer      | number(38)    |
  :string    | varchar(255) | varchar(255) | char(4096)   | varchar2(255) |
  :text      | clob(32768)  | text         | text         | clob          |
  :time      | time         | time         | time         | date          |
  :timestamp | timestamp    | datetime     | timestamp    | date          |
  
  Rails      | postgresql   | sqlite       | sqlserver    | Sybase        |
  ---        | ---          | ---          | ---          | ---           |
  :binary    | bytea        | blob         | image        | image         |
  :boolean   | boolean      | boolean      | bit          | bit           |
  :date      | date         | date         | datetime     | datetime      |
  :datetime  | timestamp    | datetime     | datetime     | datetime      |
  :decimal   | decimal      | decimal      | decimal      | decimal       |
  :float     | float        | float        | float(8)     | float(8)      |
  :integer   | integer      | integer      | int          | int           |
  :string    | *            | varchar(255) | varchar(255) | varchar(255)  |
  :text      | text         | text         | text         | text          |
  :time      | time         | datetime     | datetime     | time          |
  :timestamp | timestamp    | datetime     | datetime     | timestamp     |
