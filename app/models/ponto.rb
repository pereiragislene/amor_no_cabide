class Ponto < ActiveRecord::Base
  belongs_to :state
  geocoded_by :address
  after_validation :geocode

  auto_strip_attributes :logradouro, :squish => true
  auto_strip_attributes :cidade, :squish => true
  auto_strip_attributes :cep, :squish => true


  validates_presence_of :logradouro, :message => " - deve ser preenchido"
  validates_presence_of :cidade, :message => " - deve ser preenchido"
  validates_presence_of :state_id, :message => " - deve ser preenchido"

  def address
    state_acronym ||= state.acronym unless state.nil?
    [logradouro, cidade, state_acronym].reject(&:blank?).compact.join(', ')
  end
end
