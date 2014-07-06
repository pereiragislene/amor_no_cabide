class AddLatitudeToPonto < ActiveRecord::Migration
  def change
    add_column :pontos, :latitude, :float
  end
end
