class SystemsController < RestrictedAccessController
  def index
    respond_to do |format|
      format.json do
        payload = build_index_payload
        render(status: :ok, json: payload)
      end
    end
  end

  private

  def build_index_payload
    systems_data = System.first(1000).map do |s|
      { name: s.name, x: s.x_parsecs, y: s.y_parsecs, z: s.z_parsecs }
    end

    {
      data: {
        systems: systems_data
      },
      meta: {
        total: 3,
        per_page: 10,
        page: 1
      }
    }
  end
end
