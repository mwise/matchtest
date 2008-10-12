module ActiveRecord
  module Acts #:nodoc:
    module Matchable #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      # This +acts_as_matchable+ extension provides the capabilities for matching .
      # The class that has this specified needs to have a +position+ column defined as an integer on
      # the mapped database table.
      #
      # Truck  example:
      #
      #   class Truck < ActiveRecord::Base
      #     acts_as_matchable :todo_items, :order => "position"
      #   end
      #
      module ClassMethods
        # Configuration options are:
        # 
        # 
        #   Example: <tt>acts_as_matchable</tt>
        def acts_as_matchable(options = {})
         # configuration = { :column => "position", :scope => "1 = 1" }
         # configuration.update(options) if options.is_a?(Hash)
         # 
         # configuration[:scope] = "#{configuration[:scope]}_id".intern if configuration[:scope].is_a?(Symbol) && configuration[:scope].to_s !~ /_id$/
         # 
         # if configuration[:scope].is_a?(Symbol)
         #   scope_condition_method = %(
         #     def scope_condition
         #       if #{configuration[:scope].to_s}.nil?
         #         "#{configuration[:scope].to_s} IS NULL"
         #       else
         #         "#{configuration[:scope].to_s} = \#{#{configuration[:scope].to_s}}"
         #       end
         #     end
         #   )
         # else
         #   scope_condition_method = "def scope_condition() \"#{configuration[:scope]}\" end"
         # end
         # 
          class_eval <<-EOV
            include ActiveRecord::Acts::Matchable::InstanceMethods

            def acts_as_matchable_class
              ::#{self.name}
            end





          EOV
        end
      end

      # All the methods available to a record that has had <tt>acts_as_list</tt> specified. Each method works
      # by assuming the object to be the item in the list, so <tt>chapter.move_lower</tt> would move that chapter
      # lower in the list of all chapters. Likewise, <tt>chapter.first?</tt> would return +true+ if that chapter is
      # the first in the list of all chapters.
      module InstanceMethods
        # Insert the item at the given position (defaults to the top position of 1).
        def self.get_schema_info(klass, header)
           info = "# #{header}\n#\n"
           info << "# Table name: #{klass.table_name}\n#\n"

           max_size = klass.column_names.collect{|name| name.size}.max + 1
           klass.columns.each do |col|
             attrs = []
             attrs << "default(#{quote(col.default)})" if col.default
             attrs << "not null" unless col.null
             attrs << "primary key" if col.name == klass.primary_key

             col_type = col.type.to_s
             if col_type == "decimal"
               col_type << "(#{col.precision}, #{col.scale})"
             else
               col_type << "(#{col.limit})" if col.limit
             end 
             info << sprintf("#  %-#{max_size}.#{max_size}s:%-15.15s %s", col.name, col_type, attrs.join(", ")).rstrip
             info << "\n"
           end

           info << "#\n\n"
         end

         def matchable_dimensions
           dimensions = .get_schema_info
           dimensions
         end


         # Add a schema block to a file. If the file already contains
         # a schema info block (a comment starting
         # with "Schema as of ..."), remove it first.

         def self.annotate_one_file(file_name, info_block)
           if File.exist?(file_name)
             content = File.read(file_name)

             # Remove old schema info
             content.sub!(/^# #{PREFIX}.*?\n(#.*\n)*\n/, '')

             # Write it back
             File.open(file_name, "w") { |f| f.puts info_block + content }
           end
         end

         # Given the name of an ActiveRecord class, create a schema
         # info block (basically a comment containing information
         # on the columns and their types) and put it at the front
         # of the model and fixture source files.


         def self.annotate(klass, header)
           info = get_schema_info(klass, header)

           #model_file_name = File.join(MODEL_DIR, klass.name.underscore + ".rb")
           #annotate_one_file(model_file_name, info)
           #
           #if File.join(RAILS_ROOT, "spec")
           #  rspec_file_name = File.join(RSPEC_DIR, klass.name.underscore + "_spec.rb")
           #  annotate_one_file(rspec_file_name, info)
           #
           #  rspec_fixture = File.join(RSPEC_FIXTURES, klass.table_name + ".yml")
           #  annotate_one_file(rspec_fixture, info)
           #end
           #
           #Dir.glob(File.join(FIXTURE_DIR, "**", klass.table_name + ".yml")) do | fixture_file_name |
           #  annotate_one_file(fixture_file_name, info)
           #end
         end
        

        private
      end 
    end
  end
end




