class Person < ActiveRecord::Base
  has_many :matchable_attributes, :through=>:matchable_attributions
  has_many :matchable_attributions, :foreign_key=>:matchable_id
  
  def matchable_columns
    cols = []
    self.class.columns.each do |column|
      if column.type.to_s == 'integer' and column.name.to_s != 'id'
        cols << column
      end
    end
    cols
  end
  
  def self.find_matches
    
  end
  
end
