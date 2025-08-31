module Gameplay


  def find_match(array1, array2)
    matches = []
    array1.each_with_index do |item_one, index_one|
      array2.each_with_index do |item_two, index_two|
        if item_one == item_two && index_one == index_two
          matches << item_one
        end
      end
    end
    if matches.length > 0
      puts "#{matches.length} matches found."
    else
      puts "No matches found"
    end
  end

  def eql?(array1, array2)
    if array1 == array2
      puts "Code was broken!\n #{array1}"
      return true
    else 
      return false
    end
  end

  def color_match(array1, array2)
    matches = []
    array2.each do |item1|
      if array1.any? {|item2| item1 == item2}
        matches << item1
      end
    end
    colors_included = matches.uniq.length
    if colors_included > 0
      print "#{colors_included} colors are correct."
    else
      print "No colors are correct."
    end
  end
end
