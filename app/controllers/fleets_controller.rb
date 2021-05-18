class FleetsController < PlayerController
  def index
    @pagy, @fleets = pagy(policy_scope(Fleet))
  end

  def show
    @fleet = Fleet.find(params.require(:id))
    authorize(@fleet)
  end
end
