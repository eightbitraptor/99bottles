class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    verses = start.downto(finish).map do |i|
      verse(i)
    end

    verses.join("\n")
  end

  def verse(bottle_count)
    <<~VERSE
      #{bottle_phrase(bottle_count).capitalize} of beer on the wall, #{bottle_phrase(bottle_count)} of beer.
      #{action_stanza(bottle_count)}, #{bottle_phrase(bottle_count - 1)} of beer on the wall.
    VERSE
  end

  private

  def bottle_phrase(bottle_count)
    bottle_count = 99 if bottle_count < 0
    {
      0 => "no more bottles",
      1 => "1 bottle"
    }.fetch(bottle_count, "#{bottle_count} bottles")
  end

  def action_stanza(bottle_count)
    {
     0 => "Go to the store and buy some more",
     1 => "Take it down and pass it around",
    }.fetch(bottle_count, "Take one down and pass it around")
  end
end
