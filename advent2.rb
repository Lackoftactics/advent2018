input = File.open("advent2.txt").read.split("\n")

# two_repeats = 0
# three_repeats = 0

# input.each do |line|
#   letters = line.split("")

#   dups = Hash.new { 0 }

#   letters.each do |letter|
#     dups[letter] += 1
#   end

#   if dups.values.include?(2)
#     two_repeats += 1
#   end

#   if dups.values.include?(3)
#     three_repeats += 1
#   end
# end

i = 0

while i < input.length
  j = 0
  box1 = input[i]
  while j < input.length
    box2 = input[j]

    if box2 != box1
      diffs = 0

      subs = 0

      while subs < box2.length
        if box2[subs] != box1[subs]
          diffs += 1
        end

        if diffs > 1
          break;
        end

        subs += 1
      end

      puts "#{box2} & #{box1}" if diffs == 1
    end

    j += 1
  end

  i += 1
end
