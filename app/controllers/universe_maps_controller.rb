class UniverseMapsController < PlayerController
  def index
    @map_url = maps_path
  end
end
