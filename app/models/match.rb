class Match < ApplicationRecord
	belongs_to :event
	# 2 Teams
	belongs_to :radiant, 	:class_name => 'Team', foreign_key: "radiant_id"
	belongs_to :dire, 	  :class_name => 'Team', foreign_key: "dire_id"
end
