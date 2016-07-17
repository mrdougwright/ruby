class Sudoku

  def initialize
    @grid = Array.new(9).map{ |e| 3.times.map{|f| Array.new(3)} }

    (1..9).to_a.shuffle.each {|num| nine_inserts(num) }
    # make_box_numbers(0,0)
    # box 0 [[1,2,3], [4,5,6], [7,8,9]]
    # =>
    # (mini grid)
    # [1,2,3]
    # [4,5,6]
    # [7,8,9]
  end

  def nine_inserts(number)
    9.times do |sqr_index|
      next if number_in_mini_grid?(sqr_index, number)
      # test_and_insert_nums(x_row, y_row, number)
      # test_and_insert_nums(x_row, y_row, number)
    end
  end

  def number_in_mini_grid?(x_row, number)
    @grid[x_row].flatten.include?(number)
  end

  def test_and_insert_nums(x_row, y_row, number)
    number_inserted = false
    3.times do |xdex|
      break if number_inserted
      3.times do |ydex|
        number_inserted = insert_number(x_row + xdex, y_row + ydex, number)
        break if number_inserted
      end
    end
  end

  def insert_number(x, y, num)
    return false unless @grid[x][y].nil?
    if ( !x_nums(x).include?(num) && !y_nums(y).include?(num) )
      @grid[x][y] = num
      return true
    end
  end

  def box_nums(x,y) # send left corner coordinates
    box_numbers = []
    3.times do |x_row|
      3.times do |y_row|
        # puts "Grid box: #{x_row}, #{y_row}"
        box_numbers << @grid[x + x_row][y + y_row]
      end
    end
    box_numbers.compact
  end

  def y_nums(y)
    @grid.map{ |row| row[y] }.compact
  end

  def x_nums(x)
    @grid[x].compact
  end

  def one_thru_nine
    # Array.new(9){|x=1| x+=1}
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

