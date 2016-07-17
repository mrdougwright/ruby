class Sudoku

  def initialize
    @grid = Array.new(9).map{ |e| Array.new(9) }

    (1..9).to_a.shuffle.each {|num| nine_inserts(num) }
    # make_box_numbers(0,0)
    # make_box_numbers(0,3)
    # make_box_numbers(0,6)
    # make_box_numbers(3,0)
    # make_box_numbers(3,3)
    # make_box_numbers(3,6)
    # make_box_numbers(6,0)
    # make_box_numbers(6,3)
    # make_box_numbers(6,6)
  end

  def nine_inserts(number)
    x=0; y=0;
    [0,3,6].each do |x_row|
      [0,3,6].each do |y_row|
        # puts "Grid box: #{x_row}, #{y_row}"
        test_and_insert_nums(x_row, y_row, number)
      end
    end
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

#         y
#         0    1    2    3    4    5    6     7    8
#     0 [ c ,  b ,  a , nil, nil, nil, nil, nil, nil]
#     1 [ 9 ,  8 ,  7 , nil, nil, nil, nil, nil, nil]
#     2 [nil, nil,    , nil, nil, nil, nil, nil, nil]

#     3 [nil, nil,    , nil, nil, nil, nil, nil, nil]
#     4 [y-2, y-1,  42, nil, nil, nil, nil, nil, nil]
#     5 [y-1,  51, y+1, nil, nil, nil, nil, nil, nil]

#     6 [nil, nil, nil, nil, nil, nil, nil, nil, nil]
#     7 [nil, nil, nil, nil, nil, nil, nil, nil, nil]
#  x  8 [nil, nil, nil, nil, nil, nil, nil, nil, nil]


# [ 1,  2,  3,   4,  5,  6,   7,  8,  9]
# [10, 11, 12,  13, 14, 15,  16, 17, 18]
# [19, 20, 21,  22, 23, 24,  25, 26, 27]

