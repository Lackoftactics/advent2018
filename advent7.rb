require 'pry'

input = File.open("advent7.txt").read.split("\n")

depends = Hash.new { |h, k| h[k] = [] }
parts = []

input.each do |line|
  dependent, part = line.match(/Step (.) must be finished before step (.) can begin/)[1..2]
  parts << dependent
  parts << part

  depends[part] << dependent
end

parts = parts.uniq

i = 0

candidates = []
result = []
seconds = 0

letters = ("A".."Z").to_a

while parts.length > 0
  curr = parts[i]

  if depends[curr].length == 0
    candidates << curr
  end

  if i == parts.length - 1
    pick = candidates.sort[0]
    candidates = []
    result << pick

    parts.delete(pick)
    depends.delete(pick)

    depends.each do |k, v|
      if v.include?(pick)
        depends[k].delete(pick)
      end
    end

    i = -1
    seconds += 1
  end

  i += 1
end

pp parts
puts result.join("")



