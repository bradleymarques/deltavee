class FleetsController < PlayerController
  def index
    @pagy, @fleets = pagy(policy_scope(Fleet))
  end
end
