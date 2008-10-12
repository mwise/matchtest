class Person < ActiveRecord::Base
  def matchable_columns
    cols = []
    self.class.columns.each do |column|
      if column.type.to_s == 'integer' and column.name.to_s != 'id'
        cols << column
      end
    end
    cols
  end
  
end
