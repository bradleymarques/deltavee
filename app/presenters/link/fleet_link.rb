module Link
  class FleetLink < BasePresenter
    def to_s
      h.link_to(name, fleet_path(model))
    end
  end
end
