class Sudoku
  def initialize
    @grid = Array.new(9).map{ |e| Array.new(9) }
    @grid[0] = random_num_array
  end

  def build
    [1,2,3,4,5,6,7,8].each do |ind|
      sorted_placement(ind)
    end
    p @grid
  end

  def sorted_placement(index)
    new_nums = random_num_array

    while new_nums.size > 0
      counter = new_nums.size - 1

      # if @grid[index][counter].nil?

        new_nums.each do |num|
          unless @grid[index-1][counter] == num
            @grid[index][counter] = num
            new_nums.delete(num)
            break
          end
        end

      # end
    end
  end


  # private

  def random_num_array
    [1,2,3,4,5,6,7,8,9].shuffle
  end
end
