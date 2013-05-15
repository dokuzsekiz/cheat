--- 
form_for: |-
  form_for :table do |table|
    table.label :table_field
    table.text_field :table_field
    table.text_area :table_field
  
    table.hidden_field :table_field
    table.email_field :table_field
    table.password_field :table_field
    table.phone_field :table_field
    table.search_field :table_field
    table.telephone_field :table_field
    table.url_field :table_field
  
    table.number_field :table_field
    table.range_field :table_field
  
    table.check_box :table_field
    table.radio_button :table_field, :table_field2
  
    table.submit :table_field
  end
