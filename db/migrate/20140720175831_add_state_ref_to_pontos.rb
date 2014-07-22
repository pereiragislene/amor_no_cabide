class AddStateRefToPontos < ActiveRecord::Migration
  def change
    add_reference :pontos, :state, index: true
  end
end
