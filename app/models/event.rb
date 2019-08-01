class Event < ApplicationRecord
	has_many :matches, dependent: :delete_all

  has_many :dire,     through: :matches, :source => "dire"
  has_many :radiant,  through: :matches, :source => "radiant"

  has_attached_file :image, styles: { large: "500x500#", medium: "100x100#", 
            thumb: "50x50%" }
  validates_attachment_content_type :image, 
            :content_type => [
              "image/jpg", 
              "image/jpeg", 
              "image/png"] 

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 120}
  validates :date_start, presence: true
  validates :date_end, presence: true

  def teams
    teams_ol = []
    teams_ul = self.dire_ids + self.radiant_ids
    teams_ul.each do |team|
      if !teams_ol.include? team
        teams_ol << team
      end
    end
    Team.where(id: teams_ol).order(:name)
  end                       
end
