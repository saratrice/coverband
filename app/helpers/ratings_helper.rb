module RatingsHelper
  
  def number_to_word(i)
    case i
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    when 5
      "five"
    end
  end

end
