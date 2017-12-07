class Car
  attr_accessor :name, :arrived_time

  def initialize(name)
    @name = name
    @arrived_time = Time.now
  end
end
