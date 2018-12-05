input = File.open("advent5.txt").read.split("\n")[0].split("")

i = 0

current_element = nil
previous_element = nil

#part 1
while i < input.length
  current_element = input[i]

  if i > 0
    if current_element.swapcase == previous_element
      input.delete_at(i - 1)
      input.delete_at(i - 1)

      previous_element = input[i - 2]
      i -= 2
    else
      previous_element = input[i]
    end
  else
    previous_element = input[i]
  end

  i += 1
end


#part 2
input = File.open("advent5.txt").read.split("\n")[0].split("")

polymers = ("a".."z").to_a
scores = Hash.new { 0 }

polymers.each do |pol|
  dup = input.dup
  dup = dup.delete_if { |el| el == pol || el == pol.upcase }

  i = 0
  while i < dup.length
    current_element = dup[i]

    if i > 0
      if current_element.swapcase == previous_element
        dup.delete_at(i - 1)
        dup.delete_at(i - 1)

        previous_element = dup[i - 2]
        i -= 2
      else
        previous_element = dup[i]
      end
    else
      previous_element = dup[i]
    end

    i += 1
  end

  scores[pol] = dup.length
end

scores.sort_by { |k, v| v.length }
