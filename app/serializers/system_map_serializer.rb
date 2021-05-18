class SystemMapSerializer
  def initialize(systems)
    @systems = systems
  end

  def to_h
    {
      systems: @systems.map { |system| serialize(system) }.reduce(),
      meta: {
        total: @systems.count
      }
    }
  end

  private

  def serialize(system)
    {
      name: system.name,
      x: system.x,
      y: system.y,
      z: system.z
    }
  end
end
