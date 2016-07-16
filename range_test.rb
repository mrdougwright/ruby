class LetterMultiplier
  attr_reader :count
  include Comparable

  def initialize(letter, count)
    @letter = letter
    @count = count
  end

  def succ
    self.class.new(@letter, @count + 1)
  end

  def <=>(other)
    count <=> other.count
  end
end

a = LetterMultiplier.new('w', 2)
b = LetterMultiplier.new('w', 8)

p Array(a..b)
