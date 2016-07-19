class Sudoku

  def initialize
    # @grid = Array.new(9).map{ Array.new(9) }
    @grid = Array.new(9).map{ |e| 3.times.map{|f| Array.new(3)} }
    @grid = [
      [ [1,2,3], [9,8,7], ['x','x','x']],
      [[4,nil,6], [3,2,1], ['x','x','x']],
      [ [7,8,9], [6,5,4], ['x','x','x']]
    ]
  end


  def grid_insert(grid_index, num)
    gridbox = grid_box(grid_index)
    return false if gridbox.flatten.include?(num)
    gridbox.each do |grid_row|
      next unless grid_row.include?(nil)

    end
  end

  #grid is made up of 9 boxes(0-8) of 9 small boxes
  def grid_box(grid_index)
    # gridbox = [top 3, middle 3, bottom 3] numbers
    case grid_index
    when 0 then
      [ @grid[0][0,3], @grid[1][0,3], @grid[2][0,3] ]
    when 1 then
      [ @grid[0][3,3], @grid[1][3,3], @grid[2][3,3] ]
    end
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

