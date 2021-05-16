class MapsController < PlayerController
  def show
    gon.push({ url: system_data_url(format: :json) })
  end
end
