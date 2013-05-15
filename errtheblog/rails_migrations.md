--- 
rails_migrations: |-
  AT notes:
  # Add to existing model
  $ rails generate migration AddStaticDataJSONToReports static_data_json:string
  $ vim db/migrate/20120209232000_add_static_data_json_to_reports.rb 
  + "add_column :reports, :static_data_json, :text, :limit => 4294967295"
  $ bundle exec rake db:migrate
  # Create a new model
  $ rails generate model GhostApplication application_name:string application_label:string file_hash:string  file_hash_sha1:string file_hash_sha256:string platform:integer requests:integer 
  
  
  
  http://wiki.rubyonrails.com/rails/pages/UsingMigrations
  
  valid data types:
    :integer :float
    :datetime :date :timestamp :time
    :text :string
    :binary
    :boolean
  options:
    :null (boolean)
    :limit (integer)
    :default
    :precision (integer)
    :scale (integer)
  
  create the model       ./script/generate model model_name
  apply schema changes   rake db:migrate
  modify schema          ./script generate migration description_name
