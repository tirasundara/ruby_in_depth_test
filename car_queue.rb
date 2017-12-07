require_relative './car.rb'

class CarQueue
  attr_accessor :size, :elements

  def initialize(size)
    @size = size
    @elements = Array.new(@size)
  end

  def to_s
    "size: #{@size}, elements: #{@elements}"
  end

  def enqueue(item)
    if full? || item.nil?
      return nil
    else
      # puts first_nil_index
      @elements[first_nil_index] = item
      self
    end
  end

  def dequeue
    if empty?
      return nil
    else
      nil_indexes = @elements.each_index.select { |i| @elements[i].nil? }
      @elements = @elements.reject { |element| element.nil? }
      arrived_times = @elements.map { |element| element.arrived_time }
      dequeued_index = @elements.index { |element| element.arrived_time == arrived_times.min }
      dequeued_item = @elements[dequeued_index]
      @elements[dequeued_index] = nil
      nil_indexes.each { |i| @elements[i, 0] = nil }
      dequeued_item
    end
  end

  private
  
  def earlier_item_index
    arrived_times = elements.reject { |element| element.nil? }.map { |element| element.arrived_time }
    earlier_item = arrived_times.min
    @elements.index { |element| element.arrived_time == earlier_item }
  end

  def first_nil_index
    @elements.index(nil)
  end

  def empty?
    @elements.all? { |element| element.nil? }
  end

  def full?
    @elements.none? { |element| element.nil? }
  end

end
