class Sudoku
  def initialize
    @grid = Array.new(9).map{ |e| Array.new(9) }
    make_box_numbers(0,0)
    make_box_numbers(0,3)
    make_box_numbers(0,6)
    # make_box_numbers(3,0)
    # make_box_numbers(3,3)
    # make_box_numbers(3,6)
    # make_box_numbers(6,0)
    # make_box_numbers(6,3)
    # make_box_numbers(6,6)
  end

  def insert_number(x, y, num)
    return false unless @grid[x][y].nil?
    if ( !get_x_numbers(x).include?(num) && !get_y_numbers(y).include?(num) )
      @grid[x][y] = num
      return true
    end
  end

  def make_box_numbers(x,y)
    # return unless modulo 3, 0 for x, y ...
    numbers = one_thru_nine.shuffle

    numbers.each do |number|
      number_inserted = false
      3.times do |xdex|
        break if number_inserted
        3.times do |ydex|
          number_inserted = insert_number(x + xdex, y + ydex, number)
          break if number_inserted
        end
      end
    end
  end


  def get_y_numbers(y)
    @grid.map{ |row| row[y] }.compact
  end

  def get_x_numbers(x)
    @grid[x].compact
  end

  def one_thru_nine
    (1..9).map{|f| f}
  end

  def print_grid
    puts "~~~~~~~~~~~ Sudoku! ~~~~~~~~~~~"
    @grid.each{ |row| p row }
    puts "^^^^^^^^^^^ Sudoku! ^^^^^^^^^^^"
  end
end

Sudoku.new.print_grid

#         y
#        0     1    2    3    4    5    6     7    8
#     0 [ 1 ,  2 ,  3 , nil, nil, nil, nil, nil, nil]
#     1 [ 9 ,  8 ,  7 , nil, nil, nil, nil, nil, nil]
#     2 [nil, nil,    , nil, nil, nil, nil, nil, nil]

#     3 [nil, nil,    , nil, nil, nil, nil, nil, nil]
#     4 [y-2, y-1,  42, nil, nil, nil, nil, nil, nil]
#     5 [y-1,  51, y+1, nil, nil, nil, nil, nil, nil]

#     6 [nil, nil, nil, nil, nil, nil, nil, nil, nil]
#     7 [nil, nil, nil, nil, nil, nil, nil, nil, nil]
#  x  8 [nil, nil, nil, nil, nil, nil, nil, nil, nil]
