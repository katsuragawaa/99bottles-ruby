class Bottles
  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map(&method(:verse)).join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

class BottleVerse
  def self.lyrics(bottle_number)
    new(BottleNumber.for(bottle_number)).lyrics
  end

  attr_reader :bottle_number

  def initialize(bottle_number)
    @bottle_number = bottle_number
  end

  def lyrics
    "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}, " +
      "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.registry
    @registry ||= [BottleNumber]
  end

  def self.register(candidate)
    registry.unshift(candidate)
  end

  def self.inherited(candidate)
    super
    register(candidate)
  end

  def self.for(number)
    registry.find { |candidate| candidate.handles?(number) }.new(number)
  end

  def self.handles?(_number)
    true
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    "bottles"
  end

  def quantity
    number.to_s
  end

  def pronoun
    "one"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

class BottleNumber0 < BottleNumber
  def self.handles?(number)
    number == 0
  end

  def quantity
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def self.handles?(number)
    number == 1
  end

  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end

class BottleNumber6 < BottleNumber
  def self.handles?(number)
    number == 6
  end

  def container
    "six-pack"
  end

  def quantity
    "1"
  end
end
