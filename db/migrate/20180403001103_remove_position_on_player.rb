class RemovePositionOnPlayer < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :position
  end
end
