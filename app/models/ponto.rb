class Ponto < ActiveRecord::Base
  belongs_to :state
  geocoded_by :address
  after_validation :geocode


  validates_presence_of :logradouro, :message => " - deve ser preenchido"
  validates_presence_of :cidade, :message => " - deve ser preenchido"
  validates_presence_of :state, :message => " - deve ser preenchido"

  def address
    #MyModel.find(Filter.find_by_name(params[:filter_name]).options)
    
    state_name ||= state.name unless state.nil?
    [logradouro, cidade, state_name].reject(&:blank?).compact.join(', ')
  end


  #scope :contains, -> (cidade) { where("cidade like ?", "#{cidade}%")}
    #scope :contains, -> (cidade) { where("cidade like ?", "#{cidade}%")}

end
