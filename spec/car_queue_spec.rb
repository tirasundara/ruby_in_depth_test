require_relative '../car_queue.rb'
require_relative '../car.rb'

describe "CarQueue" do
  before :each do
    @q = CarQueue.new(9)
  end

  it "should be able to be initialized a size" do
    expect(@q.class.name).to eq("CarQueue")
  end

  it "should return the length of the queue" do
    expect(@q.size).to eq(9)
  end

  it "should return queue elements" do
    expect(@q.elements).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
  end

  describe "enqueue method" do
    before :each do
      @car_a = Car.new('A')
      @car_b = Car.new('B')
      @car_c = Car.new('C')
      @car_d = Car.new('D')
      @car_queue = CarQueue.new(4)
    end

    context "with valid attribute before invoke dequeue" do
      it "should enqueue new item to the nil element from the left side" do
        @car_queue.enqueue(@car_a)
        expect(@car_queue.elements).to eq([@car_a, nil, nil, nil])
      end
      it "should be enqueued next to earlier item" do
        @car_queue.enqueue(@car_a)
        @car_queue.enqueue(@car_b)
        expect(@car_queue.elements).to eq([@car_a, @car_b, nil, nil])
      end
    end

    context "with valid attribute after invoke dequeue" do
      it "should be enqueued to the nil element from the left" do
        @car_queue.enqueue(@car_a)
        @car_queue.enqueue(@car_b)
        @car_queue.enqueue(@car_c)
        @car_queue.enqueue(@car_d)
        @car_queue.dequeue
        car_e = Car.new('E')
        @car_queue.enqueue(car_e)
        expect(@car_queue.elements).to eq([car_e, @car_b, @car_c, @car_d])
      end
    end

    context "with invalid attribute" do
      it "should return nil" do
        expect(@car_queue.enqueue(nil)).to eq(nil)
      end
    end
  end

  describe "dequeue method" do
    before :each do
      @car_a = Car.new('A')
      @car_b = Car.new('B')
      @car_c = Car.new('C')
      @car_d = Car.new('D')
      @car_queue = CarQueue.new(4)
      @car_queue.enqueue(@car_a)
      @car_queue.enqueue(@car_b)
      @car_queue.enqueue(@car_c)
      @car_queue.enqueue(@car_d)
    end
    context "dequeue the first incoming item" do
      it "should dequeue the car_a" do
        expect(@car_queue.dequeue).to eq(@car_a)
      end
    end
    context "after dequea car_a, then we enqueue car_e, then we invoke dequeue again" do
      it "should dequeue the car_b" do
        @car_queue.dequeue          # dequeue car_a
        car_e = Car.new('E')
        @car_queue.enqueue(car_e)   # enqueue car_e
        expect(@car_queue.dequeue).to eq(@car_b)
      end
    end
  end
end
