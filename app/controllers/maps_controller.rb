class MapsController < RestrictedAccessController
  def show
    gon.push({ url: systems_url(format: :json) })
  end
end
