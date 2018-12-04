require 'time'

input = File.open("advent4.txt").read.split("\n")

sorted = input.sort_by do |line|
  time = Time.parse(line.match(/\[(.+)\]/)[1])
end

current_guard = nil
start_sleep = nil
finish_sleep = nil

watcher = Hash.new { [] }
sorted.each do |line|
  time = Time.parse(line.match(/\[(.+)\]/)[1])

  if line.include?("Guard")
    current_guard = line.split("#")[1].split(" ")[0]
  elsif line.include?("asleep")
    start_sleep = time.min
  elsif line.include?("wakes up")
    finish_sleep = time.min
    watcher[current_guard] += (start_sleep...finish_sleep).to_a
  end
end

#part 1
# sleeping_beauty = watcher.sort_by { |k, v| v.length }.reverse.first
# sleeping_beauty[1].count

# group = sleeping_beauty[1].group_by { |minute| minute }
# group.sort_by { |k, v| v.length }.reverse

#part 2
top_score = 0
minute = nil
guard = nil

watcher.each do |id, minutes|
  group = minutes.group_by { |minute| minute }
  most_sleepy_time = group.sort_by { |k, v| v.length }.reverse[0]
  minute = most_sleepy_time[0]
  count = most_sleepy_time[1].length

  if count > top_score
    top_score = count
    minute = group.sort_by { |k, v| v.length }.reverse[0][0]
    guard = id
  end
end

