class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    number == 1 ? "bottle" : "bottles"
  end
end