class Team < ApplicationRecord
	has_many :radiant_matches, :class_name => 'Match', :foreign_key => 'radiant_id'
	has_many :dire_matches, 	 :class_name => 'Match', :foreign_key => 'dire_id'

	has_many :events, through: :matches
  has_many :players, dependent: :destroy


  has_attached_file :image #, styles: { medium: "200x200#", thumb: "100x100#" }
  validates_attachment_content_type :image, 
            :content_type => [
              "image/jpg", 
              "image/jpeg", 
              "image/png"]

  validates :name, presence: true
  validates :image, presence: true
  
  def matches
    matches = self.radiant_match_ids << self.dire_match_ids
    Match.where(id: matches)
  end

end
