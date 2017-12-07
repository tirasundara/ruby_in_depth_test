class MyMatrix
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @matrix = Array.new(@rows).map { Array.new(@cols) }
  end

  def []=(row, col, value)
    @matrix[row-1][col-1] = value
  end

  def [](row, col)
    @matrix[row-1][col-1]
  end

  def *(multiplier)
    return nil if !@matrix.flatten.all? { |e| e.is_a?(Numeric) } || !multiplier.is_a?(Numeric)
    res = []
    @matrix.each do |a, b|
      res << [(a * multiplier), (b * multiplier)]
    end
    @matrix = res
  end

  def +(another_matrix)
    return nil if !@matrix.flatten.all? { |e| e.is_a?(Numeric) } || !another_matrix.matrix.flatten.all? { |e| e.is_a?(Numeric) }
    res = []
    @matrix.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        @matrix[row_index][col_index] += another_matrix.matrix[row_index][col_index]
      end
    end
    @matrix
  end

  def matrix
    @matrix
  end

  def to_s
    str = ""
    temp_arr = []
    convert_nil_to_dash = @matrix.flatten.map { |element| element.nil? ? '-' : element }
    convert_nil_to_dash.each_slice(@cols) do |row|
      temp_arr << row
    end
    temp_arr.each do |row|
      str += "| "
      str += row.join(' ')
      str += " |\n"
    end
    str
  end
end
