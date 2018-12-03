input = File.open("advent3.txt").read.split("\n")

fabric = Array.new(1_000) { Array.new(1_000) { nil } }
# fabric = Array.new(1_000, Array.new(1_000))

input.each do |el|
  format = el.split("@ ")
  id = format[0]
  loc, size = format[1].split(": ")
  left, top = loc.split(",").map(&:to_i)
  width, height = size.split("x").map(&:to_i)

  puts "left is #{left}, top is #{top}"
  puts "width is #{width}"

  height.times do |i|
    width.times do |j|
      if fabric[top + i][left + j].nil?
        # puts "filling #{top +i} #{left + j}"
        fabric[top + i][left + j] = id
      else
        # puts "filling #{top +i} #{left + j}"
        fabric[top + i][left + j] = "x"
      end
    end
  end
end

not_broken = nil
input.each do |el|
  format = el.split("@ ")
  id = format[0]
  loc, size = format[1].split(": ")
  left, top = loc.split(",").map(&:to_i)
  width, height = size.split("x").map(&:to_i)

  puts "left is #{left}, top is #{top}"
  puts "width is #{width}"

  broken = false
  height.times do |i|
    width.times do |j|
      if fabric[top + i][left + j] != id
        broken = true
      end
    end
  end


  if !broken
    not_broken = id
  end
end



count = 0
fabric.each do |line|
  line.each do |inch|
    if inch == "x"
      count += 1
    end
  end
end
