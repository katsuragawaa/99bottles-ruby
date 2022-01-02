class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map(&method(:verse)).join("\n")
  end

  def verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, " +
        "no more bottles of beer.\n" +
        "Go to the store and buy some more, " +
        "99 bottles of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, " +
        "#{number} #{container(number)} of beer.\n" +
        "Take #{pronoun(number)} down and pass it around, " +
        "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall.\n"
    end
  end
end

def container(number)
  number == 1 ? "bottle" : "bottles"
end

def pronoun(number)
  number == 1 ? "it" : "one"
end

def quantity(number)
  number == 0 ? "no more" : number
end
