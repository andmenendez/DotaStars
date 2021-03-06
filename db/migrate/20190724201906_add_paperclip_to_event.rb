class AddPaperclipToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column  :events,  :image_file_name,     :string
    add_column  :events,  :image_content_type,  :string
    add_column  :events,  :image_file_size,     :integer
    add_column  :events,  :image_updated_at,    :datetime
  end
end
