class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer :creator_id, null: false
      t.string :name, null: false
      t.string :description, :limit => 140

      t.timestamps
    end
  end
end
