module Link
  class FleetLink < BaseLink
    def text
      name.truncate(Link::BaseLink::MAX_LENGTH)
    end

    def path
      fleet_path(model)
    end
  end
end
