class ChangeColumn1 < ActiveRecord::Migration[5.0]
  def change
    change_column :histories, :phone, :string
  end
end
