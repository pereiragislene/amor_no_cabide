class CreatePontos < ActiveRecord::Migration
  def change
    create_table :pontos do |t|
      t.float :latitude
      t.float :longitude
      t.string :logradouro
      t.string :cidade
      t.string :estado
      t.string :cep

      t.timestamps
    end
  end
end
