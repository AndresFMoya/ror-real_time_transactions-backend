class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :author_id, null: false
      t.integer :group_id, null:true
      t.decimal :amount, null:false
      t.string :description, limit: 40

      t.timestamps
    end
  end
end
