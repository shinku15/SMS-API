class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :mobiles, :number, :integer, limit: 10
  end
end
