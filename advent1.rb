input = File.open("advent1.txt").read.split("\n").map(&:to_i)

repeat = Hash.new { 0 }

current_sum = 0

i = 0

while i < input.length
  number = input[i]
  current_sum = current_sum + number

  repeat[current_sum] += 1

  if repeat[current_sum] > 1
   break current_sum
  end

  i += 1
  if i == input.length
    i = 0
  end
end

