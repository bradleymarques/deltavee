class SystemDataController < PlayerController
  before_action :set_search_parameters, only: [:index]

  def index
    respond_to do |format|
      format.json do
        systems = System
          .where("x <= ?", @x + @radius)
          .where("x >= ?", @x - @radius)
          .where("y <= ?", @y + @radius)
          .where("y >= ?", @y - @radius)
          .where("z <= ?", @z + @radius)
          .where("z >= ?", @z - @radius)

        render(status: :ok, json: SystemMapSerializer.new(systems).to_h)
      end
    end
  end

  private

  def set_search_parameters
    @x = params.require(:x).to_f
    @y = params.require(:y).to_f
    @z = params.require(:z).to_f
    @radius = params.require(:radius).to_f
  end
end
