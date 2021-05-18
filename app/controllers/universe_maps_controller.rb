class UniverseMapsController < PlayerController
  def index
    @map_url = system_maps_path(format: :json)
  end
end
