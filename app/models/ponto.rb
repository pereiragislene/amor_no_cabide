class Ponto < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def address
    [logradouro, cidade, estado].reject(&:empty?).compact.join(', ')
  end

  validates_presence_of :logradouro, :message => " - deve ser preenchido"
  validates_presence_of :cidade, :message => " - deve ser preenchido"
  validates_presence_of :estado, :message => " - deve ser preenchido"
end
