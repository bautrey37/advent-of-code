# frozen_string_literal: true

gamma = 0 # most common bit
epsilon = 0 # least common bit

total = 0
sum = []

def add_to_array(sum, cur)
  return cur if sum.empty?

  (0..11).each do |i|
    sum[i] = sum[i] + cur[i]
  end

  sum
end

File.foreach('input/day03.txt') do |b|
  # join.to_i(2)
  binary = b.chomp.chars.map(&:to_i)
  puts binary.inspect

  sum = add_to_array(sum, binary)
  total += 1
end

puts sum.inspect
puts total
usage = sum.map {|s| s.to_f / total}
gamma = usage.map {|u| if u > 0.5 then 1 else 0 end }.join.to_i(2)
puts gamma
epsilon = usage.map {|u| if u < 0.5 then 1 else 0 end}.join.to_i(2)
puts epsilon

puts "Part 1: #{gamma * epsilon}"
