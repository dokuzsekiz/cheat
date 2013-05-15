--- 
acts_as_taggable_on: "Installing\r\n\
  0. old: (script/plugin install git://github.com/mbleigh/acts-as-taggable-on.git)\r\n\
  1. gem install \"acts-as-taggable-on\"\r\n\
  2. run the initializer to create the tables\r\n\
  \r\n\
  3. add to \"class Post < ActiveRecord::Base\" [or whatever class]:\r\n\
  >> acts_as_taggable\r\n\
  >> acts_as_taggable_on :skills, :interests [if you want contexts]\r\n\
  \r\n\
  \r\n\
  How To Use (these are not all the methods from each class, just the most useful ones)\r\n\
  ----------\r\n\
  \r\n\
  Class TagList\r\n\
  \r\n    # Returns a new TagList using the given tag string.\r\n    # Example:\r\n    #   tag_list = TagList.from(\"One , Two,  Three\")\r\n    #   tag_list # [\"One\", \"Two\", \"Three\"]\r\n\
  \r\n    # Add tags to the tag_list. Duplicate or blank tags will be ignored.\r\n    # Use the <tt>:parse</tt> option to add an unparsed tag string.\r\n    # Example:\r\n    #   tag_list.add(\"Fun\", \"Happy\")\r\n    #   tag_list.add(\"Fun, Happy\", :parse => true)\r\n\
  \r\n    # Remove specific tags from the tag_list.\r\n    # Use the <tt>:parse</tt> option to add an unparsed tag string.\r\n    # Example:\r\n    #   tag_list.remove(\"Sad\", \"Lonely\")\r\n    #   tag_list.remove(\"Sad, Lonely\", :parse => true)\r\n\
  \r\n    # Transform the tag_list into a tag string suitable for edting in a form.\r\n    # The tags are joined with <tt>TagList.delimiter</tt> and quoted if necessary.\r\n    # Example:\r\n    #   tag_list = TagList.new(\"Round\", \"Square,Cube\")\r\n    #   tag_list.to_s # 'Round, \"Square,Cube\"'\r\n\
  \r\n\
  \r\n\
  Class Tag\r\n    def self.named(name)\r\n      where([\"name #{like_operator} ?\", name])\r\n    end\r\n  \r\n    def self.named_any(list)\r\n      where(list.map { |tag| sanitize_sql([\"name #{like_operator} ?\", tag.to_s]) }.join(\" OR \"))\r\n    end\r\n  \r\n    def self.named_like(name)\r\n      where([\"name #{like_operator} ?\", \"%#{name}%\"])\r\n    end\r\n\
  \r\n    def self.named_like_any(list)\r\n      where(list.map { |tag| sanitize_sql([\"name #{like_operator} ?\", \"%#{tag.to_s}%\"]) }.join(\" OR \"))\r\n    end\r\n\
  \r\n\
  \r\n\
  Class Collection\r\n      # Calculate the tag counts for all tags.\r\n      #\r\n      # @param [Hash] options Options:\r\n      # * :start_at   - Restrict the tags to those created after a certain time\r\n      # * :end_at     - Restrict the tags to those created before a certain time\r\n      # * :conditions - A piece of SQL conditions to add to the query\r\n      # * :limit      - The maximum number of tags to return\r\n      # * :order      - A piece of SQL to order by. Eg 'tags.count desc' or 'taggings.created_at desc'\r\n      # * :at_least   - Exclude tags with a frequency less than the given value\r\n      # * :at_most    - Exclude tags with a frequency greater than the given value\r\n      # * :on         - Scope the find to only include a certain context\r\n\
  \r\n\
  \r\n\
  Class Core\r\n      ##\r\n      # Return a scope of objects that are tagged with the specified tags.\r\n      #\r\n      # @param tags The tags that we want to query for\r\n      # @param [Hash] options A hash of options to alter you query:\r\n      #                       * <tt>:exclude</tt> - if set to true, return objects that are *NOT* tagged with the specified tags\r\n      #                       * <tt>:any</tt> - if set to true, return objects that are tagged with *ANY* of the specified tags\r\n      #                       * <tt>:match_all</tt> - if set to true, return objects that are *ONLY* tagged with the specified tags\r\n      #\r\n      # Example:\r\n      #   User.tagged_with(\"awesome\", \"cool\")                     # Users that are tagged with awesome and cool\r\n      #   User.tagged_with(\"awesome\", \"cool\", :exclude => true)   # Users that are not tagged with awesome or cool\r\n      #   User.tagged_with(\"awesome\", \"cool\", :any => true)       # Users that are tagged with awesome or cool\r\n      #   User.tagged_with(\"awesome\", \"cool\", :match_all => true) # Users that are tagged with just awesome and cool\r\n\
  \r\n      def tag_list_on(context)\r\n        add_custom_context(context)\r\n        tag_list_cache_on(context)\r\n      end\r\n\
  \r\n      def all_tags_list_on(context)\r\n        variable_name = \"@all_#{context.to_s.singularize}_list\"\r\n        return instance_variable_get(variable_name) if instance_variable_get(variable_name)\r\n        instance_variable_set(variable_name, ActsAsTaggableOn::TagList.new(all_tags_on(context).map(&:name)).freeze)\r\n      end\r\n\
  \r\n      ##\r\n      # Returns all tags of a given context\r\n      def all_tags_on(context)\r\n        tag_table_name = ActsAsTaggableOn::Tag.table_name\r\n        tagging_table_name = ActsAsTaggableOn::Tagging.table_name\r\n\
  \r\n        opts =  [\"#{tagging_table_name}.context = ?\", context.to_s]\r\n        base_tags.where(opts).order(\"max(#{tagging_table_name}.created_at)\").group(\"#{tag_table_name}.id, #{tag_table_name}.name\").all\r\n      end\r\n\
  \r\n\
  \r\n\
  Class Acts_as_Tagger\r\n\
  \r\n      # Tag a taggable model with tags that are owned by the tagger. \r\n      #\r\n      # @param taggable The object that will be tagged\r\n      # @param [Hash] options An hash with options. Available options are:\r\n      #               * <tt>:with</tt> - The tags that you want to\r\n      #               * <tt>:on</tt>   - The context on which you want to tag\r\n      #\r\n      # Example:\r\n      #   @user.tag(@photo, :with => \"paris, normandy\", :on => :locations)\r\n\
  \r\n\
  \r\n\
  \r\n\
  \r\n\
  \r\n\
  \r\n\
  \r\n\
  \r\n\
  -----\r\n\
  \r\n\
  class User < ActiveRecord::Base\r\n  acts_as_taggable_on :tags, :skills, :interests, :sports\r\n\
  end\r\n\
  \r\n\
  @user = User.new(:name => \"Bobby\")\r\n\
  @user.tag_list = \"awesome, slick, hefty\"      # this should be familiar\r\n\
  @user.skill_list = \"joking, clowning, boxing\" # but you can do it for any context!\r\n\
  @user.skill_list # => [\"joking\",\"clowning\",\"boxing\"] as TagList\r\n\
  @user.save\r\n\
  \r\n\
  @user.tags # => [<Tag name:\"awesome\">,<Tag name:\"slick\">,<Tag name:\"hefty\">]\r\n\
  @user.skills # => [<Tag name:\"joking\">,<Tag name:\"clowning\">,<Tag name:\"boxing\">]\r\n\
  \r\n\
  User.tagged_with(\"awesome\") # => [@user]\r\n\
  User.tagged_with(\"joking\") # => [@user]\r\n\
  User.tagged_with(\"awesome\", :on => :tags) # => [@user]\r\n\
  User.tagged_with(\"awesome\", :on => :skills) # => []\r\n\
  \r\n\
  @frankie = User.create(:name => \"Frankie\", :skill_list => \"joking, flying, eating\")\r\n\
  User.skill_counts # => [<Tag name=\"joking\" count=2>,<Tag name=\"clowning\" count=1>...]\r\n\
  \r\n\
  @bobby.skill_counts\r\n\
  @frankie.skill_counts\r\n\
  \r\n\
  (http://www.intridea.com/2007/12/4/announcing-acts_as_taggable_on)\r\n\
  \r\n\
  -----\r\n\
  \r\n\
  # acts_as_taggable_on\r\n ###################\r\n\
  \r\n\
  # EXAMPLE\r\n ####################\r\n\
  \r\n\
  class Record \xE2\x80\x9Carchive\xE2\x80\x9D\r\n @rec.mytag_list = \xE2\x80\x9Cboring, boxy, brown\xE2\x80\x9D # Sets tag list\r\n @rec.tags # => [,,]\r\n\
  \r\n\
  # AR RELATIONSHIPS:\r\n ####################\r\n @rec.mytag_taggings # References related records on \xE2\x80\x9Ctaggables\xE2\x80\x9D table\r\n @rec.base_tags # References related records on \xE2\x80\x9Ctags\xE2\x80\x9D table\r\n\
  \r\n\
  # INSTANCE METHODS:\r\n ####################\r\n @rec.tag_types # [:associations, :tags]\r\n @rec.is_taggable? # true\r\n @rec.is_taggable? # confirms if tags can be added?\r\n @rec.custom_contexts # ??\r\n @rec.add_custom_context(value) # ??\r\n @rec.set_tag_list_on(:mytags, \xE2\x80\x9Csome, tags\xE2\x80\x9D) # Context version of tag_list=\r\n @rec.tag_list_on(:mytags) # Context version of tag_list()\r\n @rec.tags_on(:mytags) # Context verison of base_tags()\r\n\
  \r\n\
  # Dynamically created based on tag contexts\r\n @rec.#{tag_type}_list # Context :mytags \xE2\x80\xA6 mytag_list()\r\n @rec.#{tag_type}_list=(new_tags) # Context :mytags \xE2\x80\xA6 mytag_list=\r\n @rec.#{tag_type}_counts(options = {}) # Context :mytags \xE2\x80\xA6 mytag_counts()\r\n @rec.#{tag_type}_from(owner) # Context :mytags \xE2\x80\xA6 mytag_from()\r\n @rec.find_related_#{tag_type}(options = {}) # Context :mytags \xE2\x80\xA6 find_related_mytag\r\n @rec.find_related_#{tag_type}_for(klass, options = {}) # Context :mytags \xE2\x80\xA6 find_related_mytag_for()\r\n @rec.find_related_on_#{tag_type} # Alias of find_related_mytag\r\n @rec.tag_counts_on(:on => :mytag) # Returns tags of the provided context\r\n\
  \r\n\
  @rec.related_search_options #\r\n @rec.reload_with_tag_list #\r\n @rec.save_cached_tag_list # called by :before_save filter\r\n @rec.save_tags # called by :after_save filter\r\n\
  \r\n\
  # SINGLETON METHODS:\r\n ####################\r\n Record.tagged_with(\xE2\x80\x9Cawesome\xE2\x80\x9D,  n => :skills) # Get all tags\r\n Record.find_tagged_with(\xE2\x80\x9Ccomp\xE2\x80\x9D,  n => :tags) # same but does not uses \xE2\x80\x9Cnamed_scope\xE2\x80\x9D\r\n Record.caching_tag_list_on? # Is it in the cache\r\n Record.tag_counts_on(:on => :skills) # Get counts for tag context\r\n Record.find_options_for_find_tagged_with # Gets query options for retrieving\r\n Record.#{tag_type}_counts(options={}) # Context :mytags \xE2\x80\xA6 mytag_counts()\r\n Record.find_options_for_tag_counts(options = {}) # Gets query options for counts\r\n\
  \r\n\
  # CACHING METHODS (incomplete!)\r\n #######################\r\n @rec.caching_#{tag_type.singularize}_list?\r\n @rec.caching_tag_list_on\r\n\
  \r\n\
  ** Looks for column called \xE2\x80\x9Ccached_#{context}_list\xE2\x80\x9D on the acts_as_taggable record table\r\n ** Not tested much by the original author, but should update before saving via filter\r\n\
  \r\n\
  ###################\r\n ## acts_as_tagger\r\n ###################\r\n\
  \r\n\
  # EXAMPLE\r\n ####################\r\n class User \xE2\x80\x9Ccabinet, document\xE2\x80\x9D,  n => :mytags) # adds the tags to @rec in the specified context\r\n @rec.mytags_from(@user) # returns taggings applied by user to @rec\r\n\
  \r\n\
  # AR RELATIONSHIPS:\r\n ####################\r\n\
  \r\n\
  @user.owned_taggings # Returns all \xE2\x80\x9Ctaggings\xE2\x80\x9D belonging to user\r\n @user.owned_tags # Returns all tags by join \xE2\x80\x9Ctaggings\xE2\x80\x9D belonging to user on \xE2\x80\x9Ctags\xE2\x80\x9D[/ruby]\r\n\
  \r\n\
  (http://crunchytoast.com/2009/02/15/return-to-acts_as_taggable_on/)"
