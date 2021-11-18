class Bottles
  def verse(count)
    first_phrase(count) +
      second_phrase(count) +
      third_phrase(count) +
      last_phrase(count - 1)
  end

  def verses(start_count, end_count)
    current = start_count
    final_phrase = verse(current)
    while current > end_count
      current -= 1
      final_phrase += "\n"
      final_phrase += verse(current)
    end
    final_phrase
  end

  def song
    verses(99, 0)
  end

  private

  def bottle_or_bottles?(count)
    count > 1 ? "bottles" : "bottle"
  end

  def first_phrase(count)
    if count.positive?
      "#{count} #{bottle_or_bottles?(count)} of beer on the wall, "
    else
      "No more bottles of beer on the wall, "
    end
  end

  def second_phrase(count)
    if count.positive?
      "#{count} #{bottle_or_bottles?(count)} of beer.\n"
    else
      "no more bottles of beer.\n"
    end
  end

  def third_phrase(count)
    if count > 1
      "Take one down and pass it around, "
    elsif count.zero?
      "Go to the store and buy some more, "
    else
      "Take it down and pass it around, "
    end
  end

  def last_phrase(count)
    if count.positive?
      "#{count} #{bottle_or_bottles?(count)} of beer on the wall.\n"
    elsif count.zero?
      "no more bottles of beer on the wall.\n"
    else
      "99 bottles of beer on the wall.\n"
    end
  end
end
