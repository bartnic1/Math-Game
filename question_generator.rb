class Question_generator
  def initialize(min, max)
    @min = min
    @max = max
  end

  def new_q
    @ask = [rand(@min..@max), rand(@min..@max)]
    "What does #{@ask[0]} plus #{@ask[1]} equal?"
  end

  def ans
    @ask[0] + @ask[1]
  end
end