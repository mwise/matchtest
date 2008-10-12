class MatchableAttribute < ActiveRecord::Base
  has_many :persons, :through=>:matchable_attributions

end
