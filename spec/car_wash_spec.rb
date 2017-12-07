require_relative '../car_wash.rb'

RSpec.describe "CarWash" do
  before :each do
    @rows = 3
    @cols = 3
    @car_a = Car.new('A')
    @car_wash = CarWash.new(@rows, @cols)
  end

  it "should be able to be initialized with row, and col" do
    expect(@car_wash.class.name).to eq("CarWash")
  end

  it "should be initialized new @rows x @cols" do
    expect(@car_wash.matrix).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
  end

  describe "to_s method" do
    context "when initialized" do
      it "prints any empty (nil) elements with dash (-)" do
        expect(@car_wash.to_s).to eq("| - - - |\n| - - - |\n| - - - |\n")
      end
    end

    context "with unwashed cars" do
      it "prints unwashed cars and any empty (nil) elements with dash (-)" do
        car_a = Car.new('A')
        @car_wash.park_car(car_a)
        expect(@car_wash.to_s).to eq("| A - - |\n| - - - |\n| - - - |\n")
      end
    end
  end

  describe "park_car(car) method" do
    before :each do
      @car_wash2 = CarWash.new(2, 2)
      @car_a = Car.new('A')
      @car_b = Car.new('B')
      @car_c = Car.new('C')
      @car_d = Car.new('D')
      @car_e = Car.new('E')
    end
    context "with valid attribute" do
      it "should insert new car to the parking area" do
        @car_wash2.park_car(@car_a)
        expect(@car_wash2.car_queue.elements).to eq([@car_a, nil, nil, nil])
      end
    end
    context "when parking space is full" do
      it "should return message 'parking space is full'" do
        @car_wash2.park_car(@car_a)
        @car_wash2.park_car(@car_b)
        @car_wash2.park_car(@car_c)
        @car_wash2.park_car(@car_d)
        expect(@car_wash2.park_car(@car_e)).to eq('parking space is full')
      end
    end
  end

  describe "wash_car(car) method" do
    before :each do
      @car_wash3 = CarWash.new(2, 2)
      @car_a = Car.new('A')
      @car_b = Car.new('B')
      @car_c = Car.new('C')
      @car_d = Car.new('D')
      @car_e = Car.new('E')
    end

    context "with valid attribute" do
      it "should wash the earliest incoming car" do
        @car_wash3.park_car(@car_a)
        @car_wash3.park_car(@car_b)
        @car_wash3.park_car(@car_c)
        @car_wash3.park_car(@car_d)
        expect(@car_wash3.wash_car).to eq(@car_a)
      end
    end
    context "after washed a car, then park new car, then wash car again" do
      it "should wash the earlier car (in this case is car_b)" do
        @car_wash3.park_car(@car_a)
        @car_wash3.park_car(@car_b)
        @car_wash3.park_car(@car_c)
        @car_wash3.park_car(@car_d)
        @car_wash3.wash_car
        @car_wash3.park_car(@car_e)
        expect(@car_wash3.wash_car).to eq(@car_b)
      end
    end
    context "when parking space is empty" do
      it "should return message 'parking space is empty'" do
        expect(@car_wash3.wash_car).to eq('parking space is empty')
      end
    end
  end

  describe "unwashed_cars methods" do
    it "should be able to display list of the order how cars in the parking space will be processed" do
      car_wash4 = CarWash.new(2, 2)
      car_a = Car.new('A')
      car_b = Car.new('B')
      car_c = Car.new('C')
      car_d = Car.new('D')
      car_e = Car.new('E')
      car_wash4.park_car(car_a)
      car_wash4.park_car(car_b)
      car_wash4.park_car(car_c)
      car_wash4.park_car(car_d)
      car_wash4.wash_car
      car_wash4.park_car(car_e)
      expect(car_wash4.unwashed_cars).to eq('The order of cars to be washed next are: B, C, D, E')
    end
  end

  describe "washed_cars methods" do
    it "should be able to display list of the order how cars in the parking space will be processed" do
      car_wash4 = CarWash.new(2, 2)
      car_a = Car.new('A')
      car_b = Car.new('B')
      car_c = Car.new('C')
      car_d = Car.new('D')
      car_e = Car.new('E')
      car_wash4.park_car(car_a)
      car_wash4.park_car(car_b)
      car_wash4.park_car(car_c)
      car_wash4.park_car(car_d)
      car_wash4.wash_car
      car_wash4.park_car(car_e)
      expect(car_wash4.washed_cars).to eq('These cars have been washed: A')
    end
  end
end
