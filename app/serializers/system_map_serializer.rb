class SystemMapSerializer
  def initialize(systems)
    @systems = systems
  end

  def to_h
    {
      system_data: @systems.map { |system| serialize(system) },
      meta: {
        total: @systems.count
      }
    }
  end

  private

  def serialize(system)
    {
      id: system.id,
      name: system.name,
      x: system.x,
      y: system.y,
      z: system.z
    }
  end
end
