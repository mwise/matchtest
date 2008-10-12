class MatchableAttribution < ActiveRecord::Base
  belongs_to :person
  belongs_to :matchable_attribute
end
