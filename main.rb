require_relative './my_matrix.rb'
require_relative './car_wash.rb'

puts "Ruby in dept Test\n"
puts "No.1. My MyMatrix\n"

puts ""
puts "Initialize new matrix..."
matrix = MyMatrix.new(2, 2)
puts matrix

puts ""
puts "Assigning values to Matrix..."
puts "matrix[1, 1] = 1"
matrix[1, 1] = 1
puts "matrix[1, 2] = 'a'"
matrix[1, 2] = "a"
puts "matrix[2, 1] = 2"
matrix[2, 1] = 2
puts "matrix[2, 2] = nil"
matrix[2, 2] = nil

puts ""
puts "Printing matrix..."
puts matrix

puts ""
puts "Scalar Multiplication..."
matrix[1, 1] = 1
matrix[1, 2] = 2
matrix[2, 1] = 3
matrix[2, 2] = 4
puts "current matrix:"
puts matrix
puts "matrix * 2"
matrix * 2
puts matrix

puts ""
puts "Addition between two matrixes"
another_matrix = MyMatrix.new(2, 2)
another_matrix[1, 1] = 1
another_matrix[1, 2] = 1
another_matrix[2, 1] = 1
another_matrix[2, 2] = 1
puts "matrix:"
puts matrix
puts "another_matrix:"
puts another_matrix
puts "matrix + another_matrix"
matrix + another_matrix
puts matrix

puts ""
puts ""
puts "No.2. CarWash"
puts ""
puts "Initialize new CarWash..."
cw = CarWash.new(3, 3)
puts cw
car_a = Car.new('A')
car_b = Car.new('B')
car_c = Car.new('C')
car_d = Car.new('D')
car_e = Car.new('E')
car_f = Car.new('F')
car_g = Car.new('G')
car_h = Car.new('H')
car_i = Car.new('I')
dummy_car = Car.new('Z')

puts ""
puts "Parking new car..."
cw.park_car(car_a)
cw.park_car(car_b)
cw.park_car(car_c)
cw.park_car(car_d)
cw.park_car(car_e)
cw.park_car(car_f)
cw.park_car(car_g)
cw.park_car(car_h)
cw.park_car(car_i)
puts cw
puts "is parkring space full?"
puts cw.park_car(car_i)

puts ""
puts "Washing some cars..."
cw.wash_car
cw.wash_car
puts cw
puts cw.washed_cars
puts cw.unwashed_cars

puts ""
puts "Before we wash the next car, suddenly a new car entered into the parking area..."
cw.park_car(dummy_car)
puts cw
puts cw.unwashed_cars

puts ""
puts "Washing again..."
cw.wash_car
cw.wash_car
cw.wash_car
cw.wash_car
cw.wash_car
cw.wash_car
puts cw
puts cw.washed_cars
puts cw.unwashed_cars

puts ""
puts "Let's wash remaining cars...done"
cw.wash_car
cw.wash_car
puts cw
puts cw.washed_cars

puts ""
puts "Is there still a car to wash?"
puts cw.wash_car
