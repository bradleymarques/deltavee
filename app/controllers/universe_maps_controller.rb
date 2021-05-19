class UniverseMapsController < PlayerController
  def index
    @map_url = system_data_path(
      format: :json,
      x: 0,
      y: 0,
      z: 0,
      radius: 25
    )
  end
end
