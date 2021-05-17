module Link
  class FleetLink < BaseLink
    def text
      name.truncate(40)
    end

    def path
      fleet_path(model)
    end
  end
end
