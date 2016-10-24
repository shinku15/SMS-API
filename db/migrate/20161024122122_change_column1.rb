class ChangeColumn1 < ActiveRecord::Migration[5.0]
  def change
    change_column :histories, :phone, :integer, limit: 10
  end
end
