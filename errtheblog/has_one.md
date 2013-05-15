--- 
has_one: "Options for has_one:\n\n\
  :class_name - specify the class name of the association. Use it only if that name can't be inferred from the association name. So has_one :manager will by default be linked to the Manager class, but if the real class name is Person, you'll have to specify it with this option.\n\n\
  :conditions - specify the conditions that the associated object must meet in order to be included as a \"WHERE\" sql fragment, such as \"rank = 5\".\n\n\
  :order - specify the order from which the associated object will be picked at the top. Specified as an \"ORDER BY\" sql fragment, such as \"last_name, first_name DESC\"\n\n\
  :dependent - if set to :destroy (or true) all the associated objects are destroyed when this object is. Also, association is assigned.\n\n\
  :foreign_key - specify the foreign key used for the association. By default this is guessed to be the name of this class in lower-case and \"_id\" suffixed. So a Person class that makes a has_one association will use \"person_id\" as the default foreign_key.\n\n\
  :include - specify second-order associations that should be eager loaded when this object is loaded."
