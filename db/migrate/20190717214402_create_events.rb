class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
