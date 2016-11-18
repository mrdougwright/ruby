require 'matrix'

class Matrix
  def []=(col,row,num)
    @rows[col,row] = num
  end
end

class Sudoku

  attr_reader :grid

  def initialize
    @grid = []
    9.times { @grid << Matrix.build(3){nil} }

    # @grid = Matrix[[1,2],[3,4]]
  end


  def grid_insert(grid_index, num)
    gridbox = grid_box(grid_index)
    return false if gridbox.flatten.include?(num)
    gridbox.each do |grid_row|
      next unless grid_row.include?(nil)

    end
  end

  def grid_box(grid_index)

  end

  def y_nums(y)
    @grid.map{|f| f[y] }.compact
  end

  def x_nums(x)
    @grid[x].compact
  end

  def insert_number(x, y, num)
    return false unless @grid[x][y].nil?
    @grid[x][y] = num
  end

  def one_thru_nine
    (1..9).map{|f| f}
  end

  def print_grid
    puts "~~~~~~~~~ Sudoku! ~~~~~~~~~"
      @grid.each{ |row| p row }
    puts "^^^^^^^^^ Sudoku! ^^^^^^^^^"
  end
end

Sudoku.new.print_grid
#          y
#        0: 0   1    2,  1:  0   1    2,  2: 0   1    2
#  x  0 [[ c ,  b ,  a], [nil, nil, nil], [nil, nil, nil]]
#     1 [[ 9 ,  8 ,  7], [nil, nil, nil], [nil, nil, nil]]
#     2 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

#     3 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
#     4 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
#     5 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

#     6 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
#     7 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
#     8 [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]



# [ 1,  2,  3,   4,  5,  6,   7,  8,  9]
# [10, 11, 12,  13, 14, 15,  16, 17, 18]
# [19, 20, 21,  22, 23, 24,  25, 26, 27]

