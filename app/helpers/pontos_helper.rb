module PontosHelper
  def state_options
    options_for_select(State.all.map {|s| [s.name, s.id] }, params[:state_id])
  end
end
