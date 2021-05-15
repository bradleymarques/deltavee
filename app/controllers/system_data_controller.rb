class SystemDataController < RestrictedAccessController
  def index
    respond_to do |format|
      format.json do
        payload = build_payload

        render(status: :ok, json: payload)
      end
    end
  end

  def build_payload
    {
      name: System.pluck(:name),
      x: System.pluck(:x),
      y: System.pluck(:y),
      z: System.pluck(:z),
      absolute_magnitude: System.pluck(:absolute_magnitude)
    }
  end
end
