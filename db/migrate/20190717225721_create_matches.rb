class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
    	t.references :event, foreign_key: true
      t.datetime :date_start

      # Opponents/Teams
      t.references :radiant
      t.references :dire

      t.timestamps
    end
  end
end
