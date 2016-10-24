class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :phone
      t.text :message
      t.text :status

      t.timestamps
    end
  end
end
