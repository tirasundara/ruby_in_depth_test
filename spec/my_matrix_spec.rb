require_relative '../my_matrix.rb'

describe "MyMatrix" do
  before :each do
    @rows = 2
    @cols = 2
    @matrix = MyMatrix.new(@rows, @cols)
    @matrix2 = MyMatrix.new(@rows, @cols)
  end

  it "should be able to be initialized with row, and col" do
    expect(@matrix.class.name).to eq("MyMatrix")
  end

  it "should be initialized new @rows x @cols matrix" do
    expect(@matrix.matrix).to eq([[nil, nil], [nil, nil]])
  end

  it "can be assigned using matrix[row, col] = something" do
    @matrix[2, 2] = 99
    expect(@matrix[2, 2]).to eq(99)
  end

  it "prints matrix with any empty(nil) elements of a matrix will be printed as '-'" do
    @matrix[1, 1] = 1
    @matrix[1, 2] = 2
    @matrix[2, 1] = nil
    @matrix[2, 2] = 4
    expect(@matrix.to_s).to eq("| 1 2 |\n| - 4 |\n")
  end

  describe "scalar multiplication" do
    context "with valid matrix (all numeric)" do
      it "can do scalar multiplication" do
        @matrix[1, 1] = 1
        @matrix[1, 2] = 2
        @matrix[2, 1] = 3
        @matrix[2, 2] = 4
        expect(@matrix * 2).to eq([[2, 4], [6, 8]])
      end
    end
    context "with invalid matrix" do
      it "should return nil without save any changes to current matrix" do
        @matrix[1, 1] = 1
        @matrix[1, 2] = 2
        @matrix[2, 1] = "a"
        @matrix[2, 2] = 4
        expect(@matrix * 2).to eq(nil)
      end
    end
  end

  describe "Addition between two matrix" do
    context "with valid attributes" do
      it "can do addition between two matrix" do
        @matrix[1, 1] = 1
        @matrix[1, 2] = 2
        @matrix[2, 1] = 3
        @matrix[2, 2] = 4

        @matrix2[1, 1] = 2
        @matrix2[1, 2] = 3
        @matrix2[2, 1] = 4
        @matrix2[2, 2] = 5

        expect(@matrix + @matrix2).to eq([[3, 5], [7, 9]])
    end
    context "with invalid attributes" do
      it "should return nil without save any changes to current matrix" do
        @matrix[1, 1] = 1
        @matrix[1, 2] = 2
        @matrix[2, 1] = 3
        @matrix[2, 2] = 4

        @matrix2[1, 1] = 2
        @matrix2[1, 2] = 3
        @matrix2[2, 1] = "a"
        @matrix2[2, 2] = 5

        expect(@matrix + @matrix2).to eq(nil)
      end
    end
  end
  end
end
