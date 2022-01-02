class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map(&method(:verse)).join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end
end

def container(number)
  number == 1 ? "bottle" : "bottles"
end

def pronoun(number)
  number == 1 ? "it" : "one"
end

def quantity(number)
  number == 0 ? "no more" : number.to_s
end

def action(number)
  number == 0 ? "Go to the store and buy some more" : "Take #{pronoun(number)} down and pass it around"
end

def successor(number)
  number == 0 ? 99 : number - 1
end
