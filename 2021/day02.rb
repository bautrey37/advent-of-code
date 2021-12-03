# frozen_string_literal: true

# Part 1
horizontal = 0
depth = 0

File.foreach('input/day02.txt') do |command|
  line = command.split

  case line[0]
  when 'forward'
    horizontal += line[1].to_i
  when 'up'
    depth -= line[1].to_i
  when 'down'
    depth += line[1].to_i
  end
end

puts "Part 1: #{depth * horizontal}"

# Part 2

horizontal = 0
depth = 0
aim = 0

File.foreach('input/day02.txt') do |command|
  line = command.split
  value = line[1].to_i

  case line[0]
  when 'forward'
    horizontal += value
    depth += value * aim
  when 'up'
    aim -= value
  when 'down'
    aim += value
  end
end

puts "Part 2: #{depth * horizontal}"
