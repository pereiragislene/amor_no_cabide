class AddLongitudeToPonto < ActiveRecord::Migration
  def change
    add_column :pontos, :longitude, :float
  end
end
