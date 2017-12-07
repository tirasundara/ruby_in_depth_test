require_relative './my_matrix.rb'
require_relative './car_queue.rb'

class CarWash < MyMatrix
  attr_accessor :car_queue

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @parking_area = Array.new(@rows).map { Array.new(@cols) }
    @car_queue = CarQueue.new(@parking_area.flatten.size)
    @unwashed_cars = @car_queue.elements
    @washed_cars = []
  end

  def to_s
    str = ""
    cars_matrix = transform_to_matrix
    cars_matrix.each do |row_of_car|
      str += "| "
      str += row_of_car.join(' ')
      str += " |\n"
    end
    str
  end

  def matrix
    @parking_area
  end

  def park_car(car)
    @car_queue.enqueue(car).nil? ? 'parking space is full' : self
  end

  def wash_car
    washed_car = @car_queue.dequeue
    if washed_car.nil?
      'parking space is empty'
    else
      @washed_cars << washed_car
      @unwashed_cars = @car_queue.elements
      washed_car
    end
  end

  def washed_cars
    str = "These cars have been washed: "
    str += car_names(@washed_cars).join(', ')
  end

  def unwashed_cars
    str = "The order of cars to be washed next are: "
    cars = reject_nil(@unwashed_cars).sort_by { |car| car.arrived_time }
    cars = car_names(cars)
    str += cars.join(', ')
  end

  private

  def reject_nil(array)
    reject_nils = array.reject { |e| e.nil? }
    reject_nils
  end

  def car_names(array)
    # collecting attribute name from an array of Car objects
    # the array element must be a Car object
    array.map { |car| car.nil? ? "-" : car.name }
  end

  def transform_to_matrix
    mat = []
    cars = car_names(@car_queue.elements).each_slice(@cols) { |row| mat << row }
    mat
  end
end

# Trial and errors:
# cw = CarWash.new(3, 3)
# car_a = Car.new('A')
# car_b = Car.new('B')
# car_c = Car.new('C')
# car_d = Car.new('D')
# cw.park_car(car_a)
# cw.park_car(car_b)
# cw.park_car(car_c)
# cw.park_car(car_d)
# puts cw
# p cw.unwashed_cars
# cw.wash_car
# cw.wash_car
# puts "Washing..."
# p cw.washed_cars
# puts cw
# p cw.unwashed_cars
# car_e = Car.new('E')
# puts "Putting new car..."
# cw.park_car(car_e)
# puts cw
# p cw.unwashed_cars
# cw.wash_car
# p cw.washed_cars
# p cw.unwashed_cars
# puts "CW instance: \n#{cw}"

# cw2 = CarWash.new(3, 3)
# puts cw2
