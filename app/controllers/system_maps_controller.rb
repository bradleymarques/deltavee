class SystemMapsController < PlayerController
  def index
    respond_to do |format|
      format.json do
        systems = policy_scope(System)
        render(status: :ok, json: SystemMapSerializer.new(systems))
      end
    end
  end
end
