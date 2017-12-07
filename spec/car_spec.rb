require_relative '../car.rb'

describe "Car" do
  before :each do
    @car = Car.new('A')
  end

  it "should be able to be initialized a name" do
    expect(@car.class.name).to eq("Car")
  end

  it "should return the name attributes" do
    expect(@car.name).to eq('A')
  end

  it "should initialize arrived_time's attribute with Time" do
    @car_b = Car.new(name = 'B')
    expect(@car_b.arrived_time.class).to eq(Time)
  end

end
